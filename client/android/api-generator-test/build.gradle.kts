import com.android.build.gradle.internal.tasks.factory.dependsOn
import groovy.json.JsonOutput
import com.yandex.div.gradle.pythonExecutableName

plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

val generatedSrcDir = File(buildDir, "generated/source/generator")
val projectDir = project.projectDir
val divKitPublicDir = "${projectDir}/../../.."
val testDataPath = "${divKitPublicDir}/test_data"

apply(from = "${projectDir}/../div-library.gradle")
apply(from = "${projectDir}/../div-tests.gradle")

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
    kotlinOptions {
        freeCompilerArgs = listOf("-Xjvm-default=all")
        languageVersion = "1.6"
        apiVersion = "1.6"
    }
}

android {
    namespace = "com.yandex.generator"

    buildFeatures { buildConfig = true }

    sourceSets.getByName("main") {
        java.srcDir(generatedSrcDir)
    }

    buildToolsVersion = rootProject.ext["buildToolsVersion"] as String
    compileSdk = rootProject.ext["compileSdkVersion"] as Int

    defaultConfig {
        minSdk = rootProject.ext["minSdkVersion"] as Int
        targetSdk = rootProject.ext["targetSdkVersion"] as Int
        buildConfigField("String", "TEMPLATES_JSON_PATH", JsonOutput.toJson(testDataPath))
    }

    project.tasks.preBuild.dependsOn("generateHomePojoTask")

    testOptions {
        unitTests {
            all {
                it.jvmArgs = listOf("-noverify")
                it.testLogging {
                    events("passed", "skipped", "failed", "standardOut", "standardError")
                }
            }
            isIncludeAndroidResources = true
        }
    }
}

dependencies {
    implementation(project(":assertion"))
    implementation(project(":div-core"))
    implementation(project(":div-json"))
    implementation(project(":div-data"))
}


val schemes = listOf(
    mapOf(
        "name" to "testing",
        "scheme" to File(testDataPath, "test_schema"),
        "generated" to "${generatedSrcDir.absolutePath}/com/yandex/testing",
        "config" to File(projectDir, "testing-generator-config.json")
    )
)

schemes.forEach { item ->
    tasks.register<Exec>("scheme_${item["name"]}") {
        val schemesDirectory = (item["scheme"] as File).absolutePath
        val generatedDir = File(item["generated"] as String).absolutePath
        val configPath = (item["config"] as File).absolutePath

        workingDir = File("../../../api_generator")

        commandLine = listOf(pythonExecutableName, "-m", "api_generator", "-c", configPath, "-s", schemesDirectory, "-o", generatedDir)

        inputs.dir(item["scheme"]!!)
        inputs.file(item["config"]!!)
        outputs.dir(generatedDir)
    }
}

tasks.register("generateHomePojoTask") {
    dependsOn(provider {
        tasks.filter { task -> task.name.startsWith("scheme_") }
    })
}

// Generated code. Do not modify.

package com.yandex.div2

import org.json.JSONObject

class EntityWithOptionalProperty(
    @JvmField final val property: Expression<String>? = null, // at least 1 char
) {

    companion object {
        const val TYPE = "entity_with_optional_property"

        private val PROPERTY_TEMPLATE_VALIDATOR = ValueValidator<String> { it: String -> it.length >= 1 }
        private val PROPERTY_VALIDATOR = ValueValidator<String> { it: String -> it.length >= 1 }
    }

}

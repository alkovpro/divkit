package com.yandex.div.utils

import android.net.Uri
import com.yandex.div.core.DivActionHandler
import com.yandex.div.core.DivViewFacade
import com.yandex.div.core.action.DivActionInfo

private const val DIV_UI_TEST_SCHEME = "ui-test"
private const val CLICK_ACTION_HOST = "click"
private const val CLICK_TYPE_PARAM = "type"
private const val CLICK_DESCRIPTION_PARAM = "description"

class UiTestDivActionHandler(
    private val onClick: ((clickType: String, description: String) -> Unit)? = null
) : DivActionHandler() {
    override fun handleAction(info: DivActionInfo, view: DivViewFacade): Boolean {
        val url = info.url ?: return false
        if (url.scheme == DIV_UI_TEST_SCHEME) {
            handleDemoActionUrl(url, view)
            return true
        }
        return super.handleAction(info, view)
    }

    private fun handleDemoActionUrl(url: Uri, view: DivViewFacade) {
        if (url.host == CLICK_ACTION_HOST) {
            val clickType = url.getQueryParameter(CLICK_TYPE_PARAM)
            val description = url.getQueryParameter(CLICK_DESCRIPTION_PARAM)
            if (clickType != null && description != null) {
                onClick?.invoke(clickType, description)
            }
        }
    }
}

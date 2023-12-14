import sentry_sdk
from appium.webdriver.common.appiumby import AppiumBy

def test_unhandledpromiserejection_react_native_android(android_react_native_emu_driver):

    try:
        # click into list app screen
        android_react_native_emu_driver.find_element(AppiumBy.ACCESSIBILITY_ID, 'LIST APP').click()

        # trigger error
        btn = android_react_native_emu_driver.find_element(AppiumBy.XPATH, '//android.widget.TextView[@text="Unhandled Promise Rejection"]')
        btn.click()

    except Exception as err:
        sentry_sdk.capture_exception(err)

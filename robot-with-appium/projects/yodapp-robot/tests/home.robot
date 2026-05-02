*** Settings ***

Library    AppiumLibrary


*** Variables ***
${ANDROID_APP}                ${EXECDIR}/app/yodapp-beta.apk



*** Test Cases ***

Should open main screen
    Open Test Application
    
    Wait Until Page Contains    text=Yodapp    error="Application name not appears"
    Wait Until Page Contains    text=Mobile Training

    Close Application


*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723  
  ...     platformName=Android
  ...     deviceName=Android Emulator
  ...     automationName=UIAutomator2
  ...     app=${ANDROID_APP}
  ...     udid=emulator-5554
  ...     autoGrantPermissions=true   


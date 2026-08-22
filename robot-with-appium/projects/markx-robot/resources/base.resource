*** Settings ***

Library     AppiumLibrary
Library     libs/mongo.py

Resource    env.resource

Resource    screens/${PLATFORM}/login.resource
Resource    screens/${PLATFORM}/tasks.resource


*** Variables ***
# App IP
${IP}    192.168.68.113


*** Keywords ***

Start session
    Run Keyword If    '${PLATFORM}' == 'android'
        ...     Open Application  http://localhost:4723  
        ...     automationName=UIAutomator2
        ...     platformName=Android
        ...     deviceName=Android Emulator
        ...     udid=emulator-5554
        ...     autoGrantPermissions=true 
        ...     app=${EXECDIR}/apps/markx.apk

    
    Run Keyword If    '${PLATFORM}' == 'ios'
    ...     Open Application  http://localhost:4723  
    ...     automationName=XCUITest
    ...     platformName=iOS
    ...     deviceName=iPhone 14 Pro
    ...     udid=emulator-5554
    ...     autoAcceptedAlerts=true 
    ...     platformVersion=16.4
    ...     bundleId=com.qaxperience.markx
    ...     app=${EXECDIR}/apps/markx.app

    Wait Until Page Contains    Endereço IP da Api    timeout=10


Finish session
    [Arguments]    ${image_name}
    
    Sleep                            5
    Capture Page Screenshot          filename=${image_name}.png
    Close Application

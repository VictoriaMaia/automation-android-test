*** Settings ***

Library     AppiumLibrary
Library     libs/mongo.py

Resource    screens/login.resource
Resource    screens/tasks.resource


*** Variables ***
# App IP
${IP}    192.168.68.113


*** Keywords ***

Start session
    Open Application  http://localhost:4723  
    ...     automationName=UIAutomator2
    ...     platformName=Android
    ...     deviceName=Android Emulator
    ...     udid=emulator-5554
    ...     autoGrantPermissions=true 
    ...     app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api    timeout=10


Finish session
    [Arguments]    ${image_name}
    
    Sleep                            5
    Capture Page Screenshot          filename=${image_name}.png
    Close Application

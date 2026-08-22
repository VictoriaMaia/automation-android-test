*** Settings ***

Resource    ../resources/base_resource.robot


*** Variables ***
# App IP
${IP}    192.168.68.113

*** Test Cases ***
# The id not works because the application was developed 
# in react native, duo this we need use the xpath!

You should be logged successfully
    
    Open Application  http://localhost:4723  
    ...     automationName=UIAutomator2
    ...     platformName=Android
    ...     deviceName=Android Emulator
    ...     udid=emulator-5554
    ...     autoGrantPermissions=true 
    ...     app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api    timeout=10

    Input Text       xpath=//*[@resource-id="apiIp"]    text=${IP}
    Click Element    xpath=//*[@resource-id="signInButton"]

    Wait Until Page Contains    Minhas tarefas    timeout=5

    Close Application

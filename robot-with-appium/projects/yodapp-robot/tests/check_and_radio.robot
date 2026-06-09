*** Settings ***

Library        AppiumLibrary
Resource       ../resources/variables.robot
Resource       ../resources/app_resources.robot

Test Setup       Start session           
Test Teardown    Close Test Application    image_name=${TEST NAME}

*** Test Cases ***
Go to "Check e Radio" screen and Fill the checkbox options that use Appium
    
    Go to Check e Radio screen
    Go to Checkbox and validate if Marque as techs que usam Appium appears
    
    @{techs}    Create List    Ruby    Python    Java    Javascript    C#    Robot Framework

    FOR    ${tech}    IN    @{techs}
        Select in the list of checkbox the option    option=${tech}
    END
    
    FOR    ${tech}    IN    @{techs}
        ${status}=     Get the status of checkbox    checkbox_name=${tech}
        Should Be Equal    ${status}    true
    END


Go to "Check e Radio" screen and Fill the radio option of favorite language

    Go to Check e Radio screen
    Go to Botões de radio and validate if Escolha sua linguagem preferida appears

    ${favorite_laguage}    Set Variable    Python

    ${status}=    Get the status of radio    option=${favorite_laguage}
    Should Not Be True    ${status}

    Click Element    xpath=//android.widget.RadioButton[@resource-id="com.qaxperience.yodapp:id/radioButton" and @text="${favorite_laguage} "]

    ${status}=    Get the status of radio    option=${favorite_laguage}
    Should Be True    ${status}
*** Settings ***

Library     AppiumLibrary
Resource    ../resources/variables.robot

*** Keywords ***
Start session
    [Documentation]    Open the application and go to home screen

    Open Application  http://127.0.0.1:4723  
    ...     platformName=Android
    ...     deviceName=Android Emulator
    ...     automationName=UIAutomator2
    ...     app=${ANDROID_APP}
    ...     udid=emulator-5554
    ...     autoGrantPermissions=true   

    Wait Until Page Contains    text=${START_BUTTON}    timeout= 10    error="The QAX button not appears"
    Click Text                  text=${START_BUTTON}


Close Test Application
    [Arguments]    ${image_name}
    
    Sleep                            5
    Capture Page Screenshot          filename=${image_name}.png
    Close Application
    

Go to Navigator menu
    Wait Until Element Is Visible    ${NAVIGATOR_MENU_ICON}    timeout=10
    Click Element                    locator=${NAVIGATOR_MENU_ICON}


Go to ${screen_name} screen

    Go to Navigator menu

    ${screen_xpath}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]//*[@text="${screen_name}"]

    Wait Until Element Is Visible    locator=${screen_xpath}    timeout=5    error="The button not appears"
    Click Element                    locator=${screen_xpath}


Go to ${item_name} and validate if ${checkpoint} appears

    Wait Until Page Contains         text=${item_name}    timeout=5    error="The ${item_name} not appears"
    Click Text                       text=${item_name}

    Wait Until Page Contains         text=${checkpoint}    timeout=5    error="The ${checkpoint} not appears"


Select in the list of checkbox the option
    [Arguments]    ${option}

    ${option_xpath}    Set Variable    xpath=//android.widget.CheckBox[@resource-id="com.qaxperience.yodapp:id/checkboxButton" and contains(@text, "${option}")]
    Click Element    locator=${option_xpath}


Get the status of checkbox
    [Arguments]    ${checkbox_name}
    
    ${option_xpath}    Set Variable    xpath=//android.widget.CheckBox[@resource-id="com.qaxperience.yodapp:id/checkboxButton" and @text="${checkbox_name} "]
    ${status}=    Get Element Attribute    locator=${option_xpath}    attribute=checked
    
    RETURN    ${status}


Get the status of radio
    [Arguments]    ${option}
    
    ${option_xpath}    Set Variable    xpath=//android.widget.RadioButton[@resource-id="com.qaxperience.yodapp:id/radioButton" and @text="${option} "]
    ${status}=    Get Element Attribute    locator=${option_xpath}    attribute=checked
    
    IF    '${status}' == 'true'
        RETURN    ${True}
    END

    RETURN    ${False}
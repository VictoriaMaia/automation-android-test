*** Settings ***

Library        AppiumLibrary
Resource       ../resources/variables.robot
Resource       ../resources/app_resources.robot

*** Test Cases ***

Open the app and Go to the navigator menu
    Open Application  http://127.0.0.1:4723  
    ...     platformName=Android
    ...     deviceName=Android Emulator
    ...     automationName=UIAutomator2
    ...     app=${ANDROID_APP}
    ...     udid=emulator-5554
    ...     autoGrantPermissions=true 
    
    Wait Until Page Contains    text=${START_BUTTON}    timeout= 10    error="The QAX button not appears"
    Click Text                  text=${START_BUTTON}

    ${navigator_menu_icon}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    
    Wait Until Element Is Visible    ${navigator_menu_icon}
    Click Element                    locator=${navigator_menu_icon}
    Sleep                            5
    Capture Page Screenshot          filename=menu.png

    Close Application


Go to "Botão clique simples" screen and Do a simple click
    Start session
    Go to Navigator menu

    Wait Until Element Is Visible    locator=${CLIQUE_BOTOES_OPTION}    timeout=5    error="The button not appears"
    Click Element                    locator=${CLIQUE_BOTOES_OPTION}
    
    Wait Until Page Contains         text=Clique simples
    Click Text                       text=Clique simples
    Wait Until Page Contains         text=Botão clique simples

    Click Text                       text=CLIQUE SIMPLES
    Wait Until Page Contains         text=Isso é um clique simples

    Close Test Application           image_name=test_simple_click


Go to "Botão clique longo" screen and Do a long click
    [Tags]    broken
    [Teardown]    Close Test Application    image_name=test_long_click
    
    Start session
    Go to Clique em Botões screen
    Go to Clique longo and validate if Botão clique longo appears

    ${locator}        Set Variable    id=com.qaxperience.yodapp:id/long_click
    ${positions}      Get Element Location    locator=${locator}
    Tap With Positions    1s    ${${positions}[x], ${positions}[y]}

    Wait Until Page Contains         text=Isso é um clique longo

    

*** Settings ***
Documentation    Elements and actions of login screen

Library    AppiumLibrary


*** Keywords ***

Do login
    [Arguments]    ${ip}

    Input Text       accessibility_id=apiIp    text=${ip}
    Click Element    accessibility_id=signInButton
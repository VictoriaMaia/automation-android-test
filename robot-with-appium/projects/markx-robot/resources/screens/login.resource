*** Settings ***
Documentation    Elements and actions of login screen

Library    AppiumLibrary


*** Keywords ***

Do login
    [Arguments]    ${ip}

    Input Text       xpath=//*[@resource-id="apiIp"]    text=${ip}
    Click Element    xpath=//*[@resource-id="signInButton"]
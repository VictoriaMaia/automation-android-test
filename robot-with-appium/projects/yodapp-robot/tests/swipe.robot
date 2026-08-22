*** Settings ***

Library        AppiumLibrary
Resource       ../resources/variables.robot
Resource       ../resources/app_resources.robot

Test Setup       Start session           
Test Teardown    Close Test Application    image_name=${TEST NAME}

*** Test Cases ***

You should be able to remove the Darth Vader 
    
    Go to Star Wars screen
    Go to Lista and validate if Darth Vader appears

    ${positions}    Get Element Location    xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]


    ${start_x}     Set Variable    ${positions}[x]
    ${start_y}     Set Variable    ${positions}[y]
    ${offset_x}    Evaluate        ${positions}[x] - 650
    ${offset_y}    Set Variable    ${positions}[y]

    Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${offset_x}    end_y=${offset_y}    duration=10ms

    Click Element    id=com.qaxperience.yodapp:id/btnRemove

    Wait Until Page Does Not Contain    text=Dath Vader
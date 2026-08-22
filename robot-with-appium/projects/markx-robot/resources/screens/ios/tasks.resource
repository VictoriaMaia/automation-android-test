*** Settings ***
Documentation    Elements and actions of my task screen

Library    AppiumLibrary

*** Variables ***

${new_task_input}           accessibility_id=newTask
${registration_task_bnt}    accessibility_id=createTask



*** Keywords ***
Create a new task
    [Arguments]    ${task_name}
   
    Wait Until Element Is Visible    ${new_task_input}    timeout=5

    Input Text       ${new_task_input}    text=${task_name}
    Click Element    ${registration_task_bnt}

    Close Keyboard


Should have task 
    [Arguments]    ${task name}

    Wait Until Element Is Visible
    ...    xpath=//*[@name="taskText"][@value="${task name}"]
    ...    timeout=5
    

Remove task by name
    [Arguments]    ${task}

    ${trash_btn}        Set Variable    xpath=//*[@value="${task}"]/../..//*[@name="removeTask"]
    ${yes_to_remove}    Set Variable    xpath=//XCUIElementTypeButton[@name="Sim"]

    Click Element    ${trash_btn}

    Wait Until Element Is Visible    ${yes_to_remove}  
    Click Element                    ${yes_to_remove}


Finish ${task} task
    Click Element    xpath=//*[@value="${task}"]/..//*[@name="taskTodo"]

Task should be done
    [Arguments]    ${task}
    Wait Until Element Is Visible    xpath=//*[@value="${task}"]/..//*[@name="taskTodo"]


# Helpers
Close Keyboard
    ${return}    Set Variable    xpath=//XCUIElementTypeButton[@name="Return"]

    Wait Until Element Is Visible    ${return}
    Click Element                    ${return}

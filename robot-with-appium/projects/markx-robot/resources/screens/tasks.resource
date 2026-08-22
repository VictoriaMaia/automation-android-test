*** Settings ***
Documentation    Elements and actions of my task screen

Library    AppiumLibrary

*** Variables ***

${new_task_input}           xpath=//*[contains(@text, "nova tarefa")]
${registration_task_bnt}    xpath=//*[@resource-id="createTask"]



*** Keywords ***
Create a new task
    [Arguments]    ${task_name}
   
    Wait Until Element Is Visible    ${new_task_input}    timeout=5

    Input Text       ${new_task_input}    text=${task_name}
    Click Element    ${registration_task_bnt}


Should have task 
    [Arguments]    ${task name}

    Wait Until Element Is Visible
    ...    xpath=//*[@resource-id="taskText"][@text="${task name}"]
    ...    timeout=5
    

Remove task by name
    [Arguments]    ${task}

    ${trash_btn}        Set Variable    xpath=//*[@text="${task}"]/../..//*[@resource-id="removeTask"]
    ${yes_to_remove}    Set Variable    xpath=//android.widget.Button[@text="SIM"]

    Click Element    ${trash_btn}

    Wait Until Element Is Visible    ${yes_to_remove}  
    Click Element                    ${yes_to_remove}


Finish ${task} task
    Click Element    xpath=//*[@text="${task}"]/..
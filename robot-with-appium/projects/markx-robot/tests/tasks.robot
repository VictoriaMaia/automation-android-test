*** Settings ***
Documentation    Test suite for task registration

Resource    ../resources/base.resource

Test Setup       Run Keywords   
...                    Start session     AND    
...                    Do login    ip=${IP}        

Test Teardown    Finish session    image_name=${TEST NAME}


*** Test Cases ***
Recording task
    # You can search a element with differents forms, like:
    # //*[@text="Informe a sua nova tarefa"]
    # //*[contains(@text, "nova tarefa")]
    # //android.widget.EditText[contains(@text, "tarefa")]

    ${task}    Set Variable    Estudar Python

    Create a new task    task_name=${task}
    Should have task     task name=${task}

    Remove task from DB    task_name=${task}

    
Removing task
    ${task}             Set Variable    Comprar refrizin
    
    # Given I have a undesirable task
    Create a new task    task_name=${task}
    Should have task     task name=${task}

    # When I remove it
    Remove task by name    ${task}
    
    # So the task is gone
    Wait Until Page Does Not Contain    ${task}


Updating task
    ${task}             Set Variable    Estudar XPath
    
    Create a new task    task_name=${task}
    Should have task     task name=${task}

    Finish Estudar XPath task
    Wait Until Element Is Visible    xpath=//*[@text="${task}"]/..//android.widget.ImageView

*** Settings ***
Documentation    Login tests

Resource    ../resources/base.resource

Test Setup       Start session           
Test Teardown    Finish session    image_name=${TEST NAME}


*** Test Cases ***
# The id not works because the application was developed 
# in react native, duo this we need use the xpath!

You should be logged successfully
    Do login    ip=${IP}
    
    Wait Until Page Contains    Minhas tarefas    timeout=5
    
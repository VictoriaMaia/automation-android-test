*** Settings ***

Library        AppiumLibrary
Resource       ../resources/variables.robot
Resource       ../resources/app_resources.robot

Test Setup       Start session           
Test Teardown    Close Test Application    image_name=${TEST NAME}

*** Test Cases ***

Create a new Jedi account
    
    Go to Formulários screen
    Go to Cadastro and validate if Crie sua conta appears
   
    Click Element    id=com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible    class=android.widget.ListView
    Click Text       Jedi


Create a new Padawan account
    
    Go to Formulários screen
    Go to Cadastro and validate if Crie sua conta appears
    Select level from create account    level=Padawan
   
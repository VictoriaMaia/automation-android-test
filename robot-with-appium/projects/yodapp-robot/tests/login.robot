*** Settings ***

Library        AppiumLibrary
Resource       ../resources/variables.robot
Resource       ../resources/app_resources.robot

Test Setup       Start session           
Test Teardown    Close Test Application    image_name=${TEST NAME}

*** Test Cases ***

Login with correct credentials
    
    Go to Formulários screen
    Go to Login and validate if Olá Padawan, vamos testar o login? appears
    
    Input Text       locator=id=com.qaxperience.yodapp:id/etEmail      text=yoda@qax.com
    Input Text       locator=id=com.qaxperience.yodapp:id/etPassword   text=jedi
    Click Element    locator=id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    text=Boas vindas, logado você está.


Login with wrong credentials
    
    Go to Formulários screen
    Go to Login and validate if Olá Padawan, vamos testar o login? appears
    
    Input Text       locator=id=com.qaxperience.yodapp:id/etEmail      text=yoda@qax.com
    Input Text       locator=id=com.qaxperience.yodapp:id/etPassword   text=sith
    Click Element    locator=id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    text=Oops! Credenciais incorretas.
*** Settings ***
Documentation        Arquivo que representa a tela de login

Library    AppiumLibrary

*** Variables ***
${API_URL}        http://192.168.1.129:3333

*** Keywords ***
Login with Student ID 
    [Arguments]        ${student_id}

    Input Text    xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]    ${API_URL}    
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    timeout=5
    Input Text    xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    ${student_id}
    
    Click Text    Entrar
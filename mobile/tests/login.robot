*** Settings ***
Documentation        Suite de testes de login

Resource    ../resources/base.resource

Test Setup       Start App
Test Teardown    Finish App

# robot -d ./logs tests/

*** Variables ***
${error_401}       Acesso não autorizado! Entre em contato com a equipe de atendimento. 

*** Test Cases ***
Deve logar com sucesso
    
    ${falcao}        Get Fixture        falcao

    Login with Student ID    ${falcao}[student][id]
    Wait Until Page Contains    Olá, ${falcao}[student][name]!

Código de aluno incorreto
    
    Login with Student ID       9999
    Wait Until Page Contains    ${error_401}

Código de aluno negativo
    Login with Student ID       -1
    Wait Until Page Contains    ${error_401}

Código de aluno alphanumérico
    Login with Student ID            abc123
    Wait Until Page Contains    ${error_401}    timeout=5

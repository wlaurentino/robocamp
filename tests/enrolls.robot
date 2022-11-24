*** Settings ***
Documentation        Suite de testes de matricula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia
# robot -d ./logs tests/

Resource    ../resources/base.resource

Library    JSONLibrary


*** Test Cases ***
Deve matricular um aluno

    ${admin}      Get Fixture    admin

    ${student}    Get Fixture    student

    Reset Student Enroll        ${student}[email]
    Do Login                    ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date
    Submit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso 

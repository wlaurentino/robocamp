*** Settings ***
Documentation        Consumindo a rota students da API REST

Library        RequestsLibrary
Resource    ../base.resource

*** Keywords ***
POST new student
    [Arguments]        ${token}        ${student}
    
    ${headers}     Create Dictionary        Authorization=${token}

    ${response}    POST        http://localhost:3333/students
    ...                        json=${student}
    ...                        headers=${headers}
    ...                        expected_status=201

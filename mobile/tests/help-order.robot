*** Settings ***
Documentation        Suite de testes de pedido de ajuda

Resource    ../resources/base.resource
Resource    ../resources/services/enrolls.resource

Test Setup       Start App
Test Teardown    Finish App

# robot -d ./logs tests/

*** Test Cases ***

Deve poder solicitar ajuda

    ${admin}         Get Fixture    admin
    ${laurentino}    Get Fixture    laurentino     

    Reset Student        ${laurentino}[student][email]

    ${token}             Get Service Token    ${admin}
    ${student_id}        POST new student     ${token}    ${laurentino}[student]
    
    POST new enroll      ${token}             ${student_id}
    
    Login with Student ID            ${student_id}
    Confirm Popup
    Go To Help Order
    Submit Help Order                ${laurentino}[help]
    Wait Until Page Contains         Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.

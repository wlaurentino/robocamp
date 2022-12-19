*** Settings ***
Documentation        Suite de testes de recebimento de pedido de ajuda
Resource    ../resources/base.resource

*** Test Cases ***
Deve receber notificação de pedido de ajuda

    # Dado que tenho um aluno válido
    
    ${admin}       Get Fixture    admin 
    ${joao}        Get Fixture    joao

    Reset Student       ${joao}[student][email]

    ${token}            Get Service Token   ${admin}
    ${student_id}       POST new student    ${token}    ${joao}[student]

    # Quando esse aluno envia um pedido de ajuda via mobile

    POST Question    ${student_id}    ${joao}[question]

    # Então devo ver uma notificação no painel do administrador

    Do Login    ${admin}
    Open Notifications
    Notification Should Be    ${joao}[question]
    
    Take Screenshot

Deve poder responder um pedido de ajuda
    [Tags]    help
    # Desafio final
    # Prazo: Dia 20 de Dezembro
    
    # Dado que abri um novo pedido de ajuda
    ${admin}              Get Fixture    admin 
    ${wlaurentino}        Get Fixture    wlaurentino

    Reset Student       ${wlaurentino}[student][email]

    ${token}            Get Service Token   ${admin}
    ${student_id}       POST new student    ${token}    ${wlaurentino}[student]

    POST Question    ${student_id}    ${wlaurentino}[question]


    # Quando respondo esse pedido
    Do Login          ${admin}
    Open Notifications
    Click             css=p >> text=${wlaurentino}[question]
    Click             css=form[id="answer"]
    Fill Text         css=textarea[id="answer"]    dieta+musculação+cardio
    Click             css=button[type="submit"]

    # Então devo ver uma mensagem de sucesso
    Verify Toaster    Resposta enviada com sucesso
    Take Screenshot

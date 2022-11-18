*** Settings ***

Library    Browser

*** Keywords ***

Fill Credentials
    [Arguments]     ${email}        ${pass}
    
    Fill Text       css=input[name=email]            ${email}
    Fill Text       css=input[name=password]         ${pass}

Submit Credentials

    Click           css=button >> text=Entrar no sistema

Go To Login Page

    New Browser     headless=False    browser=chromium
    New Page        http://localhost:3000/

Field Type Should Be Email

    Get Attribute          css=input[placeholder="Seu e-mail"]    
    ...                    type        equal        email

Alert Text Should Be
    [Arguments]        ${field}        ${expected_text}

    Get Text           xpath=//input[@type="${field}"]/..//span
    ...                equal         ${expected_text}

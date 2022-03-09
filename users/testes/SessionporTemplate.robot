*Settings*
Documentation    Session route test suite
Resource         ${EXECDIR}/users/resources/Base.robot

*Variables*
&{inv_pass}       email=paulinha.jampa@gmail.com    password=abc123
&{inv_email}      email=kate.com.br                 password=abc123
&{email_404}      email=kate@404.com                password=abc123
&{empty_email}    email=${EMPTY}                    password=abc123
&{wo_email}       password=abc123
&{empty_pass}     email=paulinha.jampa@gmail.com    password=${EMPTY}
&{wo_pass}        email=paulinha.jampa@gmail.com

*Test Cases*
User session

    ${payload}    Create Dictionary    email=paulinha.jampa@gmail.com    password=paula1983

    ${response}    POST Session    ${payload}

    Status Should Be    200    ${response}

    ${size}             Get Length            ${response.json()}[token]
    ${expected_size}    Convert To Integer    140

    Should Be Equal    ${expected_size}    ${size}
    Should Be Equal    10d                 ${response.json()}[expires_in] 

Should Not Get Token
    [Template]    Attempt POST Session

    ${inv_pass}       401    Invalid password
    ${inv_email}      401    User does not exists
    ${email_404}      401    User does not exists
    ${empty_email}    401    User does not exists
    ${empty_pass}     401    Invalid password


*Keywords*
Attempt POST Session
    [Arguments]    ${payload}    ${status_code}    ${error_message}

    ${response}    POST Session    ${payload}

    Status Should Be    ${status_code}      ${response}
    Should Be Equal     ${error_message}    ${response.json()}[error]
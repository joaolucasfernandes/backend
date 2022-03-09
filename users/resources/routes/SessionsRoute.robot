*Settings*
Documentation   Rota de sessão

*Keywords*
POST session  
    [Arguments]     ${payload}

    ${response}     POST
    ...             ${API_URL}/sessions
    ...             json=${payload}
    ...             expected_status=any

    [return]    ${response} 
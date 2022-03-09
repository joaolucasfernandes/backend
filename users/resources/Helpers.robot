*Settings*
Documentation           Helpers

*Keywords*
Get token   
    [Arguments]     ${user}
    
    ${payload}      Create Dictionary       email=${user}[email]           password=${user}[password]

    ${response}     POST Session            ${payload}
    ${Result}       Set Variable            ${EMPTY}

    IF  "200" in "${response}"
        ${Result}        Set Variable        Bearer ${response.json()}[token]
       
    END 
    [Return]         ${Result}



Remove User
    [Arguments]     ${user}
    ${token}        Get token  ${user}

    IF  "${token}"
        DELETE User    ${token}
    END 
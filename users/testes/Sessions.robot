*Settings*
Documentation    Sessão 

Resource   ${EXECDIR}/users/resources/Base.robot
         

*Test Cases*
Sessão de usuário válido
 # Dado que temos um usuário cadastrado
    ${payload}      Factory User Session    signup
    POST User     ${payload}
    
    ${payload}      Factory User Session    login

    # Quando faço uma requisição POST na rota /sessions
    ${response}     POST Session   ${payload}

    # Então o status code deve ser 200
    Status Should Be        200                     ${response}
    
    # E deve gerar um token JWT
    ${size}                 Get Length              ${response.json()}[token]
    ${expected_size}        Convert To Integer      140

    Should Be Equal         ${expected_size}        ${size}
    
    # E esse token deve expirar em 10 dias
    Should Be Equal         10d                     ${response.json()}[expires_in] 


Usuário não existe
    
    ${payload}                Create Dictionary         email=paulinha.jampakkkkkk@gmail.com    password=kkkk1983
    ${response}                POST session             ${payload}   

    Status Should Be          401                       ${response}
    Should Be equal           User does not exists      ${response.json()}[error]  


Email nulo
    
    ${payload}                Create Dictionary         email=${EMPTY}    password=kkkk1983
    ${response}                POST session   ${payload}   

    Status Should Be          401                       ${response}
    Should Be equal           User does not exists      ${response.json()}[error]  


Email formato inválido
    
    ${payload}                Create Dictionary         email=paulinha.jampa.gmail.com    password=kkkk1983
    ${response}                POST session   ${payload}   

    Status Should Be          401                       ${response}
    Should Be equal           User does not exists      ${response.json()}[error]  


SEM email
    [Tags]   sememail
    
    ${payload}                Create Dictionary                                           password=paula1983
    ${response}                POST session   ${payload}   

    Status Should Be          503                       ${response}

################## senha

Senha inválida
    
    ${payload}                Create Dictionary         email=paulinha.jampa@hotmail.com    password=kkkk1983
    ${response}                POST session   ${payload}   

    Status Should Be          401                       ${response}
    Should Be equal           Invalid password          ${response.json()}[error]  

Senha Nula 
    ${payload}                Create Dictionary         email=paulinha.jampa@hotmail.com   password=${EMPTY}
    ${response}               POST session   ${payload}   

    Status Should Be          401                       ${response}
    Should Be equal           Invalid password          ${response.json()}[error]  


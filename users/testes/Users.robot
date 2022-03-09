*Settings*
Documentation    Users route test suite
Resource         ${EXECDIR}/backend/users/resources/Base.robot

*Test Cases*
Add new user

    ${user}        factory new user
    Remove User    ${user}

    ${response}         POST User      ${user}
    log to console      ${response}
    Status Should Be    400            ${response}

    # ${user_id}          Set variable         ${response.json()}[id]
    # Should be true      ${user_id} > 0

Buscar usuário
    ${user}        factory get user
  #  Remove User    ${user}
    POST User      ${user}

    ${token}            Get token   ${user}
    ${response}         GET User    ${token}
    Status Should Be    200         ${response}
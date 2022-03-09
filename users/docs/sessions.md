# API USERS

Ator : Aplicação Web . Mobile.

## Sessions

### Login do usuário 

`DADO quando o usuário submeter o formulário de login com dados corretos`
`QUANDO faço uma requisição POST para a rota/sessions` 
`ENTÃO o status code deve ser igual a 200`
`E deve retornar um Token JWT na resposta`
`E esse token deve expirar em 10 dias`



### Senha Incorreta 
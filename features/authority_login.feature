#language: pt

@oneAuthorityBefore
Funcionalidade: Login de Autoridade
Como autoridade
Eu quero poder entrar no site com a conta da minha instituição
Para poder verificar e resolver desastres próximos

Cenário: Login de autoridade com sucesso
Dado que estou na página de login de autoridades
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em Login
Então deverei ver a página com o mapa de desastres

Cenário: Login de autoridade com erro - senha incorreta
Dado que estou na página de login de autoridades
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Password" com "SenhaDosBombeirosTesteIncorreta"
E clico em Login
Então deverei ver a mensagem de erro "Incorrect identifier or password"

Cenário: Login de autoridade com erro - identificador incorreta
Dado que estou na página de login de autoridades
Quando preencho o campo "Identifier" com "001"
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em Login
Então deverei ver a mensagem de erro "Incorrect identifier or password"

Cenário: Login de autoridade com erro - sem identificador
Dado que estou na página de login de autoridades
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em Login
Então deverei ver a mensagem de erro "Identifier or Password not entered"

Cenário: Login de autoridade com erro - sem senha
Dado que estou na página de login de autoridades
Quando preencho o campo "Identifier" com "193"
E clico em Login
Então deverei ver a mensagem de erro "Identifier or Password not entered"

Dado que estou na página de login de autoridades
Quando clico em logar como usuário
Então deverei ser redirecionado para a tela de login de usuário
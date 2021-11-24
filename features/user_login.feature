#language: pt

Funcionalidade: Login de Usuário
Como usuário
Eu quero poder entrar no site com minha conta
Para poder notificar desastres próximos

Cenário: Login de usuário com sucesso
Dado que estou na página de login de usuário
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em Login
Então deverei ver a página home

Cenário: Login de usuário com erro - senha incorreta
Dado que estou na página de login de usuário
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Password" com "123456"
E clico em Login
Então deverei ver a mensagem de erro "Incorrect username or password"

Cenário: Login de usuário com erro - usuário não existe
Dado que estou na página de login de usuário
Quando preencho o campo "Username" com "oOWOo"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em Login
Então deverei ver a mensagem de erro "Incorrect username or password"

Cenário: Login de usuário com erro - sem username
Dado que estou na página de login de usuário
Quando preencho o campo "Password" com "senhasecretaK"
E clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"

Cenário: Login de usuário com erro - sem password
Dado que estou na página de login de usuário
Quando preencho o campo "Username" com "rogerio_satrah"
E clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"

Cenário: Login de usuário com erro - sem username e password
Dado que estou na página de login de usuário
Quando clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"

@oneAuthorityBefore
Cenário: Login de usuário com erro - logado como autoridade
Dado que estou logado como autoridade
E que estou na página de login de usuário
Então deverei ser redirecionado para a página de perfil de autoridade
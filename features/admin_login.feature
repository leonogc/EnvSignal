#language: pt

@oneAdminBefore
Funcionalidade: Login de Administrador
Como administrador
Eu quero poder entrar no site com a conta disponível
Para poder gerenciar as autoridades, usuários e marcadores do sistema

Cenário: Login de administrador com sucesso
Dado que estou na página de login de administrador
Quando preencho o campo "Username" com "admin"
Quando preencho o campo "Password" com "admin123"
E clico em Login
Então deverei ver a página inicial de administrador

Cenário: Login de administrador com erro - senha incorreta
Dado que estou na página de login de administrador
Quando preencho o campo "Username" com "admin"
Quando preencho o campo "Password" com "senhaIncorreta"
E clico em Login
Então deverei ver a mensagem de erro "Incorrect username or password"

Cenário: Login de administrador com erro - identificador incorreta
Dado que estou na página de login de administrador
Quando preencho o campo "Username" com "adminIncorreto"
Quando preencho o campo "Password" com "admin123"
E clico em Login
Então deverei ver a mensagem de erro "Incorrect username or password"

Cenário: Login de administrador com erro - sem username
Dado que estou na página de login de administrador
Quando preencho o campo "Password" com "admin123"
E clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"

Cenário: Login de administrador com erro - sem senha
Dado que estou na página de login de administrador
Quando preencho o campo "Username" com "admin"
E clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"



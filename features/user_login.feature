#language pt

Funcionalidade: Login de Usuário
Como usuário
Eu quero poder entrar no site com minha conta
Para poder notificar desastres próximos

Cenário: Login de usuário com sucesso
Dado que estou na página de login
Quando preencho o campo "username" com "rogerio_satrah"
Quando preencho o campo "password" com "senhasecretaK"
E clico em Login
Então devo logar na minha conta 
E deverei ver a página home

Cenário: Login de usuário com erro - senha incorreta
Dado que estou na página de login
Quando preencho o campo "username" com "rogerio_satrah"
Quando preencho o campo "password" com "123456"
E clico em Login
E a senha do usuário está incorreta
Então deverei ver a mensagem de erro "Incorrect username or password"

Cenário: Login de usuário com erro - usuário não existe
Dado que estou na página de login
Quando preencho o campo "username" com "oOWOo"
Quando preencho o campo "password" com "senhasecretaK"
E clico em Login
E o username não existe
Então deverei ver a mensagem de erro "Incorrect username or password"

Cenário: Login de usuário com erro - sem username
Dado que estou na página de login
Quando preencho o campo "password" com "senhasecretaK"
E clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"

Cenário: Login de usuário com erro - sem password
Dado que estou na página de login
Quando preencho o campo "username" com "rogerio_satrah"
E clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"

Cenário: Login de usuário com erro - sem username e password
Dado que estou na página de login
Quando clico em Login
Então deverei ver a mensagem de erro "Username or Password not entered"
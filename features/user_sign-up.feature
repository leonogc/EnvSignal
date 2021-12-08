#language: pt

Funcionalidade: Cadastrar Usuário
Como Usuário
Para que eu possa interagir com o sistema
Eu quero poder me cadastrar na plataforma

Cenário: Cadastro de usuário com sucesso
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E clico em create
Então ele deve ter sido salvo no banco de dados
E deverei ser redirecionado para a página de login de usuário

Cenário: Cadastro de usuário com erro - sem nome
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E deixo o campo "Name" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter your name!"

Cenário: Cadastro de usuário com erro - sem data de nascimento
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E deixo o campo "Birth Date" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter your birthdate!"

Cenário: Cadastro de usuário com erro - usuário menor de 18 anos
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/2020"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "You need to be over 18 to use the platform!"

Cenário: Cadastro de usuário com erro - sem nome de usuário
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E deixo o campo "Username" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter your username!"

@oneUserBefore
Cenário: Cadastro de usuário com erro - nome de usuário não disponível
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "Username not available!"

Cenário: Cadastro de usuário com erro - sem e-mail
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E deixo o campo "Email" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter your email!"

Cenário: Cadastro de usuário com erro - email invalido
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah!#%SAzxc@Aaczxcb......xzcb"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "Invalid Email Format!"

Cenário: Cadastro de usuário com erro - email e confirmar email não são iguais
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah11111@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "Email and Confirmation don't match!"

Cenário: Cadastro de usuário com erro - sem senha
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Password" com "senhasecretaK"
E deixo o campo "Password" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter your password!"

Cenário: Cadastro de usuário com erro - senha e confirmar senha não são iguais
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
Quando preencho o campo "Confirm Password" com "senhasecreta"
E clico em create
Então deverei ver a mensagem de erro "Password and Confirmation don't match!"
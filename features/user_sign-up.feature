#language: pt

Funcionalidade: Cadastrar Usuário
Como Usuário
Para que eu possa interagir com o sistema
Eu quero poder me cadastrar na plataforma

Cenário: Cadastro de usuário com sucesso
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em create
Então ele deve ter sido salvo no banco de dados
E deverei ser redirecionado para a página de login

Cenário: Cadastro de usuário com erro - sem nome
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E deixo o campo "Name" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar o nome!"

Cenário: Cadastro de usuário com erro - sem data de nascimento
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E deixo o campo "Birth-Date" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar a data de nascimento!"

Cenário: Cadastro de usuário com erro - usuário menor de 18 anos
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/2020"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "É obrigatório ser maior de idade para usar a plataforma!"

Cenário: Cadastro de usuário com erro - sem nome de usuário
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E deixo o campo "Username" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar o nome de usuário!"

Cenário: Cadastro de usuário com erro - nome de usuário não disponível
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "Nome de usuário não está disponível!"

Cenário: Cadastro de usuário com erro - sem e-mail
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E deixo o campo "Email" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar o email!"

Cenário: Cadastro de usuário com erro - email invalido
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah!#%SAzxc@Aaczxcb......xzcb"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "Formato de Email Inválido!"

Cenário: Cadastro de usuário com erro - email e confirmar email não são iguais
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah11111@gmail.com"
Quando preencho o campo "Password" com "senhasecretaK"
E clico em create
Então deverei ver a mensagem de erro "Email e Confirmar Email não correspondem!"

Cenário: Cadastro de usuário com erro - sem senha
Dado que estou na página de cadastro de usuário
Quando preencho o campo "Name" com "Rogerio Satrah Ka"
Quando preencho o campo "Birth-Date" com "17/10/1990"
Quando preencho o campo "Username" com "rogerio_satrah"
Quando preencho o campo "Email" com "rogerio_satrah@gmail.com"
Quando preencho o campo "Confirm-Email" com "rogerio_satrah@gmail.com"
E deixo o campo "Password" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar a senha!"
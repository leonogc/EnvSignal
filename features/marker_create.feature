#language: pt

Funcionalidade: Criar um marker
Como Usuário
Eu quero poder inserir novos markers de desastre
Para que eu possa avisar sobre os desastres próximos a mim

Cenário: Cadastro de marker com erro - sem login
Dado que não estou logado
Quando tento acessar a tela de cadastro de marker
Então deverei ser redirecionado para a página de login

Cenário: Cadastro de marker com sucesso
Dado que estou na página de cadastro de marker
Quando preencho o campo "disaster_type" com "Vazamento de Água"
Quando preencho o campo "latitude" com 27.323222
Quando preencho o campo "longitude" com -25.323283
Quando preencho o campo "obs" com "Está pegando fogo!"
E clico em create
Então ele deve ter sido salvo no banco de dados
E deverei ser redirecionado para a página de marker

Cenário: Cadastro de marker com erro - sem tipo
Dado que estou na página de cadastro de marker
Quando preencho o campo "latitude" com 27.323222
Quando preencho o campo "longitude" com -25.323283
Quando preencho o campo "obs" com "Está pegando fogo!"
E deixo o campo "disaster_type" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar o Tipo!"

Cenário: Cadastro de marker com erro - sem latitude
Dado que estou na página de cadastro de marker
Quando preencho o campo "disaster_type" com "Vazamento de Água"
Quando preencho o campo "longitude" com -25.323283
Quando preencho o campo "obs" com "Está pegando fogo!"
E deixo o campo "latitude" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar a Latitude!"

Cenário: Cadastro de marker com erro - sem longitude
Dado que estou na página de cadastro de marker
Quando preencho o campo "disaster_type" com "Vazamento de Água"
Quando preencho o campo "latitude" com 27.323222
Quando preencho o campo "obs" com "Está pegando fogo!"
E deixo o campo "longitude" vazio
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar a Longitude!"




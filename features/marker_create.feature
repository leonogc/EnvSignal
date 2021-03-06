#language: pt

Funcionalidade: Criar um marker
Como Usuário
Eu quero poder inserir novos markers de desastre
Para que eu possa avisar sobre os desastres próximos a mim

Cenário: Cadastro de marker com erro - sem login
Dado que não estou logado
Quando tento acessar a tela de cadastro de marker
Então deverei ser redirecionado para a página de login

@oneUserBefore
Cenário: Cadastro de marker com sucesso - Usuário
Dado que estou logado como usuário
E estou na tela de cadastro de marker
Quando seleciono a opção "Water leak" no select "Disaster type"
Quando preencho o campo "Latitude" com 27.323222
Quando preencho o campo "Longitude" com -25.323283
Quando preencho o campo "Obs" com "Está pegando fogo!"
E clico em create
Então o marker deve ter sido salvo no banco de dados
E deverei ser redirecionado para a página do marker

@oneAuthorityBefore
Cenário: Cadastro de marker com sucesso - Autoridade
Dado que estou logado como autoridade
E estou na tela de cadastro de marker
Quando seleciono a opção "Water leak" no select "Disaster type"
Quando preencho o campo "Latitude" com 27.323222
Quando preencho o campo "Longitude" com -25.323283
Quando preencho o campo "Obs" com "Está pegando fogo!"
E clico em create
Então o marker deve ter sido salvo no banco de dados
E deverei ser redirecionado para a página do marker

@oneUserBefore
Cenário: Cadastro de marker com erro - sem latitude
Dado que estou logado como usuário
E estou na tela de cadastro de marker
Quando seleciono a opção "Water leak" no select "Disaster type"
Quando preencho o campo "Longitude" com -25.323283
Quando preencho o campo "Obs" com "Está pegando fogo!"
E deixo o campo "Latitude" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter the latitude!"

@oneUserBefore
Cenário: Cadastro de marker com erro - sem longitude
Dado que estou logado como usuário
E estou na tela de cadastro de marker
Quando seleciono a opção "Water leak" no select "Disaster type"
Quando preencho o campo "Latitude" com 27.323222
Quando preencho o campo "Obs" com "Está pegando fogo!"
E deixo o campo "Longitude" vazio
E clico em create
Então deverei ver a mensagem de erro "You need to enter the longitude!"




#language: pt
@oneAdminBefore
Funcionalidade: Cadastro de Autoridade
Como administrador
Eu quero poder cadastrar novas autoridades
Para que elas tenham acesso ao sistema

Cenário: Cadastro de autoridade com sucesso
Dado que estou logado na conta de administrador
Dado que estou na página de cadastro de autoridade
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Name" com "Corpo de Bombeiros"
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em create
Então deverei ir para a página de listagem de autoridades
E deverei encontrar o identificador "193" cadastrado

Cenário: Cadastro de autoridade com erro - não logado
Dado que não estou logado na conta de administrador
Quando tento acessar a página de cadastro de autoridade
Então deverei ser redirecionado para a página de login de administrador

Cenário: Cadastro de autoridade com erro - sem identificador
Dado que estou logado na conta de administrador
Dado que estou na página de cadastro de autoridade
Quando preencho o campo "Name" com "Corpo de Bombeiros"
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar o identificador!"

Cenário: Cadastro de autoridade com erro - sem nome
Dado que estou logado na conta de administrador
Dado que estou na página de cadastro de autoridade
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar o nome!"

Cenário: Cadastro de autoridade com erro - sem senha
Dado que estou logado na conta de administrador
Dado que estou na página de cadastro de autoridade
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Name" com "Corpo de Bombeiros"
E clico em create
Então deverei ver a mensagem de erro "É obrigatório informar a senha!"

@oneAuthorityBefore
Cenário: Cadastro de autoridade com erro - identificador indisponível
Dado que estou logado na conta de administrador
Dado que estou na página de cadastro de autoridade
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Name" com "Corpo de Bombeiros"
Quando preencho o campo "Password" com "SenhaDosBombeirosTeste"
E clico em create
Então deverei ver a mensagem de erro "Identificador não está disponível!"
#language: pt

@oneAdminBefore
@oneUserBefore
Funcionalidade: Administrador - Listagem de Usuários
Como administrador
Eu quero poder alterar informações dos usuários cadastrados
Para que eu consiga corrigir informações cadastradas com problemas

Cenário: Editando um Usuário com sucesso
Dado que estou logado na conta de administrador
E que estou na página de edição de usuários
Quando preencho o campo "Username" com "rogerio"
Quando preencho o campo "Name" com "Rogerio Satrah Kas"
Quando preencho o campo "Birth Date" com "1991-10-17"
E clico em Save
Então deverei ver a mensagem "User was successfully updated."
E ver o campo atualizado com "rogerio"
E ver o campo atualizado com "Rogerio Satrah Kas"
E ver o campo atualizado com "17/10/1991" 

Cenário: Editar dados do usuário com erro - sem username
Dado que estou logado na conta de administrador
E que estou na página de edição de usuários
Quando deixo o campo "Username" vazio
E clico em Save
Então deverei ver a mensagem de erro "É obrigatório informar o nome de usuário!"

@otherUserBefore
Cenário: Editar dados do usuário com erro - username não disponível
Dado que estou logado na conta de administrador
E que estou na página de edição de usuários
Quando preencho o campo "Username" com "ro_satrah"
E clico em Save
Então deverei ver a mensagem de erro "Nome de usuário não está disponível!"

Cenário: Editar dados do usuário com erro - sem nome
Dado que estou logado na conta de administrador
E que estou na página de edição de usuários
Quando deixo o campo "Name" vazio
E clico em Save
Então deverei ver a mensagem de erro "É obrigatório informar o nome!"

Cenário: Editar dados do usuário com erro - sem data de aniversário
Dado que estou logado na conta de administrador
E que estou na página de edição de usuários
Quando deixo o campo "Birth Date" vazio
E clico em Save
Então deverei ver a mensagem de erro "É obrigatório informar a data de nascimento!"

Cenário: Editar dados do usuário com erro - sem email
Dado que estou logado na conta de administrador
E que estou na página de edição de usuários
Quando deixo o campo "Email" vazio
E clico em Save
Então deverei ver a mensagem de erro "É obrigatório informar o email!"

Cenário: Editar dados do usuário com erro - usuário não logado
Dado que não estou logado na conta de administrador
E que estou na página de edição de usuários
Então deverei ser redirecionado para a página de login de administrador
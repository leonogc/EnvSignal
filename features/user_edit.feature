#language: pt

Funcionalidade: Editar Perfil
Como usuário
Eu quero poder editar minhas informações cadastradas
Para que eu corrija possíveis erros cometido no processo de cadastro

Cenário: Editar dados do usuário com sucesso
Dado que estou logado no meu perfil
Quando acesso a tela de edição de perfil
Quando preencho o campo "Name" com "Rogerio Satrah Kas"
Quando preencho o campo "Birth Date" com "1991-10-17"
E clico em Save
Então deverei ver a mensagem "Profile updated!"
E ver o campo atualizado com "Rogerio Satrah Kas"
E ver o campo atualizado com "1991-10-17" 

Cenário: Editar dados do usuário com erro - sem nome
Dado que estou logado no meu perfil
Quando acesso a tela de edição de perfil
Quando deixo o campo "Name" vazio
E clico em Save
Então deverei ver a mensagem de erro "You need to enter your name!"

Cenário: Editar dados do usuário com erro - sem data de aniversário
Dado que estou logado no meu perfil
Quando acesso a tela de edição de perfil
Quando deixo o campo "Birth Date" vazio
E clico em Save
Então deverei ver a mensagem de erro "You need to enter your birthdate!"

Cenário: Editar dados do usuário com erro - sem email
Dado que estou logado no meu perfil
Quando acesso a tela de edição de perfil
Quando deixo o campo "Email" vazio
E clico em Save
Então deverei ver a mensagem de erro "You need to enter your email!"

Cenário: Editar dados do usuário com erro - usuário não logado
Dado que não estou logado
Quando acesso a tela de edição de perfil
Então deverei ser redirecionado para a página de login de usuário
#language: pt

Funcionalidade: Editar Perfil
Como usuário
Eu quero poder editar minhas informações cadastradas
Para que eu corrija possíveis erros cometido no processo de cadastro

Cenário: Editar dados do usuário com sucesso
Dado que estou logado no meu perfil
Quando clico em Profile e clico em Edit
Quando preencho o campo "Name" com "Rogerio Satrah Kas"
Quando preencho o campo "Birth Date" com "17/10/1991"
Quando preencho o campo "Username" com "rogerio_satrah_kas"
E clico em Save
Então deverei ver a mensagem "Profile updated"
E ver o campo "Name" preenchido com "Rogerio Satrah Kas"
E ver o campo "Birth Date" preenchido com "17/10/1991"
E ver o campo "Username" preenchido com "rogerio_satrah_kas" 

Cenário: Editar dados do usuário com erro - sem nome
Dado que estou logado no meu perfil
Quando clico em Profile e clico em Edit
Quando preencho o campo "Name" com ""
E clico em Save
Então deverei ver a mensagem de erro "User name not set"

Cenário: Editar dados do usuário com erro - sem data de aniversário
Dado que estou logado no meu perfil
Quando clico em Profile e clico em Edit
Quando preencho o campo "Birth Date" com ""
E clico em Save
Então deverei ver a mensagem de erro "User birth date not set"

Cenário: Editar dados do usuário com erro - sem username
Dado que estou logado no meu perfil
Quando clico em Profile e clico em Edit
Quando preencho o campo "Username" com ""
E clico em Save
Então deverei ver a mensagem de erro "User username not set"

Cenário: Editar dados do usuário com erro - sem email
Dado que estou logado no meu perfil
Quando clico em Profile e clico em Edit
Quando preencho o campo "Email" com ""
E clico em Save
Então deverei ver a mensagem de erro "User email not set"

Cenário: Editar dados do usuário com erro - usuário não é o próprio
Dado que estou logado no meu perfil
Quando tento acessar a edição do perfil de outro usuário
Então deverei ver a mensagem de erro "This is not your user"

Cenário: Editar dados do usuário com erro - usuário não logado
Dado que não estou logado
Quando tento acessar a tela de edição
Então deverei ser redirecionado para a página de login
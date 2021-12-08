#language: pt

@oneAuthorityBefore
Funcionalidade: Editar Perfil de Autoridade
Como autoridade
Eu quero poder editar minhas informações cadastradas
Para que eu corrija ou atualize dados que estão incorretos

Cenário: Editar dados da Autoridade com sucesso
Dado que estou logado como autoridade 
Quando acesso a tela de edição de perfil de autoridade
Quando preencho o campo "Identifier" com "190"
Quando preencho o campo "Name" com "Policia"
E clico em Save
Então deverei ver a mensagem "Profile updated!"
E ver o campo atualizado com "190"
E ver o campo atualizado com "Policia"

Cenário: Editar dados da Autoridade com sucesso - mantendo o mesmo identificador
Dado que estou logado como autoridade 
Quando acesso a tela de edição de perfil de autoridade
Quando preencho o campo "Identifier" com "193"
Quando preencho o campo "Name" com "Corpo de Bombeiros Zona X"
E clico em Save
Então deverei ver a mensagem "Profile updated!"
E ver o campo atualizado com "Corpo de Bombeiros Zona X"

Cenário: Editar dados da Autoridade com erro - sem identificador
Dado que estou logado como autoridade 
Quando acesso a tela de edição de perfil de autoridade
Quando deixo o campo "Identifier" vazio
Quando preencho o campo "Name" com "Policia"
E clico em Save
Então deverei ver a mensagem "You need to enter your identifier!"

Cenário: Editar dados da Autoridade com erro - sem nome
Dado que estou logado como autoridade 
Quando acesso a tela de edição de perfil de autoridade
Quando preencho o campo "Identifier" com "190"
Quando deixo o campo "Name" vazio
E clico em Save
Então deverei ver a mensagem "You need to enter your name!"

@otherAuthorityBefore
Cenário: Editar dados da Autoridade com erro - identificador indisponível
Dado que estou logado como autoridade 
Quando acesso a tela de edição de perfil de autoridade
Quando preencho o campo "Identifier" com "190"
Quando preencho o campo "Name" com "Policia"
E clico em Save
Então deverei ver a mensagem "Identifier not available!"

Cenário: Editar dados da Autoridade com erro - autoridade não logado
Dado que não estou logado
Quando acesso a tela de edição de perfil de autoridade
Então deverei ser redirecionado para a página de login de autoridade

@oneUserBefore
Cenário: Editar dados da Autoridade com erro - logado como usuário
Dado que estou logado como usuário
Quando acesso a tela de edição de perfil de autoridade
Então deverei ser redirecionado para a página de perfil de usuário



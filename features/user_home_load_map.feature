#language: pt

Funcionalidade: Ver Mapa
Como Usuário
Eu quero poder vizualizar o mapa do google maps
Para que eu possa localizar os desastres próximos a mim e sinalizar outros desastres

Cenário: Carregamento do Mapa bem sucedido
Dado que estou na página home   
Quando a página é carregada
Então o mapa deve ser exibido

@oneUserBefore
Cenário: Botão para o perfil Usuário
Dado que estou logado como usuário
E que estou na página home
Quando a página é carregada
E clico em "Meu perfil"
Então deverei ser redirecionado para a página de perfil de usuário

@oneAuthorityBefore
Cenário: Botão para o perfil Autoridade
Dado que estou logado como autoridade
E que estou na página home de autoridade
Quando a página é carregada
E clico em "Meu perfil"
Então deverei ser redirecionado para a página de perfil de autoridade

@oneUserBefore
Cenário: Botão para a lista de disastres para o Usuário
Dado que estou logado como usuário
E que estou na página home
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres

@oneAuthorityBefore
Cenário: Botão para o perfil Autoridade
Dado que estou logado como autoridade
E que estou na página home de autoridade
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
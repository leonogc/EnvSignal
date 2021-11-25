#language: pt

Funcionalidade: Ver Mapa
Como Usuário
Eu quero poder vizualizar o mapa do google maps
Para que eu possa localizar os desastres próximos a mim e sinalizar outros desastres

Cenário: Carregamento do Mapa bem sucedido
Dado que estou na página home
Quando a página é carregada
Então o mapa deve ser exibido

Cenário: Botão para o perfil
Dado que estou logado como usuário
E que estou na página home
Quando a página é carregada
Então deverei ver um botão de "Meu perfil"
E clico em "Meu perfil"
Então deverei ser redirecionado para a página de perfil de usuário
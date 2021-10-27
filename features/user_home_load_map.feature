#language: pt

Funcionalidade: Ver Mapa
Como Usuário
Eu quero poder vizualizar o mapa do google maps
Para que eu possa localizar os desastres próximos a mim e sinalizar outros desastres

Cenário: Carregamento do Mapa bem sucedido
Dado que estou na página home
Quando a página é carregada
Então o mapa deve ser exibido

Cenário: Carregamento do Mapa falha
Dado que estou na página home
Quando a página é carregada
Então o mapa deve falhar em ser exibido
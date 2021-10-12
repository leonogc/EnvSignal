#language: pt

Funcionalidade: Usar a home
Como Usuário
Para que eu possa localizar os desastres próximos a mim e sinalizar outros desastres
Eu quero poder interagir com a home da aplicação

Cenário: Ver desastre
Dado que estou na página home
Quando eu clico e seguro no mapa no pin de um desastre
Então deve mostrar as informações desse desastre

Cenário: Adicionar desastre
Dado que estou na página home
Quando eu clico e seguro no mapa
E seleciono o tipo do desastre
Então deve começar o processo de adição do desastre

Cenário: Confimar desastre
Dado que estou na página home
Quando eu clico e seguro no mapa no pin de um desastre que eu vi ser verdadeiro
E pressiono o botão confirm
Então minha validação deve ser encaminhada para o sistema

Cenário: Rejeitar desastre
Dado que estou na página home
Quando eu clico e seguro no mapa no pin de um desastre que eu vi ser falso
E pressiono o botão reject
Então minha validação deve ser encaminhada para o sistema

Cenário: Notificação de desastre
Dado que estou na página home
Quando eu pressiono o ícone de Notificação
Então é exibido minhas últimas Notificações de desastres próximos e feedback dos meus desastres recentes 
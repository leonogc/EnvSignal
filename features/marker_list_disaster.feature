#language: pt

@listMarkerBefore
Funcionalidade: Listagem de Desastres - Autoridade
Como usuário
Eu quero poder ver uma lista de desastres próximos
Para poder ver a distância relativa entre nós

Cenário: Carregamento da lista com distância - user
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E os desastres e suas distâncias devem ser exibidas

Cenário: Carregamento da lista com distância - authority
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E os desastres e suas distâncias devem ser exibidas

@otherUserMarkerBefore
@oneUserBefore
@oneMarkerFromUser
Cenário: Listagem de Markers do próprio Usuário - lista
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres próprios"
Então deverei ser redirecionado para a página de listagem de disastres próprios
E deverei ver "23.4292" 
E não deverei ver "26.1232" 

@otherAuthorityMarkerBefore
@oneAuthorityBefore
@oneMarkerFromAuthority
Cenário: Listagem de Markers da própria Autoridade - lista
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres próprios"
Então deverei ser redirecionado para a página de listagem de disastres próprios
E deverei ver "23.4292" 
E não deverei ver "26.1232" 

@otherUserMarkerBefore
Cenário: Listagem de Markers de todos usuários com ações- authority
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres com todos os botões liberados

@otherUserMarkerBefore
@otherAuthorityMarkerBefore
Cenário: Listagem de Markers com ações apenas para os próprios - user
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres com todos os botões liberados
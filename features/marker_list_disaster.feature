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
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Distance   | ID  | Creator | Upvotes | Downvotes | Actions               |
| incendio  | 0        | false    |             | 3832.85 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |
| vazamento | 0        | false    |             | 3845.82 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |

Cenário: Carregamento da lista com distância - authority
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Distance   | ID  | Creator | Upvotes | Downvotes | Actions               |
| incendio  | 0        | false    |             | 3832.85 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |
| vazamento | 0        | false    |             | 3845.82 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |

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
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Distance   | ID  | Creator | Upvotes | Downvotes | Actions               |
| incendio  | 0        | false    |             | 3832.85 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |
| vazamento | 0        | false    |             | 3845.82 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |
| incendio  | 0        | false    |             | 3832.85 Km | 2   | User    |0        | 0         | Show |      |         |

@otherUserMarkerBefore
@otherAuthorityMarkerBefore
Cenário: Listagem de Markers com ações apenas para os próprios - user
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Distance   | ID  | Creator | Upvotes | Downvotes | Actions               |
| incendio  | 0        | false    |             | 3832.85 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |
| vazamento | 0        | false    |             | 3845.82 Km | 1   | User    |0        | 0         | Show | Edit | Destroy |
| incendio  | 0        | false    |             | 3832.85 Km | 192 | Auth    |0        | 0         | Show | Edit | Destroy |

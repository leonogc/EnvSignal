#language: pt

@markersBeforeForConfirm
Funcionalidade: Listagem de Desastres
Como usuário
Eu quero poder ver uma lista de desastres próximos
Para poder ver a distância relativa entre nós

#No campo ID está sendo indicado o username para que no step seja buscado o id através do find_by

Cenário: Carregamento da lista com distância - user
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Latitude | Longitude | Distance   | ID             | Creator | Upvotes | Downvotes | Actions             |||
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |
| vazamento |          | false    |             | 27.1232  | -22.3323  | 3845.82 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |

@oneAuthorityBefore
Cenário: Carregamento da lista com distância - authority
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Latitude | Longitude | Distance   | ID             | Creator | Upvotes | Downvotes | Actions             |||
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |
| vazamento |          | false    |             | 27.1232  | -22.3323  | 3845.82 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |

@otherUserMarkerBefore
Cenário: Listagem de Markers do próprio Usuário - lista
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres próprios"
Então deverei ser redirecionado para a página de listagem de disastres próprios
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Latitude | Longitude | Distance   | User           | Upvotes | Downvotes | Actions             |||
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | rogerio_satrah | 0       | 0         | Show | Edit | Destroy |
| vazamento |          | false    |             | 27.1232  | -22.3323  | 3845.82 Km | rogerio_satrah | 0       | 0         | Show | Edit | Destroy |

@oneAuthorityBefore
@oneMarkerFromAuthority
@otherAuthorityMarkerBefore
Cenário: Listagem de Markers da própria Autoridade - lista
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres próprios"
Então deverei ser redirecionado para a página de listagem de disastres próprios
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Latitude | Longitude | Distance   | User               | Upvotes | Downvotes | Actions             |||
| incendio  |          | false    |             | 23.4292  | -23.3323  | 3624.18 Km | Corpo de Bombeiros |0        | 0         | Show | Edit | Destroy |

@otherUserMarkerBefore
Cenário: Listagem de Markers de todos usuários com ações - usuário
Dado que estou logado como usuário
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Latitude | Longitude | Distance   | ID             | Creator | Upvotes | Downvotes | Actions             |||
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |
| vazamento |          | false    |             | 27.1232  | -22.3323  | 3845.82 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | ale            | User    |0        | 0         | Show |      |         |

@oneAuthorityBefore
@otherAuthorityMarkerBefore
Cenário: Listagem de Markers com ações - autoridade
Dado que estou logado como autoridade
E que estou na página home do usuário
Quando a página é carregada
E clico em "Lista de desastres"
Então deverei ser redirecionado para a página de listagem de disastres
E deverei ver a lista de desastres da seguinte forma:
| Type      | Severity | Verified | Observation | Latitude | Longitude | Distance   | ID             | Creator | Upvotes | Downvotes | Actions             |||
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |
| vazamento |          | false    |             | 27.1232  | -22.3323  | 3845.82 Km | rogerio_satrah | User    |0        | 0         | Show | Edit | Destroy |
| incendio  |          | false    |             | 26.1232  | -23.3323  | 3832.85 Km | Samu           | Auth    |0        | 0         | Show | Edit | Destroy |

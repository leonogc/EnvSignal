#language: pt

@oneAuthorityBefore
@markersBeforeForResolve
Funcionalidade: Resolução de desastre
Como autoridade competente
Eu quero poder marcar que um desastre foi resolvido
Para que o público saiba e o desastre saia da lista de não resolvidos.

Cenário: Resolução de desastre exibindo corretamente
Dado que estou logado como autoridade 
Quando clico em um marker
Então deverei ver a página de detalhes do marker
E deverei ver um botão de "Resolve" desastre

@unverifyMarker
Cenário: Resolução de desastre ocultada - marker não verificado
Dado que estou logado como autoridade 
Quando clico em um marker
E o marker não está verificado
Então deverei ver a página de detalhes do marker
E não deverei ver um botão de "Resolve" desastre

Cenário: Resolução de desastre ocultada - autoridade não logado
Dado que não estou logado
Quando clico em um marker
Então deverei ser redirecionado para a página de login

@oneUserBefore
Cenário: Resolução de desastre ocultada - logado como usuário
Dado que estou logado como usuário
Quando clico em um marker
Então deverei ver a página de detalhes do marker
E não deverei ver um botão de "Resolve" desastre

Cenário: Resolução de desastre com sucesso
Dado que estou logado como autoridade 
E estou na página de detalhes do marker
Quando clico em "Resolve"
Então deverei ver a página de detalhes do marker
E deverei ver uma mensagem de "Resolved succesfully"
E deverei ver "Solved: true"
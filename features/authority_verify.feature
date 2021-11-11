#language: pt

@oneAuthorityBefore
Funcionalidade: Verificação de desastre
Como autoridade competente
Eu quero poder marcar o desastre como verificado e definir uma prioridade para ela, 
Para que eu possa sinalizar para outros usuários que o desastre é verídico.

Cenário: Verificação de desastre exibindo corretamente
Dado que estou logado como autoridade na página home
Quando clico em um marker
Então deverei ver a página de detalhes do marker
E deverei ver um botão de "Verify" desastre
E deverei ver um botão de "Remove" desastre

Cenário: Verificação de desastre ocultada
Dado que não estou logado como autoridade na página home
Quando clico em um marker
Então deverei ver a página de detalhes do marker
E não deverei ver um botão de "Verify" desastre
E não deverei ver um botão de "Remove" desastre

Cenário: Verificação de desastre com sucesso
Dado que estou logado como autoridade na página de detalhes do marker
Quando clico em "Verify"
Então deverei ver a página de detalhes do marker
E deverei ver uma mensagem de "Verified succesfully"
E deverei ver "Verified: true"

Cenário: Cancelamento de desastre com sucesso
Dado que estou logado como autoridade na página de detalhes do marker
Quando clico em "Remove"
Então deverei ver uma mensagem de "Marker was successfully destroyed."




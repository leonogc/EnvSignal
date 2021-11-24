#language: pt

@oneAuthorityBefore
Funcionalidade: Alterar Gravidade do Desastre
Como autoridade competente
Eu quero poder alterar a gravidade de um desastre assim que ele for verificado
Para que fique claro para outros usuários o perigo da situação.

Cenário: Marcando a gravidade do desastre
Dado que estou logado como autoridade na página de detalhes do marker
E o marker está verificado
Quando clico em "Edit"
E preencho o select "Severity" com "III"
E clico em "Save"
Então deverei ver a página de detalhes do marker
E deverei ver "Severity: III"

Cenário: Gravidade de desastre não verificado
Dado que estou logado como autoridade na página de detalhes do marker
E o marker não está verificado
Quando clico em "Edit"
E preencho o select "Severity" com "I"
E clico em "Save"
Então deverei ver a página de edição do marker
E deverei ver uma mensagem de "The marker is not verified!"
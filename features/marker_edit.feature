#language: pt

Funcionalidade: Editar um marcador
Como usuário
Eu quero editar características de marcadores que eu criei
Para que eu possa atualizar ou corrigir informações

@markersBeforeForConfirm
Cenário: Editando tipo de desastre
Dado que estou logado como usuário 
E estou na página de detalhes do marker
Quando clico em "Edit"
E preencho o select "Disaster type" com "Irregular Sewage Dump"
E clico em "Save"
Então deverei ver "Disaster_type: sewage"

@markersBeforeForConfirm
Cenário: Editando latitude e longitude do desastre
Dado que estou logado como usuário 
E estou na página de detalhes do marker
Quando clico em "Edit"
E preencho o campo "Latitude" com "20"
E preencho o campo "Longitude" com "20"
E clico em "Save"
Então deverei ver a página de detalhes do marker
E deverei ver "Latitude: 20"
E deverei ver "Longitude: 20"

@oneUserBefore
@otherUserMarkerBefore
Cenário: Tentando editar desastre de outro usuário
Dado que estou logado como usuário 
E estou na página de detalhes do marker
Então não deverei ver "Edit"

@oneUserBefore
@otherUserMarkerBefore
Cenário: Tentando verificar desastre como usuário
Dado que estou logado como usuário 
E estou na página de detalhes do marker
Então não deverei ver "Verify"
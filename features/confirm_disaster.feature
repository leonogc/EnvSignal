#language: pt

Funcionalidade: Confirmar desastres (upvote e downvote)
Como usuário
Eu quero poder confirmar ou negar a ocorrência de um desastre marcado
Para que mais pessoas saibam que se trata de um problema real

Cenário: Verificar um desastre no mapa
Dado que estou logado na tela de home
E há markes criados por outros usuários no mapa
Quando clico no marker
Então devo ver os detalhes do marker

@otherUserMarkerBefore
Cenário: Confirmar um desastre verificado
Dado que estou logado na página do marker
E devo ver "Upvotes: 0"
Quando clico em "Upvote"
Então devo ver a página de detalhes do marker
E devo ver "Upvoted succesfully"
E devo ver "Upvotes: 1"

@otherUserMarkerBefore
Cenário: Negar um desastre verificado
Dado que estou logado na página do marker
E devo ver "Downvotes: 0"
Quando clico em "Downvote"
Então devo ver a página de detalhes do marker
E devo ver "Downvoted succesfully"
E devo ver "Downvotes: 1"

@someMarkersBefore
Cenário: Confirmar desastre marcado pelo próprio usuário
Dado que estou logado na página do marker
E sou o usuário que criou o marker
Então devo ver a página de detalhes do marker
E não devo ver o botão "Upvote" ou "Downvote"

@otherUserMarkerBefore
Cenário: Remover confirmação de desastre
Dado que estou logado na página do marker
E que já realizei 0
Quando clico em "Upvote"
Então devo ver a página de detalhes do marker
E devo ver "Upvote removed"
E devo ver "Upvotes: 0"

@otherUserMarkerBefore
Cenário: Remover negação de desastre
Dado que estou logado na página do marker
E que já realizei 1
Quando clico em "Downvote"
Então devo ver a página de detalhes do marker
E devo ver "Downvote removed"
E devo ver "Downvotes: 0"

@otherUserMarkerBefore
Cenário: Confirmar desastre negado
Dado que estou logado na página do marker
E que já realizei 1
Quando clico em "Upvote"
Então devo ver a página de detalhes do marker
E devo ver "Upvoted succesfully (de-downvoted)"
E devo ver "Upvotes: 1"
E devo ver "Downvotes: 0"

@otherUserMarkerBefore
Cenário: Negar desastre confirmado
Dado que estou logado na página do marker
E que já realizei 0
Quando clico em "Downvote"
Então devo ver a página de detalhes do marker
E devo ver "Downvoted succesfully (de-upvoted)"
E devo ver "Upvotes: 0"
E devo ver "Downvotes: 1"
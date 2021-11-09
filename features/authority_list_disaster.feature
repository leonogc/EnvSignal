#language: pt

@authorityList
Funcionalidade: Listagem de Desastres - Autoridade
Como autoridade competente
Eu quero poder ver uma lista de desastres próximos
Para poder encaminhar equipes para resolve-los

Cenário: Carregamento da lista
Dado que estou logado como autoridade
Quando acesso a listagem de desastres
Então os desastres devem ser exibidos
# ACH2006 - Engenharia de Sistemas de Informação I

[![Build Status](https://app.travis-ci.com/leonogc/EP-ESI.svg?branch=main)](https://app.travis-ci.com/leonogc/EP-ESI)
[![Maintainability](https://api.codeclimate.com/v1/badges/9eac319feb492213e279/maintainability)](https://codeclimate.com/github/leonogc/EP-ESI/maintainability)

## Primeira Execução:
Mudar de EOF Sequence de CRLF para LF do arquivo entrypoint.sh

E executar os seguintes comandos em um terminal
```
$ docker-compose build
$ docker-compose up
```
Criar o banco de dados da aplicação dentro do container (o container deve estar rodando paralelamente no terminal):
```
$ docker-compose run web rake db:create
```

## Após primeira execução: 
Para subir a aplicação:
```
$ docker-compose up
```
Para encerrar a aplicação:
```
$ docker-compose down
```
Integrantes do grupo:
* Vitor Hugo Brasiliense da Rosa
   * 11270890 | vitorhugobr@usp.br
* Michelly Rodrigues da Silva
   * 11270607 | michelly.rds@usp.br
* Leonardo Nogueira Cordeiro
   * 11270927 | leonogueirac@usp.br 
* Mateus Alex dos Santos Luna
   * 11207964 | theew@usp.br
* Pedro Gabriel dos Anjos Santana 
   * 11270948 | pedro.gs@usp.br
* Lucas Imamura Alves
   * 11208221 | lucas_alves@usp.br

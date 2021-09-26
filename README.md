# ACH2006 - Engenharia de Sistemas de Informação I

## Primeira Execução:
Mudar de EOF Sequence de CRLF para LF do arquivo entrypoint.sh

E executar os seguintes comandos em um terminal
```
$ docker-compose build
$ docker-compose up
```
e em outro enquanto o container está rodando
```
docker-compose run web rake db:create
```

## Após primeira execução: 
Apenas executar 
```
$ docker-compose up
```
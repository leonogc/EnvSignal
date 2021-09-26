# ACH2006 - Engenharia de Sistemas de Informação I

## Primeira Execução:
Excluir e criar o entrypoint.sh com o seguinte conteúdo: 
```
#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
```
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
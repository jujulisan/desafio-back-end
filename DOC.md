# Documentação para startar o projeto

## O que é preciso ter instalado

* Docker
  * <https://docs.docker.com/docker-for-mac/install/>
  * <https://docs.docker.com/install/linux/docker-ce/ubuntu/>

* Docker-compose
  * <https://docs.docker.com/compose/install/>

## Como rodar a aplicação

* Após a instalação do Docker e do Docker-compose é necessário construir o container

```console
$docker-compose up --build
```

* Quando o container terminar de startar é necessário rodar os comandos para iniciar a aplicação

```console
$docker exec -it web bundle
$docker exec -it web rails db:create db:migrate db:seed
```

* Para rodar os testes

```console
$docker exec -it web rspec
```

* Para acessar a aplicação no browser é só acessar <http://localhost:3000/>
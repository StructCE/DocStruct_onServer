---
order: 2
icon: rocket
label: "Como instalar o Prisma ORM ?"
author:
  name: Araújo
  avatar: ../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Instalação
---

## Configuração do Prisma.

### Instalando o Prisma

```bash
pnpm add prisma --save-dev
pnpm add @prisma/client
```

### Criar arquivos `schema.prisma` e `.env`

```bash
pnpm prisma init
```

`.env`: o arquivo para definir a URL de conexão do seu banco de dados.
`prisma/schema.prisma`: o arquivo de configuração principal para o seu projeto Prisma (incluirá o seu modelo de dados).

### Conectar o prisma ao seu banco de dados

A maneira mais fácil é usar o SQLite, pois é um banco de dados num arquivo, sem precisar instalar nada.

```bash
#.env

DATABASE_URL="file:./db.sqlite"
```

!!!
O prisma geralmente não cria o banco de dados, mas simplesmente se conecta a ele. SQLite é uma exceção, onde o Prisma cria o arquivo `.sqlite` caso ele ainda não exista. Caso seja usado outro SGBD, o ideal é usar docker para facilitar a vida.
!!!

!!!warning SQLite em produção?
Muitas vezes não é bom usar SQLite em produção. Por esse motivo, atualmente (em 2023) trocamos de SQLite para MySQL ao entrar em produção. Isso torna necessário realizar mudanças, como adicionar `@db.Text` aos campos String que podem conter mais de 256 caracteres, etc.
!!!

### Quer saber mais Prisma ORM ?

----------------->[Documentação oficial do Prisma](https://www.prisma.io/docs).<--------------------

## Configurar banco de dados PostgreSQL usando o Docker

<!-- Não acho que isso devia estar aqui, mas é a vida por enquanto -->

**É importante ressaltar que nesse passo o Docker esta sendo utilizado como um 'simulador'
de banco de dados PostgreSQL.**

### Criando arquivo `docker-compose.yml`

```bash
touch docker-compose.yml
```

### Adicionando a configuração no arquivo `docker-compose.yml`

```bash
# teste/docker-compose.yml

version: '3'
services:
  postgres:
    image: postgres:latest
    container_name: postgresql
    environment:
      POSTGRES_DB: teste
      POSTGRES_USER: teste
      POSTGRES_PASSWORD: teste
    ports:
      - "5436:5432"
    volumes:
      - ./dados_postgres:/var/lib/postgresql/data
```

### Definir localização do seu banco de dados

Considerando as variáveis usadas no docker,

- POSTGRES_DB = nome do banco de dados = teste
- POSTGRES_USER = usuario definido no `docker-compose.yml` = teste
- POSTGRES_PASSWORD = senha definida no `docker-compose.yml` = teste

Declare a URL do banco de dados substituindo as `{var}` por seus valores:

```bash
#.env

DATABASE_URL="postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@localhost:5432/{POSTGRES_DB}"
#substituindo no exemplo, ficaria
# DATABASE_URL="postgresql://teste:teste@localhost:5432/teste"
```

### Inicie o Docker

```bash
sudo service docker start
```

### Inicie o container do banco de dados PostgreSQL

```bash
sudo docker-compose up -d
```

### Verifique se o banco de dados está sendo executado

```bash
sudo docker ps
```

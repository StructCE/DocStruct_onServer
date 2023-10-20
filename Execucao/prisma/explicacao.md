---
order: 3
icon: question
label: "O que é Prisma?"
author:
  name: Artur Padovesi
  avatar: ../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Explicação
tags:
  - orm
  - explicacao
---

## O que é ORM ?

<!-- Trecho feito por Araújo -->

ORM, ou Mapeamento Objeto-Relacional, é uma técnica de programação que permite que os desenvolvedores de software interajam com bancos de dados relacionais usando objetos e classes no lugar de consultas SQL diretas. A ideia principal por trás do ORM é eliminar a necessidade de escrever consultas SQL manualmente e simplificar a interação entre o código da aplicação e o banco de dados relacional. Em vez de tratar as tabelas e registros do banco de dados como entidades separadas e escrever SQL para buscar, inserir, atualizar ou excluir dados, os desenvolvedores podem trabalhar com objetos em código que representam diretamente os dados do banco de dados. O ORM mapeia esses objetos para tabelas do banco de dados e vice-versa.

## O que é Prisma?

O [prisma](https://www.prisma.io) é uma biblioteca desenvolvida em typescript que pode ser usada com JS/TS. Ela possui diferentes módulos, entre eles estão:

- Prisma (ou Prisma CLI);
  - Prisma Studio;
  - Prisma db/migrate;
- Prisma Client;

A ideia do Prisma é ser uma ORM. Ela pode ser utilizada no desenvolvimento de aplicativos de banco de dados em JavaScript ou TypeScript. Ela é bem amigável com iniciantes e permite segurança de tipos. Não é a melhor em questão de performance, mas a gente nunca precisou de performance (pelo menos por enquanto).

!!!warning Performance
Caso performance para _queries_ mais complexas seja uma preocupação do projeto, veja a situação atual do Prisma ao lidar com joins (problema atual em 2023).

Considere usar outra solução, como [kisley](https://github.com/kysely-org/kysely), [drizzle](https://orm.drizzle.team/docs/sql-schema-declaration). Dependendo do cliente, até terceirizar e usar [Planetscale](https://planetscale.com/), [Turso](https://turso.tech/), etc.
!!!

### Prisma

O _core_ dessa biblioteca é o pacote `prisma`, que **permite que você altere o schema**, se conectando a um banco de dados. Por padrão ele usa o arquivo em `prisma/schema.prisma` como base para atualizar o schema do banco de dados, e necessita de uma variável de ambiente para localizar o banco de dados a ser alterado pelos comandos.

É um pacote adicionado como **dependência de desenvolvedor**, pois é uma ferramenta CLI (Command Line Interface), e **não é executada por** nenhum **código** do programa.

### Prisma Client

O cliente Prisma, pacote `@prisma/client`, **permite usar código para ler e alterar as informações do banco de dados**. Basta instanciar o cliente e fazer as chamadas para encontrar ou criar novos registros no banco de dados.

### Prisma studio

É um adicional do Prisma, que **permite ver e alterar o estado do banco de dados por interface gráfica**. Ele pode ser usado mesmo que Prisma não esteja sendo usado no projeto. Basta passar a url de conexão do banco de dados e _tadan_, interface gráfica.

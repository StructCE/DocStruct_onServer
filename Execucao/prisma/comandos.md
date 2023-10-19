---
order: 1
icon: file-code
label: "Como usar Prisma ORM ?"
author:
  name: Araújo
  avatar: ../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Comandos
---

## Criando Models

O Prisma tem sua própria sintaxe para declarar o schema no banco de dados.

<!-- syntax highlighting de go porque não existe de Prisma -->

```go
// prisma/schema.prisma

generator client {
  provider = "prisma-client-js"
  output   = "./generated/client"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model User {
  id       Int      @id @default(autoincrement())
  username String
  email    String   @unique
  posts    Post[]
}

model Post {
  id        Int      @id @default(autoincrement())
  title     String
  content   String
  published Boolean  @default(false)
  authorId  Int
  author    User     @relation(fields: [authorId], references: [id])
}
```

Neste exemplo, criamos duas models: "User" e "Post", na qual a model "User" tem campos como "id", "username" e "email", enquanto a model "Post" possui campos como "id", "title", "content", "published", "authorId", e uma relação com o autor ("User").

!!! Autenticação por biblioteca
Atenção que ao usar autenticação por biblioteca pode ser necessário conformar as tabelas do banco de dados à biblioteca!! Por exemplo, o [Next Auth requer 3 models](https://authjs.dev/reference/adapter/prisma#create-the-prisma-schema-from-scratch) com certos atributos para que funcione corretamente.
!!!

### Efetivando as alterações no prisma.schema

Em desenvolvimento, o recomendado é simplesmente rodar

```bash
pnpm prisma db push
```

!!! push ou migrate?
O Prisma também permite gerar migrações em sql (útil em ambiente de produção). Em ambiente de desenvolvimento, usar `db push` para forçar a mudança no banco de dados facilita nossa vida.
!!!

### Documentação oficial sobre

[Documentação Criação de Models](https://www.prisma.io/docs/concepts/components/prisma-schema/data-model#defining-a-default-value)

[Documentação Relacionamento entre Models](https://www.prisma.io/docs/concepts/components/prisma-schema/relations)

## Instanciando novo cliente prisma

Para podermos consumir/usar o banco de dados, precisamos instanciar um cliente. Como só deve ser instanciado um cliente por aplicação, é comum centralizarmos o código de instanciação em um único arquivo.

A forma mais simples de instanciar um novo cliente é:

```ts
// prisma/index.ts
import { PrismaClient } from "@prisma/client";

// exportando tipagens a partir desse arquivo
export * from "@prisma/client";

// exportando o cliente
export const prisma = new PrismaClient({
  // // Opções, como:
  // log: ["query", "error", "warn"]
});
```

A maneira anterior pode causar vazamento de memória em ambiente de desenvolvimento. Às vezes o recarregamento da aplicação, quando salvas um arquivo, o código que gera o cliente é rodado outra vez. Isso pode acabar gerando várias instâncias.

```ts
// prisma/index.ts
import { PrismaClient } from "@prisma/client";

export * from "@prisma/client";

// globalThis é palavra chave para uma variável global em JS
// a passagem é por referência quando usamos objeto
const globalForPrisma = globalThis as { prisma?: PrismaClient };

export const prisma =
  globalForPrisma.prisma ||
  new PrismaClient({
    log:
      process.env.NODE_ENV === "development"
        ? ["query", "error", "warn"]
        : ["error"],
  });

// se não estiver em ambiente de produção, guarde a instância na variável global
if (process.env.NODE_ENV !== "production") globalForPrisma.prisma = prisma;
```

## CRUD

Garanta que seguiu primeiro o [passo anterior](#instanciando-novo-cliente-prisma).

Neste exemplo, estamos rodando os arquivos com ts-node, que transpila o TS e roda o JS resultante com Node. A ideia é a mesma usando api em Express, NextJS, etc.

### Read(Get/Index)

1. Criar um arquivo TypeScript

```bash
touch index.ts
```

2. Modificar o arquivo typescript

```ts
// index.ts

import { prisma } from "./prisma";

async function getAllUsers() {
  const users = await prisma.user.findMany();
  return users;
}

getAllUsers().then((users) => {
  console.log("Usuários encontrados:", users);
});
```

3. Executar arquivo typescript

```bash
pnpm ts-node index.ts
```

### Read(Get/Show)

1. Criar um arquivo TypeScript

```bash
touch show.ts
```

2. Modificar o arquivo typescript

```ts
// show.ts

import { prisma } from "./prisma";

async function getUserById(userId) {
  const user = await prisma.user.findUnique({
    where: {
      id: userId,
    },
  });
  return user;
}

getUserById(1).then((user) => {
  console.log("Usuário encontrado:", user);
});
```

3. Executar arquivo typescript

```bash
pnpm ts-node show.ts
```

### Create(Post)

1. Criar um arquivo TypeScript

```bash
touch create.ts
```

2. Modificar o arquivo typescript

```ts
// create.ts

import { prisma } from "./prisma";

async function createUser(username, email) {
  const user = await prisma.user.create({
    data: {
      username,
      email,
      // ...
    },
  });
  return user;
}

createUser("john_doe", "john@example.com").then((user) => {
  console.log("Usuário criado:", user);
});
```

3. Executar arquivo typescript

```bash
pnpm ts-node create.ts
```

### Delete(Delete)

1. Criar um arquivo TypeScript

```bash
touch delete.ts
```

2. Modificar o arquivo typescript

```ts
// delete.ts

import { prisma } from "./prisma";

async function deleteUser(userId) {
  const user = await prisma.user.delete({
    where: {
      id: userId,
    },
  });
  return user;
}

deleteUser(1).then((user) => {
  console.log("Usuário excluído:", user);
});
```

3. Executar arquivo typescript

```bash
pnpm ts-node delete.ts
```

### Update(Put e Patch)

1. Criar um arquivo TypeScript

```bash
touch update.ts
```

2. Modificar o arquivo typescript

```ts
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function updateUser(userId, newData) {
  const user = await prisma.user.update({
    where: {
      id: userId,
    },
    data: {
      data: newData
    },
  });
  return user;
}

updateUser(1, {'new_email@example.com'})
  .then((user) => {
    console.log('Usuário atualizado:', user);
  })
```

3. Executar arquivo typescript

```bash
pnpm ts-node update.ts
```

### Documentação oficial sobre

[Documentação CRUD do Prisma](https://www.prisma.io/docs/concepts/components/prisma-client/crud)

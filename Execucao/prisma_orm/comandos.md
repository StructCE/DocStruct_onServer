---
order: 1
icon: rocket
label: "Como usar Prisma ORM ?"
author:
  name: Araújo
  avatar: ../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Comandos
---

## Criando Models

```prisma
# prisma/schema.prisma

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

### Criar as tabelas no banco de dados

```bash
pnpm prisma db push
```

### Documentação sobre a criação de models

[Documentação Criação de Models](https://www.prisma.io/docs/concepts/components/prisma-schema/data-model#defining-a-default-value)

[Documentação Relacionamento entre Models](https://www.prisma.io/docs/concepts/components/prisma-schema/relations)

## CRUD

### Read(Get/Index)

1. Criar um arquivo TypeScript

```bash
touch index.ts
```

2. Modificar o arquivo typescript

```ts
// index.ts

import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

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

#### Quer saber mais sobre Read ?

[Documentação Pesquisa de Dados](https://www.prisma.io/docs/concepts/components/prisma-client/crud#read)

### Read(Get/Show)

1. Criar um arquivo TypeScript

```bash
touch show.ts
```

2. Modificar o arquivo typescript

```ts
// show.ts

import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

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

#### Quer saber mais sobre Read ?

[Documentação Pesquisa de Dados](https://www.prisma.io/docs/concepts/components/prisma-client/crud#read)

### Create(Post)

1. Criar um arquivo TypeScript

```bash
touch create.ts
```

2. Modificar o arquivo typescript

```ts
// create.ts

import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

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

#### Quer saber mais sobre Create ?

[Documentação Criação de Dados](https://www.prisma.io/docs/concepts/components/prisma-client/crud#create)

### Delete(Delete)

1. Criar um arquivo TypeScript

```bash
touch delete.ts
```

2. Modificar o arquivo typescript

```ts
// delete.ts

import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

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

#### Quer saber mais sobre Delete ?

[Documentação Exclusão de Dados](https://www.prisma.io/docs/concepts/components/prisma-client/crud#delete)

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

#### Quer saber mais sobre Update ?

[Documentação Atualização de Dados](https://www.prisma.io/docs/concepts/components/prisma-client/crud#update)

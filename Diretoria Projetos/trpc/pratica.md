---
order: 1
icon: diamond
label: Prática
---

# Prática

tRPC é uma ferramenta para comunicação entre back-end e front-end, então começaremos definindo rotas no back:

## Criando a instância de rota tRPC

No back-end, criaremos um arquivo `trpc.ts` onde inicializaremos a instância tRPC e exportaremos o roteador `router` da instância, para definirmos as rotas, e o protocolo de procedimento, definido como `publicProcedure`, atráves do qual iremos fazer as requisições.

``` ts "./server/trpc.ts"
import { initTRPC } from '@trpc/server';

const t = initTRPC.create();
export const router = t.router;
export const publicProcedure = t.procedure;
```


## Definindo as rotas

!!!
Neste caso, usaremos um banco de dados bem simples de usuários atribuindo somente um id e um nome, além de requisições GET e CREATE:

``` ts "./server/db"
type User = { id: string; name: string };

const users: User[] = [];
export const db = {
  user: {
    findMany: async () => users,
    findById: async (id: string) => users.find((user) => user.id === id),
    create: async (data: { name: string }) => {
      const user = { id: String(users.length + 1), ...data };
      users.push(user);
      return user;
    },
  },
};
```

!!!


Então, importamos o roteador `router` do arquivo feito anteriormente e criamos uma aplicação `appRouter`, onde definiremos as rotas.

``` ts "./server/index.ts"
import { db } from './db';
import { publicProcedure, router } from './trpc';

const appRouter = router({
  userList: publicProcedure
    .query(async () => {
      const users = await db.user.findMany();
      return users; 
    }),
});
```

Usamos o `publicProcedure`, que definirmos anteriormente, para efetuar requisições/procedimento ao servidor.
Um procedimento pode ser:
- `query` busca de informação
- `mutation` criação, atualização ou delete de informação
- `subscription` cria uma ligação persistente com o servidor e recebe mudanças.

No caso, estamos definindo uma requisição `userList` que irá listar todos os usuários de um servidor, logo usamos `query`.

## Entrada de Dados

Para receber entrada de informações, basta usar o `.input()` passando como parâmetros um possível tratamento de dados.
Usamos o pacote "zod" para fazer a validação da entrada de dados (input).
Os campos nos quais deseja fazer alguma validação coloque z.tipoDeDadoDesejado(validação desejada), exemplo:

``` ts "./server/index.ts"
import { z } from 'zod';
 
const appRouter = router({
  userById: publicProcedure
    .input(z.string()) // No caso queremos que o input seja uma string (o nome)
    .query(async (opts) => {
      const { input } = opts
      const user = await db.user.findById(input);
      return user;
    }),
});
```

É possível passar um objeto com alguns parâmetros de mensagens personalizadas, por exemplo:

``` ts
const name = z.string({
  required_error: "É requirido um nome",
  invalid_type_error: "O nome deve ser uma string"
});
```

Para mais informações sobre o a validação de dados, clique [aqui](https://zod.dev)

## Servidor

Agora que criamos as rotas para a aplicação, podemos criar o servidor que irá receber as requisições pelo roteador:

``` ts "./server/index.ts"
import { createHTTPServer } from '@trpc/server/adapters/standalone';
 
const appRouter = router({
  // Todas as rotas aqui, anteriormente definidas.
});
 
const server = createHTTPServer({
  router: appRouter,
});
 
server.listen(3000);
```

Criamos o nosso servidor `server` passando como `router` a aplicação `appRouter` que fizemos. Também definimos a porta 3000 que o servidor irá ouvir como o nosso front-end.

## Configurando servidor no lado cliente

### Definindo a conexão entre servidor e cliente

A partir da importação do `appRouter` e de métodos do tRPC, iremos criar um ProxyCLient e também definir um `httpBatchLink` que transforma várias requests em uma só:

``` ts "./client/index.ts"
import { createTRPCProxyClient, httpBatchLink } from '@trpc/client';
import type { AppRouter } from './server/index.ts';

export const trpc = createTRPCProxyClient<AppRouter>({
  links: [
    httpBatchLink({
      url: 'http://localhost:3000',
    }),
  ],
});
```

Com o proxy `trpc`, exportamos para usarmos em outros arquivos ou podemos manipulá-lo no mesmo.

### Fazendo requisições no lado cliente

Com o proxy definido e exportado, podemos importar o proxy `trpc` para qualquer arquivo e fazermos requisições através dele, no exemplo usaremos no mesmo arquivo:

``` ts "./client/index.ts"
// import trpc from "./server/index.ts" (Caso esteja manipulando
// o proxy em um arquivo diferente daquele em que foi definido)
import { createTRPCProxyClient, httpBatchLink } from '@trpc/client';
import type { AppRouter } from './server/index.ts';

export const trpc = createTRPCProxyClient<AppRouter>({
  links: [
    httpBatchLink({
      url: 'http://localhost:3000',
    }),
  ],
});

const user = await trpc.userById.query('1');
const createdUser = await trpc.userCreate.mutate({ name: 'sachinraja' });
```

Nesse exemplo usamos a rota definida anteriormente `userById` que busca informações de um usuário pelo seu ID. Também usamos a rota `userCreate` que cria um usuário com nome.

<br>

####

::: sample
Para mais informações sobre tRPC, consulte [aqui](https://trpc.io/docs/quickstart)  
:::

<style>
    .sample {
        text-align: center;
        color: #1956AF;
        border-radius: 10px;
        background-color: #E1EDFF;
        border: 1px solid #1956AF;
        padding-top: 20px;
        margin-bottom: 20px;
    }
</style>
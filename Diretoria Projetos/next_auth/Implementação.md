---
order: 3
icon: diamond
label: "Como implementar o Next Auth em um projeto existente?"
---

# Instalação

Para adicionar o Next Auth ao projeto basta utilizar o seguinte comando no terminal: `yarn add next-auth `, ou `pnpm add next-auth  ` se estiver utilizando o pnpm.

# Implementação de Rotas

!!Atenção: verifique a versão do Next.js utilizada no projeto e se o tipo de roteamento usado é o `Pages Router` ou o `App Router`, pois o modo de implementação é diferente.

### Para versão de Next.js anterior à 13.2 

Para adicionar o NextAuth.js a um projeto, crie um arquivo chamado `[...nextauth].js` na pasta `pages/api/auth/` e preencha-o com o código a baixo. Este arquivo contém o manipulador de rotas dinâmicas para o NextAuth.js, que também conterá todas as configurações globais do NextAuth.js e todas as solicitações para `/api/auth/*` (`signIn`, `callback`, `signOut`, etc.) serão automaticamente tratadas pelo NextAuth.js.

```js

import NextAuth from "next-auth"
import GithubProvider from "next-auth/providers/github"

export const authOptions = {
  // Configure um ou mais provedores de autenticação
  providers: [
    GithubProvider({
      clientId: process.env.GITHUB_ID,
      clientSecret: process.env.GITHUB_SECRET,
    }),
    // ...adicione mais provedores aqui
  ],
}

export default NextAuth(authOptions)

```

### Para versão de Next.js porterior à 13.2 com o App Router

Nesse caso, crie um arquivo chamado `route.js` na pasta `app/api/auth/[...nextauth]/` e preencha-o com o código a baixo. 

```js

import NextAuth from "next-auth"

const handler = NextAuth({
  ...
})

export { handler as GET, handler as POST }

```
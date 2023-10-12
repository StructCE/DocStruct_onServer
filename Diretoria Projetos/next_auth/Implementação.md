---
order: 3
icon: diamond
label: "Como implementar o Next Auth em um projeto existente?"
---

# Instalação

Para adicionar o Next Auth ao projeto basta utilizar o seguinte comando no terminal: `yarn add next-auth `, ou `pnpm add next-auth  ` se estiver utilizando o pnpm.

# Implementação de Rotas API

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
  // ...adicione mais provedores aqui
})

export { handler as GET, handler as POST }

```
## Configurando useSession

O `useSession` é um importante hook do React que é utilizado nas aplicações Next Auth para recuperar informações da sessão de usuário.Para utilizá-lo primeiro é preciso expor o conteudo da sessão de usuário por meio do  `<SessionProvider />`,basta aplicá-lo m seu arquivo `app.jsx` como no exemplo:

```js

import { SessionProvider } from "next-auth/react"

export default function App({
  Component,
  pageProps: { session, ...pageProps },
}) {
  return (
    <SessionProvider session={session}>
      <Component {...pageProps} />
    </SessionProvider>
  )
}

```

Dessa forma, o `useSession` terá acesso aos dados e status da sessão
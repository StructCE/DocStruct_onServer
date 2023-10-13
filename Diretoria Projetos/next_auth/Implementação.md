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

# Utilização
## Configurando useSession

O `useSession` é um importante hook do React que é utilizado nas aplicações Next Auth para recuperar informações da sessão de usuário.Para utilizá-lo primeiro é preciso expor o conteudo da sessão de usuário por meio do  `<SessionProvider />`,basta aplicá-lo e m seu arquivo `app.jsx` como no exemplo:

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

## Utilização do useSession

O Hook do React useSession() usado no NextAuth.js é a maneira mais fácil de verificar se alguém está autenticado.Como no exemplo:

```js

import { useSession } from "next-auth/react"

export default function Component() {
  const { data: session, status } = useSession()

  if (status === "authenticated") {
    return <p>Signed in as {session.user.email}</p>
  }

  return <a href="/api/auth/signin">Sign in</a>
}

```
A ideia é armazenar os resultados do useSession em props para comparar com o back end e realizar a autenticação.

# Autenticação

O Next Auth possibilita que o critério de autenticação(provider) seja por meio de credenciais (nome,senha), email ou autenticações externas(google,GitHub,etc.)

## Credenciais

A autenticação por Credenciais permite lidar com o login usando credenciais arbitrárias, como nome de usuário e senha, ele vem com a restrição de que os usuários autenticados dessa maneira não se mantém no banco de dados e, consequentemente, é necessário o uso de tokens(id) para implementar a validação.Por exemplo:


```js

import CredentialsProvider from "next-auth/providers/credentials";
...
providers: [
  CredentialsProvider({
    // O nome exibido no formulário de login (por exemplo, 'Entrar com...')
    name: "Credentials",
    // 'credentials' é usado para gerar um formulário na página de login.
    // Você pode especificar quais campos devem ser enviados, adicionando chaves ao objeto 'credentials'
    // por exemplo, domínio, nome de usuário, senha, token de autenticação de dois fatores, etc.
    // Você pode passar qualquer atributo HTML para a tag <input> por meio do objeto.
    credentials: {
      username: { label: "Username", type: "text", placeholder: "jsmith" },
      password: { label: "Password", type: "password" }
    },
    async authorize(credentials, req) {
      // Adicione parâmetros aqui para procurar o usuário com base nas credenciais fornecidas.
      const user = { id: "1", name: "J Smith", email: "jsmith@example.com" }

      if (user) {
        // Qualquer objeto retornado será salvo na propriedade user 
        return user
      } else {
        // Se você retornar null, um erro será exibido, aconselhando o usuário a verificar seus dados.
        return null

        // Você também pode rejeitar este retorno de chamada com um erro, assim o usuário será redirecionado para a página de erro com a mensagem de erro como um parâmetro de consulta
      }
    }
  })
]
...

```

## OAuth

OAuth é o processo de autenticação do NextAuth que utiliza de processos de login externos preexistentes, ou seja, da ao usúario a opção de fazer a autenticação por outra plataforma como Github, Google, Twitter, etc.

Por serem processos externos de várias fontes diferentes, cada autenticação escolhida terá uma documentação específica diferente. Para acessar todos os providers externos suportados pelo NextAuth e suas respectivas documentações clique [Aqui](https://github.com/nextauthjs/next-auth/tree/main/packages/next-auth/src/providers).

Segue um exemplo demonstrativo do Google como provider OAuth:

```js

import GoogleProvider from "next-auth/providers/google"

GoogleProvider({
  clientId: process.env.GOOGLE_CLIENT_ID,
  clientSecret: process.env.GOOGLE_CLIENT_SECRET,
  profile(profile) {
    return {
      // Retorne todas as informações de perfil de que você precisa.
      // O único campo obrigatório é o 'id'
      // para ser capaz de identificar a conta quando adicionada a um banco de dados.
    }
  },
})

```
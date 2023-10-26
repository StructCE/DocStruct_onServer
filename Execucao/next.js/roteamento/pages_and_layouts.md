---
icon: project-symlink
label: "Páginas e Layouts"
order: 5
---

# Páginas e Layouts

Em Next.js, as páginas são componentes React e, usando Pages Router, o roteamento é feito automaticamente baseado no próprio diretório das páginas.

## Rotas Index

Arquivos com nome `index` funcionam como a página padrão do diretório em que está. Por exemplo, um componente em um arquivo `pages/user/index.tsx` seria acessado na rota `/user` (`pages` é a pasta raiz e não aparece nas rotas).

## Rotas dentro de rotas

Componentes em pastas e subpastas também são roteados automaticamente pelo diretório, obedecendo à hierarquia de pastas.
Exemplo: `pages/user/login.tsx` teria uma rota `/user/login`

## Layouts

Como React é baseado em componentes, é possível montar um layout com vários componentes juntos. Como exemplo, quando precisamos de uma navbar e uma footer fixas em todas as páginas montamos um layout com estes componentes fixos:

``` ts components/layout.tsx
import Navbar from './navbar'
import Footer from './footer'
 
export default function Layout({ children }) {
  return (
    <>
      <Navbar />
      <main>{children}</main>
      <Footer />
    </>
  )
}
```


Neste exemplo, a navbar e a footer são importadas para um arquivo de layout e, assim, cria uma função Layout que recebe um componente como parâmetro a children, que será o que estiver envolvido pelo componente.

Assim, pode-se importar o layout para o arquivo `_app.tsx`, onde fica a estrutura executada em todas as páginas da aplicação:

```ts pages/_app.tsx
import Layout from '../components/layout'
 
export default function MyApp({ Component, pageProps }) {
  return (
    <Layout>
      <Component {...pageProps} />
    </Layout>
  )
}
```

Deste modo, o componente será inicializado dentro do layout.




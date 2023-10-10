---
icon: globe
label: "Navegação e Link"
order: 3
---

O Next, com o componente `Link`, permite a transição entre rotas pelo lado do cliente. Esse componente redireciona para uma rota, mas sem fazer o carregamento total da página, algumas informações são guardadas no navegador para tornar o roteamento mais rápido.

Um exemplo desse componente: 

``` ts 
import Link from 'next/link'
 
function Home() {
  return (
    <Link href = "/profile"> Perfil <Link>
  )
}
 
export default Home
```

O componento Link adiciona o parâmetro recebido em `href` à rota atual. Ou seja, um `Link` para `/profile` partindo da rota `/user` redirecionará para `/user/profile`.

## Linkando para rotas dinâmicas

Para passar rotas dinâmicas para o componente Link através de URL's dinâmicos:

```ts
import Link from 'next/link'
 
function Post( post ) {
  return (
        <Link href={`/user/profile/${encodeURIComponent(post.userId)}`}>
          Perfil do Usuário
        </Link>
  )
}
 
export default Post
```

No TypeScript, para passar um parâmetro em meio a uma string deve-se usar crase (``) no lugar de aspas e envolver o segmento dinâmico entre ${segmento dinâmico}. Além da função `encodeURIComponent`, que codifica uma string para torná-la compatível ao sistema de caracteres utf-8.

Ou, invés de se passar uma URL para o componente Link, pode-se passar um objeto URL, como exemplo:

```ts
import Link from 'next/link'
 
function Post( post ) {
  return (
        <Link href={{
          pathname: '/user/profile/[id]',
          query: { id: [post.userId]}
        }}>
          Perfil do Usuário
        </Link>
  )
}
 
export default Posts
```

Onde no parâmetro `pathname` deve-se passar a rota do componente a qual quer se redirecionar. No parâmetro `query`, passa-se um objeto declarando o seguimento dinâmico, no caso é o `[id]`.

## Usando router

Assim como o componente Link, também é possível fazer navegações pelo lado do cliente com o useRouter:

```ts
import { useRouter } from 'next/router'
 
export default function Post( post ) {
  const router = useRouter()
 
  return (
    <button onClick={() => router.push(`/user/profile/${post.userId}`)}>
      Perfil do Usuário
    </button>
  )
}
``` 

Usa-se o `useRouter` para ter acesso ao roteador do projeto e, assim, manipular a transição de rotas através do método `push()`, passando a rota como parâmetro.
Como `router.push()` é uma função em TypeScript, deve-se passar ela como parâmetro de algum componente para ser executada em algum momento, como no evento `onClick` no componente `button`.

## Shallow routing

Há também a opção de Shallow Routing, um roteamento "por baixos dos panos", isso porque usa-se o `router.push()`, modificando o estado do roteador, mas não mudando a página. Para isso, é necessário passar como parâmetro do método `push()` um objeto declarando `shallow: true`, como no exemplo:

```ts 
import { useEffect } from 'react'
import { useRouter } from 'next/router'
 
function Post( post ) {
  const router = useRouter()
 
  useEffect(() => {
    // Vou mudar o estado do roteador, com diferentes parâmetros, mas com o mesmo componente.
    router.push(`/${post.id + 1}`, { shallow: true })
  }, [])
 
export default Post
```

!!!
O Shallow Routing só funciona se a nova URL estiver na mesma página, caso contrário a nova página será carregada e o shallow routing ignorado. No exemplo, passei um Shallow Routing e, como o estado do roteador mudará, porém a página ainda é a mesma (`post`), funcionará devidamente.
!!!
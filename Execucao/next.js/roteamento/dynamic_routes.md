---
icon: webhook
label: "Rotas Dinâmicas"
order: 4
---

# Rotas dinâmicas

Caso seja necessário uma rota dinâmica para alguma página, principalmente para utilizar dados da rota, deve se nomear o arquivo entre colchetes ([]). Por exemplo, um arquivo de nome `pages/user/profile/[id].tsx` poderia ter uma rota `/user/profile/2` a qual teria como parâmetro o id = 2. 

Já pra pegar todos os parâmetros que são passados para uma rota dinâmica, como no caso `/user/profile/2/4`, deve-se usar a seguinte notação no arquivo `/pages/user/profile/[...id].tsx`. 

Para tornar os parâmetros dinâmicos opcionais em determinada rota, pode-se usar os colchetes duplos. Assim, uma rota sem parâmetros, nesse contexto, seria o mesmo que acessar  `/user/profile` que é a rota para o arquivo `index.tsx` do respectivo diretório.

!!!
Os segmentos de rotas dinâmicas podem ser acessados pelo useRouter. No useRouter é recebido um objeto `router` que contém a chave `query`, também um objeto, que terá uma chave com o valor de uma array, onde estará os parâmetros. Exemplo :

```ts /user/profile/[id].tsx

import { useRouter } from 'next/router'
 
export default function Page() {
  const router = useRouter()
}

// O useRouter nos devolve um objeto que, olhando somente para o query, tem a seguinte estruturação: 
router = {"query": { id: [parametros[0], parametros[1], ..., parametros[n]]}}
```
!!!
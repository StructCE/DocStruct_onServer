---
order: 3
icon: diamond
label: "TypeScript"
---

# Por que usar TypeScript?

Se você já programou em JavaScript, torna-se ainda mais fácil programar em TypeScript, afinal eles são basicamente "a mesma coisa". O que isso quer dizer? É que o TypeScript é na verdade um superset open-source, desenvolvido pela Microsoft, ou seja, uma extensão da linguagem JavaScript, com a adição de algumas propriedades que melhoram o nosso código.

Tá, mas ainda não chegamos no tópico principal desta introduçaço né... por que usar o TypeScript? Para começar, ele funciona como uma ferramenta que adiciona tipagem estática ao JavaScript, que pode ser escrita em qualquer ambiente de desenvolvimento e que, quando instalada via gerenciador de pacotes JS, permite checar erros e utilizar outros compiladores que suportam este mecanismo. Com isso, o TypeScript eleva o nível de produtividade e ainda garante o desenvolvimento de aplicações complexas, eficazes e seguras.
Além do potencial de detecção de erros durante o desenvolvimento de projetos, outra vantagem é a possibilidade de incluir a IntelliSense da IDE que está sendo usada. Isso reflete num ambiente muito mais ágil e seguro enquanto o código está sendo digitado pelo desenvolvedor.

## Verificador de Tipos Estáticos

Detecção de erros sem execução do código é chamada de verificação estática, e determinar o que é um erro e o que não é, baseado nos tipos dos valores sendo operados é chamado de verificação de tipos. TypeScript verifica um programa por erros antes de sua execução e faz isso baseado nos tipos dos valores, ou seja, é um verificador de tipos estático. Ele adiciona regras de tipagem e regras sobre como diferentes tipos de valores podem ser usados

Além do mais, a grosso modo, uma vez que o compilador do TypeScript terminou de verificar o seu código, ele apaga os tipos para produzir o código resultante "compilado". Isso significa que uma vez que seu código for compilado, o código JS puro de resultado não tem informação de tipo, ou seja, o TypeScript nunca muda o comportamento do seu programa baseado nos tipos que infere.

Para treinar e exercitar nossa escrita de código, o TypeScript tem um [playground online](https://www.typescriptlang.org/play#).

# Definindo Tipos

Em TypeScript, dois pontos depois de um nome de variável inicia uma anotação de tipo, e a assinatura de tipo depois dos dois pontos descreve os valores que a variável pode ter. Por exemplo, a linha a seguir informa ao TypeScript que _variavel_ sempre armazenará números:

```
let variavel: number;
```

Você pode se perguntar se a inicialização de **undefined** de _variavel_ não viola o tipo estático. O TypeScript contorna esse problema não permitindo que você leia _variavel_ antes de atribuir um valor a ele.

# Tipos por Inferência

TypeScript conhece a linguagem JavaScript e vai gerar tipos para você em muitos casos, inferindo por meio da atribuição de valores, quando na declaração do que está sendo atribuído. Ficou muito confuso? Por exemplo, quando criamos uma variável e atribuímos a ela um determinado valor, como uma string, TypeScript usará o valor como seu tipo, ou seja, esta varíavel estará automaticamente tipada para aguardar uma string, sem a necessidade de explicitar isso.

```
let variavel = "algum texto";  // variavel: string
```

# Como descrever tipos?

O que vem depois dos dois pontos de uma anotação de tipo pode variar de simples a expressões complexas, e agora estudaremos todas essas assinaturas e como essas expressões podem ser criadas

## Tipos básicos

- Tipos estáticos primitivos do JavaScript: **undefined**, **null**, **boolean**, **number**, **string**, **symbol**, **object**
- Tipos específicos do TypeScript: **any** (o tipo de todos os valores), **unknown** (o tipo de um valor desconhecido), etc.

_Obs.: Tenha cuidado ao utilizar o tipo unknown. Tenha certeza do que está fazendo_

## União de tipos

Com TypeScript, você pode criar tipos complexos combinando os simples. Com uma união, você pode declarar que um tipo pode ser um de muitos. Para isso, basta combinar os tipos que deseja com o operador **|**

```
let variavel: number | null = null;
variavel = 123
```

O código acima é compilado adequadamente, pois você explicitamente declarou que _variavel_ pode assumir tanto um valor numérico quanto **null**

## Tipos em Array

Os arrays serão definidos aqui das duas formas seguintes (e às vezes uma mistura dos dois):

- _Lists_: Todos os elementos têm o mesmo tipo e o comprimento do array pode variar.
- _Tuple_: Os elementos não têm necessariamente o mesmo tipo, porém o comprimento do array é fixo.

### Array como list

Existem duas maneiras de descrever um array como uma lista:

```
let arr1 = number[] = [1, 2, 3];
let arr2 = Array<number> = [1, 2, 3, 4];
```

No exemplo acima, tanto _arr1_ quanto _arr2_ são tipados como arrays de tamanho variável, cujos elementos são todos valores numéricos

### Array como tuple

Suponha que você deseja agora armazenar um par de chave e valor, resultado da operação _Object.entries(obj)_, e você espera que _obj_ é um objeto cujas chaves são strings e os valores são números.

```
let obj = {a: 1, b: 2}
let primeiroParChaveValor: [string, number] = Object.entries(obj)[0]
```

No exemplo acima, descrevemos _primeiroParChaveValor_ como um array de tamanho definido de 2 elementos, onde o primeiro deve ser uma string e o segundo deve ser um valor numérico.

## Tipos em funções

Ao descrever tipos para funções, estaremos descrevendo tanto os tipos dos parâmetros que a função aguarda, quanto também o tipo do seu retorno. O exemplo abaixo é uma anotação de tipo para todas as funções que aguardam um único parâmetro, sendo ele um número, e retornam um booleano:

```
(num: number) => boolean
```

O código a seguir é um exemplo mais realista:

```
const verificaPositivo: (num: number) => boolean = (num) => {
    if (num >= 0) {
        return true;
    }
    return false;
}
```

Outra forma de descrever a função acima é descrever separadamente os tipos do parâmetro da função e de seu retorno:

```
function verificaPositivo2(num: number): boolean {
    if (num >= 0) {
        return true;
    }
    return false;
}
```

_Obs.: se excluirmos o boolean na declaração da função acima, o TypeScript é inteligente o suficiente para inferir o tipo do retorno, a partir do escopo da função_

Porém, e se minha função não retornar nada? Terei que forçar um retorno que não desejo, só para poder tipar a função?? Não! Para começar, funções que "não retornam nada" no JavaScript estão na verdade retornando **undefined** implicitamente, e um dos tipos muito úteis que o TypeScript nos fornece é o **void**, o qual diz que a função sempre retorna **undefined**, explícito ou implicitamente.

```
function retornaNada(): void { return undefined } // ok
function retornaNada2(): void { } // ok
```

## Tipos em objetos

Para tipar objetos, iremos aqui definir uma quantidade fixa de propriedades, conhecidas no momento do desenvolvimento, e cada propriedade pode ter um tipo diferente.

Por exemplo, para criar um objeto com um tipo definido por incluir _nome: string_ e _id: number_, faremos as seguintes descrição e declaração:

```
let usuario: {
    nome: string;
    id: number;
}

usuario = {
    nome: 'Fulano',
    id: 1
}
```

## Criando tipos personalizados

Suponha que tenhamos no nosso código diversas variáveis que utilizam a mesma notação de tipo. Se formos reescrever a notação toda vez que declararmos mais uma variável, a escrita do código não seria nada prática e produtiva para o nosso desenvolvimento. Porém, o TypeScript nos fornece poderosas abstrações para reutilização de tipos: **interface** (para denotar tipos de objetos ou classes) e **type** (para denotar qualquer tipo)

```
type Point = {
    x: number;
    y: number;
}

// interface Point {
//     x: number;
//     y: number;
// }

let point: Point;
let point2: Point;
```

Essa alteração permite que o tipo _Point_ seja usado em vários locais dentro do código sem precisar redefinir os detalhes do tipo repetidas vezes.

E ainda não acabou, o TypeScript também nos permite estender **types** ou **interfaces**, para compor tipos mais complexos a partir de tipos simples:

```
type Point3d = Point & {
    z: number;
}

// interface Point3d extends Point {
//     z: number;
// }

const point3d = {
    x: 5,
    y: -5,
    z: 2
};
```

No exemplo acima, o tipo _Point3d_ resultante consistiria nas propriedades _x_ e _y_ do type ou da interface _Point_, além da nova propriedade _z_

## type alias x interface

Embora **type** e **interface** pareçam similar em uma primeira olhada superficial, há na verdade muitas diferenças entre eles

Portanto, vamos examinar as principais características de cada uma dessas duas ferramentas e comparar suas utilizações

### Interfaces

As interfaces possibilitam o que chamamos de **declaration merging**: quando duas interfaces são declaradas com o mesmo nome, ocorre uma mescla e junção dessas duas. Está é uma maneira de extender uma interface, porém de forma menos explícita, o que não é uma prática recomendável quando no desenvolvimento de determinados projetos.

Ótimas para definir a estrutura de objetos ou classes, as interfaces são ideais para desenvolver um projeto aberto para implementações e extensões de comportamento, como para o desenvolvimento de bibliotecas e frameworks.

### Type alias

Permitindo criar "aliases" - ou seja, apelidos - para tipos primitivos, funções, objetos e uniões ou composições destes tipos básicos, **type** é uma ferramenta poderosa para expandir a tipagem do seu projeto a um nível muito avançado.

Ele permite você denotar diversos tipos e realizar uniões e interseções deles

```
type PersonName = {
    name: string;
}

type PersonAge = {
    age: number;
}

type Person = PersonName & PersonAge;
type PersonNameOrAge = PersonName | PersonAge

const person1: Person = {
    name: 'Fulano',
    age: 18
};
const person2: PersonNameOrAge = {
    name: 'Beltrano'
};
const person3: PersonNameOrAge = {
    age: 20
};
```

## Parâmetros opcionais

Se na estrutura da sua anotação de tipo, uma propriedade pode ser omitida, você pode colocar um ponto de interrogação após o seu nome:

```
type Point = {
    x: number;
    y: number;
    z?: number;
}

let point: Point;

point = { x: 0, y: 0, z: 0 } // OK
point = { x: 0, y: 0 } // OK
```

Aqui, ao invés de especificar um tipo separado para um ponto tridimensional, simplesmente tornamos a propriedade _z_ opcional.

## Sistemas de Tipos Estruturais

Quando o TypeScript compara dois tipos de objetos diferentes, para decidir se eles correspondem ou não, isso é feito estruturalmente. Isso significa que, ao invés de comparar os tipos, verificando se os dois herdam o mesmo objeto de restrição (como **instanceof**), as propriedades de cada objeto são comparadas

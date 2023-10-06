---
order: 3
icon: diamond
label: "TypeScript"
---

# Por que usar TypeScript?

Brainstorm:

TypeScript é um superset do JavaScript
TypeScript é uma linguagem open-source, desenvolvida pela Microsoft, que é uma extensão do JavaScript. Ele adicionar tipagem estática ao JavaScript, tornando mais fácil detectar e prevenir erros durante o processo de desenvolvimento
Inclusão de ferramentas que não possuem no JavaScript e que nos auxiliem na construção de códigos com menos erros, eliminando a necessiade de algumas depurações complexas
Benefício principal do TypeScript é que ele pode destacar comportamento inesperado no seu código, diminuindo a chance de bugs.
TypeScript funciona como uma ferramente fortemente tipada que pode ser escrita em qualquer ambiente de desenvolvimento e que, quando instalado via gerenciador de pacotes JS, permite checar erros e utilizar outros compiladores que suportam este mecanismo
TypeScript eleva o nível de produtividade e ainda garante o desenvolvimento de aplicações complexas, eficazes e seguras.
Vantagens: o potencial de detecção de erros durante o desenvolvimento de projetos e a possibilidade de incluir a IntelliSense da IDE que está sendo usada. Isso reflete num ambiente muito mais ágil e seguro enquanto o código está sendo digitado pelo usuário

## Verificador de Tipos Estáticos

Brainstorm:

Detecção de erros sem execução do código é chamada de verificação estática. Determinar o que é um erro e o que não é, baseado nos tipos dos valores sendo operados é chamado de verificação estática de tipos.
TypeScript verifica um programa por erros antes de sua execução e faz isso baseado nos tipos dos valores, ou seja, é um verificador de tipos estáticos.
TypeScript adiciona regras de tipagem e regras sobre como diferentes tipos de valores podem ser usados.
O verificador de tipo do TypeScript é desenvolvido para permitir programas corretos, enquanto previne quantos erros comuns forem possíveis
A grosso modo, uma vez que o compilador do TypeScript terminou de verificar o seu código, ele apaga os tipos para produzir o código resultante "compilado". Isso significa que uma vez que seu código for compilado, o código JS puro de resultado não tem informação de tipo. Isso significa que TypeScript nunca muda o comportamento do seu programa baseado nos tipos que infere. O fim d

# Tipos por Inferência

TypeScript conhece a linguagem JavaScript e vai gerar tipos para você em muitos casos, inferindo por meio da atribuição de valores, quando na declaração do que está sendo atribuído. Ficou muito confuso? Por exemplo, quando criando uma variável e atribuindo a ela um determinado valor, como uma string, TypeScript usará o valor como seu tipo, ou seja, esta varíavel estará automaticamente tipada para aguardar uma string, sem a necessidade de explicitar isso.

```
let variavel = "algum texto"  // variavel: string
```

# Definindo Tipos

## type e interface

# Compondo Tipos

## Uniões

## Genéricos

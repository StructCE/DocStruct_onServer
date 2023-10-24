---
order: 3
icon: gear
label: "Configurando o Ambiente"
author:
  name: Paulo Fernando
  avatar: ../../Imagens DocStruct/Logos/logo_struct.png
category: Instalação
tags:
  - typescript
  - instalacao
date: 2023-10-24
---

## Por que usar TypeScript?

Se você já programou em JavaScript, torna-se ainda mais fácil programar em TypeScript, afinal eles são basicamente "a mesma coisa". O que isso quer dizer? É que o TypeScript é na verdade um superset open-source, desenvolvido pela Microsoft, ou seja, uma extensão da linguagem JavaScript, com a adição de algumas propriedades que melhoram o nosso código.

Tá, mas ainda não chegamos no tópico principal desta introdução né... por que usar o TypeScript? Para começar, ele funciona como uma ferramenta que adiciona tipagem estática ao JavaScript, que pode ser escrita em qualquer ambiente de desenvolvimento e que, quando instalada via gerenciador de pacotes JS, permite checar erros e utilizar outros compiladores que suportam este mecanismo. Com isso, o TypeScript eleva o nível de produtividade e ainda garante o desenvolvimento de aplicações complexas, eficazes e seguras.
Além do potencial de detecção de erros durante o desenvolvimento de projetos, outra vantagem é a possibilidade de incluir a IntelliSense da IDE que está sendo usada. Isso reflete num ambiente muito mais ágil e seguro enquanto o código está sendo digitado pelo desenvolvedor.

## Verificador de Tipos Estáticos

Detecção de erros sem execução do código é chamada de verificação estática, e determinar o que é um erro e o que não é, baseado nos tipos dos valores sendo operados é chamado de verificação de tipos. TypeScript verifica um programa por erros antes de sua execução e faz isso baseado nos tipos dos valores, ou seja, é um verificador de tipos estático. Ele adiciona regras de tipagem e regras sobre como diferentes tipos de valores podem ser usados.

Além do mais, a grosso modo, uma vez que o compilador do TypeScript terminou de verificar o seu código, ele apaga os tipos para produzir o código resultante "compilado". Isso significa que uma vez que seu código for compilado, o código JS puro de resultado não tem informação de tipo, ou seja, o TypeScript nunca muda o comportamento do seu programa baseado nos tipos que infere.

Para treinar e exercitar nossa escrita de código, o TypeScript tem um [playground online](https://www.typescriptlang.org/play#).

# Documentação: Componente de Radio Input em ReactJS

O componente `Radio Input` é  um input personalizado que isola a aparência para estilização em React.

## Instalação

Para usar este componente, você precisa ter a biblioteca @radix-ui/react-radio-group instalada em seu projeto. Você pode instalá-la com o comando:
`pnpm install @radix-ui/react-radio-group`

## Adicionando Radio Input a um novo projeto

Para adicionar o Radio Input ao projeto, copie os seguintes arquivos para o seu projeto:

[RadioInput/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/RadioInput/index.tsx)
[RadioInput/svgs.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/RadioInput/example/svgs.tsx)

## Utilização 

Para usar o componente Radio Input em sua aplicação, siga os seguintes passos:

1 - Importe o componente `CustomRadio` e use ele onde você deseja exibir um input de rádio personalizado.

2 - Estilize o CustomRadio de acordo com suas preferências.

## Exemplo:

```js

import * as RadioGroup from "@radix-ui/react-radio-group";
import React, { useState } from "react";
import { ArrowUp, ArrowUpLeft, ArrowUpRight } from "./svgs";

<form onSubmit={handleSubmitMove}>
        <RadioGroup.Root
          className="flex-col flex items-center"
          value={String(direction)}
          onValueChange={handleChangeMove}
        >
          <RadioGroup.Item
            value="-1"
            className="relative w-6 h-6 focus:bg-white"
            id="left"
          >
            <ArrowUpLeft className="cursor-pointer" />
            <RadioGroup.Indicator className="w-full h-full absolute inset-0 -z-10 bg-white" />
          </RadioGroup.Item>
          <br />
          <RadioGroup.Item
            className="relative w-6 h-6 focus:bg-white"
            id="up"
            value="0"
          >
            <ArrowUp className="cursor-pointer" />
            <RadioGroup.Indicator className="w-full h-full absolute inset-0 -z-10 bg-white" />
          </RadioGroup.Item>
          <br />
          <RadioGroup.Item
            className="relative w-6 h-6 focus:bg-white"
            id="down"
            value="1"
          >
            <ArrowUpRight className="cursor-pointer" />
            <RadioGroup.Indicator className="w-full h-full absolute inset-0 -z-10 bg-white" />
          </RadioGroup.Item>
        </RadioGroup.Root>
        <br />
        <button className="flex mx-auto my-0" type="submit">
          Move
        </button>
      </form>
      <div
        className="block mx-auto my-0 -z-10 bg-red-500 w-[50px] h-[50px] duration-700 ease-in-out"
        onSubmit={handleSubmitMove}
        style={{
          transform: `translateX(${currentPosition * 200}%)`,
        }}
      />

```

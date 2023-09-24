---
order: 3
icon: diamond
label: "Como utilizar o TypeScript com o React?"
---

# De .jsx para .tsx

TypeScript é uma extensão da linguagem JavaScript. Em suma, ele traz definições de tipos para o seu código, a fim de se evitar alguns tipos de bugs e diversas depurações relacionadas tanto com a passagem de parâmetros quanto com a validação de que objetos, estados e variáveis irão se comportar como você espera.

Vale reiterar que o TypeScript não é uma nova linguagem. No final, todo seu código irá ser convertido em JavaScript, para quando for lido pelo compilador.

## Tipando props

Escrever códido TypeScript com React é bem semelhante a escrever código JavaScript com React. A principal diferença está no fato de que, quando trabalhando com um componente em TypeScript, você terá que declarar e prover tipos para as props dos seus componentes.

* JavaScript:

```
export function MyButton({ content }) {
  return <button>{ content }<button/>
}
```

* TypeScript:

```
export function MyButton({ content } : { content: string | ReactElement }) {
  return <button>{ content }<button/>
}
```

No exemplo acima, provemos, de forma inline, um tipo para o content do button. Entretanto, podemos separar isso da declaração do componente. A seguinte sintaxe é uma forma simples e básica de prover tipos para o seu componente React, sem ser de forma inline, o que nos possibilitará, mais a frente, aprendermos como reutilizar e expandir tipagens.

* Declarando tipos

```
interface MyButtonProps {
  content: string | ReactElement;
  onClick?: () => void;
}

// type MyButtonProps = {
//   content: string | ReactElement;
//   onClick?: () => void;
// }

export function MyButton({ content, onClick } : MyButtonProps) {
  return <button onClick={ onClick }>{ content }<button/>
}
```

## Pacote @types/react

O pacote [@types/react](https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/react/index.d.ts) inclui diversos tipos para o nosso código de React, nos possibilitando prover tipagens para hooks built-in, eventos e diversos elementos. Assim, você pode usá-los sem precisar realizar nenhuma configuração adicional no seu repositório e no seu código.

### Hooks nativos

* useState

O hook useState é capaz de realizar inferência de tipos, a partir do valor inicial passado na declaração do estado.

```
const [state, setState] = useState("string")
```

No código acima, será inferido que state é uma string e que setState é uma função que aguarda uma string ou uma função que retorna uma string.

Uma forma mais inteligente de tipar seus estados é realizando a declaração de tipos na chamada do useState, como no código abaixo:

```
const [state, setState] = useState<string | number>("45")

type Pet = 
  |  { cat: { meowing: "meow" | "meooow", color: "orange" | "black" | "white" } }
  |  { dog: { bark: "auau" | "auuuuu", color: "caramel" | "brown" | "black" } };

const [pet, setPet] = useState<Pet>({ cat: { meowing: "meow", color: "black" } })
```

* useContext

A tipagem, quando no uso do useContext, ocorre na criação do contexto, por meio da chamada do createContext.

Assim como no useState, é possível a inferência de tipos, de acordo com o valor default passado dentro do createContext; porém, para casos mais complexos, recomenda-se realizar uma tipagem de forma mais inteligente, como no exemplo abaixo:

```
import { createContext, useContext, useState } from 'react';

type Theme = "light" | "dark" | "system";
const ThemeContext = createContext<Theme>("system");

const useGetTheme = () => useContext(ThemeContext);

export default function MyApp() {
  const [theme, setTheme] = useState<Theme>('light');

  return (
    <ThemeContext.Provider value={theme}>
      <MyComponent />
    </ThemeContext.Provider>
  )
}
```

### Eventos

Quando se trabalha com eventos DOM no React, o tipo do evento é possível de ser inferido pelo event handler. Entretanto, quando quando você quer criar uma função a ser passada para o event handler, você então precisa explicitamente definir o tipo do evento.

O pacote @types/react fornece uma [lista muito ampla](https://github.com/DefinitelyTyped/DefinitelyTyped/blob/b580df54c0819ec9df62b0835a315dd48b8594a9/types/react/index.d.ts#L1247C1-L1373) de tipos que você usar para manipular eventos no seu código. Eles usam uma sintaxe semelhante, baseada em `FenomenoEvent<Elemento>`, onde Elemento é o tipo do elemento do qual o evento é gerado. Seguem alguns exemplos:

* Para onChange de um input, use ChangeEvent

```
import { useState, type ChangeEvent } from 'react';

export default function MyInput() {
  const [value, setValue] = useState("");

  function handleChange(event: ChangeEvent<HTMLInputElement>) {
    setValue(event.target.value);
  }

  return (
    <>
      <input value={value} onChange={handleChange} />
      <p>Value: {value}</p>
    </>
  );
}
```

* Para onSubmit de um form, use FormEvent

```
import { useState, type FormEvent } from 'react';

export default function MyForm() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  
  function handleEmail(event: ChangeEvent<HTMLInputElement>) {
    setEmail(event.target.value);
  }
  
  function handlePassword(event: ChangeEvent<HTMLInputElement>) {
    setPassword(event.target.value);
  }
  
  function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    console.log(email, password);
  }
  
  return (
    <form onSubmit={handleSubmit}>
      <input value={email} placeholder="email" onChange={handleEmail}/>
      <input value={password} placeholder="password" onChange={handlePassword}/>
      <button type="submit"/>
    <form/>
  );
}
```

* Demais exemplos

Há mais alguns eventos que vocês podem olhar: FocusEvent, InvalidEvent, KeyboardEvent, MouseEvent, TouchEvent, TransitionEvent, ...

Por fim, se você precisar usar algum evento que não está incluído nessa lista, você pode usar o tipo SyntheticEvent, que é o tipo do qual é extendido todos os outros tipos de evento.

### Componentes (ReactNode, ReactElement, HTMLElement)

No @types/react, existem [diversos tipos](https://github.com/DefinitelyTyped/DefinitelyTyped/blob/master/types/react/index.d.ts#L163C1-L163C1) para componentes e marcação do nosso código jsx, o que pode acabar confundindo quem está vendo TypeScript pela primeira vez. Portanto, vamos nos focar nos tipos básicos, que podemos usar para a maioria das situações, como para passagem de componentes em props e para a tipagem de children's.

Tipando componentes:

* ReactNode

```
interface MyComponentProps {
  title: string;
  children: ReactNode;
}
```

Uma primeira possibilidade é usar o tipo ReactNode, o qual é uma união de todos os possíveis tipos que podem ser passados como children em um código JSX.

* ReactElement

```
interface MyComponentProps {
  title: string;
  children: ReactElement;
}
```

Uma segunda possibilidade, menos abrangente, é utilizar o ReactElement, o qual abrange apenas elementos JSX, excluindo tipos primitivos do JavaScript como string e number.

* HTMLElement

```
interface MyComponentProps {
  title: string;
  children: HTMLElement
}
```

Mais uma possibilidade, ainda menos abrangente, é utilizar o HTMLElement, o qual abrange apenas marcações do HTML, excluindo componentes React e tipos primitivos do JavaScript.

### Props de estilização

Quando usando estilização inline no React, você pode usar o tipo CSSProperties, para descrever um objeto passado para a prop style de um componente. Este tipo é uma união de todas as possíveis propriedades CSS, e é uma ótima maneira de garantir que você está passando propriedades CSS válidas.

```
interface MyComponentProps {
  style: React.CSSProperties;
}
```


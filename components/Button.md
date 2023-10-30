---
icon: square-fill
---

# Button

O componente Button é uma forma rápida de criar botões padronizados em suas aplicações React. A ideia é centralizar os estilos padrões de um botão no componente, mantendo as propriedades de um `<button />` comum.

## Adicionando Button a um novo projeto

Para adicionar o Button ao projeto, copie os seguintes arquivos para o seu projeto:

[Button/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/Button/index.tsx)


## Utilização

Uso padrão:

```js
import { Button } from "./index";

<Button onClick={() => alert("Olá mundo")}>Olá mundo</Button>;
```

## Personalização

Você pode personalizar a aparência do Button ajustando as classes CSS definidas no código. Adicione ou substitua classes de acordo com suas preferências de design

### Atributos do componente

Os atributos do componente 'Button', foram implementados em uma forma padrão : `bg-gray-300 border-none py-[0.5em] px-[1em] hover:shadow-lg focus-visible:shadow-lg focus-visible:outline focus-visible:outline-orange-600 focus-visible:outline-offset-1 cursor-pointer rounded-md`
Porém podem ser alterados com uma `className` durante a implementação do mesmo.

# Documentação: Componente de Form Factory em ReactJS

O componente Form Factory simplifica a criação de formulários com validação em suas aplicações React. Ele utiliza a biblioteca Zod para definir as regras de validação dos campos do formulário e oferece recursos para exibir mensagens de erro e manipular envios de formulários.

## Instalação

Antes de usar o componente FormFactory, certifique-se de que a biblioteca Zod esteja instalada em seu projeto. Você pode instalá-la com o comando: `pnpm install zod`

## Adicionando Form Factory a um novo projeto

Para adicionar o Form Factory ao projeto, copie os seguintes arquivos para o seu projeto:

[FormFactory/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/FormFactory/index.tsx)


## Utilização 

Para usar o componente de FormFactory em sua aplicação, siga os seguintes passos:

1 - Crie um objeto `Zod (ZodObject)` que irá gerenciar as validações para os campos do seu formulário. Você pode definir as regras de validação conforme necessário usando o Zod. Consulte a documentação do Zod para obter mais informações sobre as opções de validação disponíveis.

2 - Crie um objeto do tipo FormFactoryInfo que deve conter as seguintes informações:

- schema: O objeto Zod criado no passo 1.

- fields: Um objeto em que cada chave corresponde a um campo no seu esquema Zod e os valores são objetos com as seguintes propriedades:

    - label: O rótulo do campo.

    - defaultValue: O valor padrão do campo.

    - inputAtrr: Um objeto com os atributos da tag input e seus respectivos valores.
    
    - transform: Uma função que recebe o valor atual do input (sempre uma string) para converter no valor do schema (pode ser número, pode capitalizar a string, etc...)

- Chame a função FormFactory passando o objeto FormFactoryInfo como argumento para criar um componente de formulário.


## Atributos do componente Alert

- onValidSubmit: Uma função que será chamada quando o formulário for enviado com sucesso. Ela receberá os dados do formulário validados como argumento.

- onInvalidSubmit: Uma função que será chamada quando ocorrerem erros de validação no formulário. Ela receberá um objeto ZodError como argumento.

- buttonContent: O conteúdo do botão de envio do formulário. Por padrão, é "Enviar".

## Personalização

Você pode personalizar a aparência do Form ajustando as classes CSS definidas no código. Adicione ou substitua classes de acordo com suas preferências de design
## Exemplo:

```js

// definindo validação do form:
const loginSchema = z.object({
  email: z.string().email({ message: "Email inválido!" }),
  password: z
    .string()
    .min(6, { message: "Senha deve ter pelo menos 6 caracteres!" }),
});

// criando o componente de formulário:
export const LoginForm = FormFactory({
  schema: loginSchema,
  fields: {
    email: {
      label: "Email *",
      defaultValue: "",
      inputAtrr: { type: "email" },
    },
    password: {
      label: "Senha *",
      defaultValue: "",
      inputAtrr: { type: "password" },
    },
  },
});

// Então pode usar a tag <LoginForm /> em algum componente qualquer:
const LoginPage = () => {
    return <LoginForm
              onValidSubmit={(user) => {
                api
                  .get("/users/login", user)
                  // eslint-disable-next-line no-alert
                  .then(() => alert("logado com sucesso"))
                  // eslint-disable-next-line no-alert
                  .catch((er) => alert(er));
              }}
              onInvalidSubmit={() => {
                // opa
              }}
              buttonContent="Entrar"
    />
}

```
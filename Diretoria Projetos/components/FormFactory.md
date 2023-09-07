# Documentação: Componente de Form Factory em ReactJS

O componente Form Factory simplifica a criação de formulários com validação em suas aplicações React. Ele utiliza a biblioteca Zod para definir as regras de validação dos campos do formulário e oferece recursos para exibir mensagens de erro e manipular envios de formulários.

## Instalação

Antes de usar o componente FormFactory, certifique-se de que a biblioteca Zod esteja instalada em seu projeto. Você pode instalá-la com o comando: `npm install zod`

## Utilização 

Para usar o componente de FormFactory em sua aplicação, siga os seguintes passos:

1 - Crie um objeto `Zod (ZodObject)` que irá gerenciar as validações para os campos do seu formulário. Você pode definir as regras de validação conforme necessário usando o Zod. Consulte a documentação do Zod para obter mais informações sobre as opções de validação disponíveis.

2 - Crie um objeto do tipo FormFactoryInfo que deve conter as seguintes informações:

- schema: O objeto Zod criado no passo 1.

- fields: Um objeto em que cada chave corresponde a um campo no seu esquema Zod e os valores são objetos com as seguintes propriedades:

- label: O rótulo do campo.

- defaultValue: O valor padrão do campo.

- inputAtrr: Um objeto com os atributos da tag input e seus respectivos valores.

- Chame a função FormFactory passando o objeto FormFactoryInfo como argumento para criar um componente de formulário.


## Atributos do componente Alert

- onValidSubmit: Uma função que será chamada quando o formulário for enviado com sucesso. Ela receberá os dados do formulário validados como argumento.

- onInvalidSubmit: Uma função que será chamada quando ocorrerem erros de validação no formulário. Ela receberá um objeto ZodError como argumento.

- buttonContent: O conteúdo do botão de envio do formulário. Por padrão, é "Enviar".

## Personalização

Você pode personalizar a aparência do Form ajustando as classes CSS definidas no código. Adicione ou substitua classes de acordo com suas preferências de design
## Exemplo:

```js
// simulando api
  const api = useApiSimulator();

  // estado para definir qual sessão (register ou login) será exibida na página
  const [isRegistering, setIsRegistering] = useState(true);

  return (
    <div className="min-h-screen w-full flex flex-col items-center pt-10 bg-zinc-800 text-white">
      {isRegistering && (
        <section className="w-max flex flex-col">
          <h1 className="text-3xl px-4 py-2">Registre-se</h1>
          <div className="w-max">
            <RegisterForm
              onValidSubmit={(user) => {
                api
                  .post("/users/create", user)
                  // eslint-disable-next-line no-alert
                  .then(() => alert("registrado com sucesso"))
                  // eslint-disable-next-line no-alert
                  .catch((er) => alert(er));
              }}
              onInvalidSubmit={() => {
                // opa
              }}
              buttonContent="Registrar"
            />
          </div>
          <button
            className="text-emerald-500 underline ml-auto"
            type="button"
            onClick={() => setIsRegistering(false)}
          >
            Já tenho registro
          </button>
        </section>
      )}

      {!isRegistering && (
        <section className="w-max flex flex-col">
          <h1 className="text-3xl px-4 py-2">Entrar</h1>
          <div className="w-max">
            <LoginForm
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
          </div>
          <button
            className="text-emerald-500 underline ml-auto"
            type="button"
            onClick={() => setIsRegistering(true)}
          >
            Ainda não sou registrado
          </button>
        </section>
      )}
    </div>
);
```


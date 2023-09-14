# Documentação: Componente de Radio Input em ReactJS

O componente `Radio Input` é  um input personalizado que isola a aparência para estilização em React.

## Instalação

Para usar este componente, você precisa ter a biblioteca @radix-ui/react-radio-group instalada em seu projeto. Você pode instalá-la com o comando:
`pnpm install @radix-ui/react-radio-group`

## Adicionando Radio Input a um novo projeto

Para adicionar o Radio Input ao projeto, copie os seguintes arquivos para o seu projeto:

[RadioInput/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/RadioInput/index.tsx)


## Utilização 

Para usar o componente Radio Input em sua aplicação, siga os seguintes passos:

1 - Importe o componente `CustomRadio` e use ele onde você deseja exibir um input de rádio personalizado.

2 - Estilize o CustomRadio de acordo com suas preferências.

## Exemplo:

```js

const [formInfo, setFormInfo] = useState({
    paymentMethod: "",
    value: 0,
  });

  function handleChange(e: { target: { name: string; value: string } }) {
    // Reutilizar o mesmo handler para todos os inputs, basta colocar em cada um deles o atributo "name"
    const { name, value } = e.target;
    // Isso nem sempre pode ser feito

    if (Number.isNaN(Number(value))) {
      setFormInfo((prevInfo) => ({
        ...prevInfo,
        [name]: value,
      }));
    } else {
      setFormInfo((prevInfo) => ({
        ...prevInfo,
        [name]: Number(value),
      }));
    }
  }

  function handlePaymentMethodChange(value: string) {
    setFormInfo((prevInfo) => ({
      ...prevInfo,
      paymentMethod: value,
    }));
    console.log(value);
  }

  function handleSubmit(e: { preventDefault: () => void }) {
    // prevenir o reload da página no "submit" (comportamento padrão do form)
    e.preventDefault();

    // eslint-disable-next-line no-console
    console.log(formInfo);

    // sendInformationToBackend();
  }

  return (
    <form id="form" onSubmit={handleSubmit}>
      <h1>Faça o pagamento</h1>
      <legend>Escolha a forma de pagamento</legend>
      <RadioGroup.Root
        className="flex flex-col"
        value={formInfo.paymentMethod}
        onValueChange={handlePaymentMethodChange}
      >
        <label htmlFor="payment">No Cartão</label>
        <CustomRadio value="card" id="payment" />
        <label htmlFor="payment">No Pix</label>
        <CustomRadio value="pix" id="payment" />
      </RadioGroup.Root>
      <br />
      <fieldset>
        <legend>Qual o valor?</legend>
        <input
          type="number"
          name="value"
          id="valueInput"
          onChange={handleChange}
          value={formInfo.value}
          step={100}
          min={100}
        />
        <label htmlFor="valueInput">Em centavos de real</label>
      </fieldset>
      <br />
      <br />
      <button type="submit">Enviar form</button>
    </form>
  );

```

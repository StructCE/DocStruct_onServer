# Documentação: Componente de Modal em ReactJS

O componente de Modal é uma ferramenta que facilita a criação de modais personalizados em suas aplicações React. Ele fornece a estrutura básica para criar modais e permite que você os estilize de acordo com suas necessidades.

## Instalação

Para usar este componente, você precisa ter a biblioteca @radix-ui/react-dialog instalada em seu projeto. Você pode instalá-la com o comando:
`npm install @radix-ui/react-dialog`

## Adicionando Modal a um novo projeto

Para adicionar o Modal ao projeto, copie os seguintes arquivos para o seu projeto:
[Modal/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/Modal/index.tsx)
[Modal/styles.module.css](https://github.com/StructCE/our-react-components/blob/main/src/components/Modal/styles.module.css)

## Utilização 

Para usar o componente de Modal em sua aplicação, siga os seguintes passos:

1 - Importe os componentes `Modal.Content`, `Modal.Root`,`Modal.Trigger`, e `Modal.Close`

2 - Crie o conteúdo do modal dentro do componente `Modal.Content`

3 - Use os componentes `Modal.Trigger` e `Modal.Close` conforme necessário para abrir e fechar o modal.

## Personalização

Você pode personalizar a aparência do Modal ajustando as classes CSS definidas no código. Adicione ou substitua classes de acordo com suas preferências de design

## Exemplo:

```js

// simulando api

  const [cookiePermitted, setCookiePermitted] = useState(false);

  return (
    <>
      {cookiePermitted ? (
        "Está sendo personalizada"
      ) : (
        <Modal.Root>
          <Modal.Trigger>Personalize sua experiência</Modal.Trigger>
          <Modal.Content className="bg-zinc-700 flex flex-col p-6 gap-2">
            <span className="text-xl font-semibold text-neutral-300">
              Gostaria de deixar a gente fazer as{" "}
              <strong className="text-neutral-200 underline">
                melhores ofertas
              </strong>
              ?
            </span>
            <div className="flex justify-between">
              <Modal.Close className="bg-red-400 p-4 w-max mx-auto rounded-sm">
                Não quero
              </Modal.Close>
              <button
                className="bg-green-400 p-4 w-max mx-auto rounded-sm"
                onClick={() => setCookiePermitted(true)}
              >
                Aceito ter meus dados coletados neste site
              </button>
            </div>
          </Modal.Content>
        </Modal.Root>
      )}
    </>
  );
```


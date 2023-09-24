---
order: 1
icon: rocket
label: "Como usar Factory Bot ?"
author:
  name: Araújo
  avatar: ../../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Comandos
---

## Utilizando Factory Bot 

1. Definir as factories

- Crie arquivos para as factories em `spec/factories`, em que cada arquivo representará uma model. Por exemplo, se você tiver um modelo chamado User, crie um arquivo chamado `user.rb` em `spec/factories`.Nesse arquivo, coloque a estrutura apresentada a baixo, adaptando ao seu contexto e necessidades.

```bash
# spec/factories/<nome_da_model>.rb

FactoryBot.define do
  factory :<nome_da_model> do
    name {<nome_teste>}
    email {<email_teste>}
    password {<senha_teste>}
    # ...
  end
end

```

2. Utilizar as factories nos testes:

- Para utilizar as factories na criação de testes, basta seguir a estrutura a baixo, adequando os testes ao seu contexto e necessidades.

```bash
# spec/models/<nome_da_model>.rb

RSpec.describe <nome_da_model>, type: :model do
  it 'is valid with valid attributes' do
    <nome_da_model> = build(:<nome_da_model>)
    expect(<nome_da_model>).to be_valid
  end

  it 'is invalid without an email' do
    <nome_da_model> = build(:<nome_da_model>, email: nil)
    expect(<nome_da_model>).not_to be_valid
  end

  # ...
end
```

## Quer saber mais sobre Factory Bot?

--------------->[Documentação oficial do Factory Bot](https://github.com/thoughtbot/factory_bot_rails).<-------------------
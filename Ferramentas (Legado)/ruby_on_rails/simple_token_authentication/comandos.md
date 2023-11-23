---
order: 1
icon: rocket
label: "Como usar Simple Token Authentication ?"
author:
  name: Araújo
  avatar: ../../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Comandos
---

## Utilizando Simple Token Authentication

1. Defina qual model será necessario autenticação

- **É importante ressaltar que a model escolhida precisa ser criada com devise.**

```bash
# app/models/user.rb

class User < ActiveRecord::Base
  acts_as_token_authenticatable #linha adicionada
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable
  # ...
end
```

2. Adicionar campo **authentication_token** no bando de dados

```bash
rails generate migration add_authentication_token_to_users "authentication_token:string{30}:uniq"
```

3. Executar migração

```bash
rais db:migrate
```

4. Definir quais controladores manipularão a autenticação de token

```bash
# app/controllers/users_controller.rb

class Api::V1::AdministratorsController < ApplicationController
  acts_as_token_authentication_handler_for Administrator, only: [:logout, :create, :delete, :update] #linha adicionada
  #...
end
```

## Quer saber mais sobre Simple Token Authentication?

------------>[Documentação oficial Simple Token Authentication](https://github.com/gonzalo-bulnes/simple_token_authentication).<-------------------
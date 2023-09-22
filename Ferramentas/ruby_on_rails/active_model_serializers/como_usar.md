---
order: 1
icon: diamond
label: "Como usar Active Model Serializers ?"
---

<!-- Araújo -->

## Utilizando Active Model Serializers

1. Criar uma Serializer

- Para criar uma serializer no Rails, você pode usar o gerador de scaffolding, que gera automaticamente a estrutura básica para sua serializer. Por exemplo, para criar uma serializer "User", você poderia executar o seguinte comando:

```bash
rails generate serializer User
```

2. Filtrar os dados da requisição

```bash
# app/serializers/user_serializer.rb

class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :name, :email, :authentication_token
end
```

## Quer saber mais sobre Active Model Serializers?

------------>[Documentação oficial Active Model Serializers](https://github.com/rails-api/active_model_serializers).<-------------------







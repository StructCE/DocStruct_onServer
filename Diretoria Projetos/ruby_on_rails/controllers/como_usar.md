---
order: 1
icon: diamond
label: "Como usar uma Controller ?"
---

<!-- Araújo -->

## Utilizando uma Controller

1. Criar uma controller

- Para criar uma controller no Rails, você pode usar o gerador de scaffolding, que gera automaticamente a estrutura básica para sua controller Por exemplo, para criar uma controller "User", você poderia executar o seguinte comando:

```bash
rails generate controller api::v1::User
```

2. Definir ações na controller

```bash
# app/controllers/user_controller.rb

class UserController < ApplicationController
  def index
    members = Member.all
    render json: members, status: :ok
  end
end
```

3. Definir rota 

```bash
# config/routes.rb

namespace "api" do
    namespace "v1" do
        scope "user" do
            get "index", to: "user#index"
        end
    end
end
```

4. Rode o servidor localmente

```bash
rails server
```

5. Conferir se a controller e rota estão funcionando

- Abrir ThunderClient/Insomnia/Postman;
- Crie um nova request;
- Configure o metodo de requisição como GET;
- Faça uma requisição para a seguinte url:

```bash
localhost:3000/api/v1/user/index
```

- Se o resultado for todos os usuarios do banco de dados, a rota e controller estão funcionando.


## Quer saber mais sobre Controller?

--------------->[Documentação oficial Controller do Rails](https://guides.rubyonrails.org/action_controller_overview.html).<-------------------







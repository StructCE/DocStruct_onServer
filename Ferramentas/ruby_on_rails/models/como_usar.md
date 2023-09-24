---
order: 1
icon: rocket
label: "Como usar uma Model ?"
---

<!-- Ultima atualização: 24/09/2023 -->
<!-- Autor(es): Araújo -->

## Utilizando as Models

1. Criar uma model

- Para criar uma model no Rails, você pode usar o gerador de scaffolding, que gera automaticamente a estrutura básica para sua model. Por exemplo, para criar uma model "User", você poderia executar o seguinte comando:

```bash
rails generate model User name:string password:string email:string 
```

2. Executar migração

```bash
rails db:migrate
```

3. Verificando a tabela no banco de dados

```bash
rails c
User.create(name:'Teste', password:'Teste', email:'Teste')
User.all
# Vai retonar o usuario criado
```

## Quer saber mais sobre Model?

------------->[Documentação oficial de Models do Rails](https://guides.rubyonrails.org/active_model_basics.html).<-------------------







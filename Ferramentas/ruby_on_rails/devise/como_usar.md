---
order: 1
icon: rocket
label: "Como usar o Devise ?"
---

<!-- Ultima atualização: 24/09/2023 -->
<!-- Autor(es): Araújo -->

## Utilizando o Devise

1. Criar uma model com devise

- Para criar uma model com Devise no Rails, você pode usar o gerador de scaffolding, que gera automaticamente a estrutura básica para sua model. Por exemplo, para criar uma model "User", você poderia executar o seguinte comando:

```bash
rails generate devise User name:string age:integer birthday:string
```

- **É importante ressaltar que a model não tem um campo de senha, porem tem um campo encrypted_password, o qual garanti que não seja possível visualizar a senha dos usuários que forem cadastrados em nossa aplicação.Além disso, o campo email vem como padrão ao criar uma model com devise.**

2. Executar migração

```bash
rails db:migrate
```

3. Verificando a tabela no banco de dados

```bash
rails c
User.create(name:'Teste', password:'Teste', email:'Teste', age:99, birthday:'99/99/9999')
User.all
# Vai retonar o usuario criado, sem mostrar a senha.
```

## Quer saber mais sobre Devise?

--------------->[Documentação oficial do Devise](https://github.com/heartcombo/devise#starting-with-rails).<-------------------
---
order: 2
icon: rocket
label: "Como instalar o Devise ?"
---

<!-- Ultima atualização: 24/09/2023 -->
<!-- Autor(es): Araújo -->

1. Adicionar a gem no Gemfile:

```bash
# ./Gemfile
# acrescentar o seguinte trecho:

gem 'devise'
```

2. Instalar as dependências:

```bash
bundle install
```

3. Configurar o Devise:

```bash
rails generate devise:install
```
---
order: 2
icon: diamond
label: "Como instalar Simple Token Authentication ?"
---

<!-- Araújo -->

1. Adicionar a gem no Gemfile:

```bash
# ./Gemfile
# acrescentar o seguinte trecho:

gem 'simple_token_authentication'
```

2. Instalar as dependências:

```bash
bundle install
```

3. Configurar o Simple Token Authentication:

```bash
rails generate simple_token_authentication:install
```
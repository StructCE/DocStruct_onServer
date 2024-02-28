---
order: 2
icon: rocket
label: "Como instalar o Devise ?"
author:
  name: Araújo
  avatar: /imagens-stack-legado/logos/logo_struct.png
date: 2023-09-24
category: Instalação
---

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
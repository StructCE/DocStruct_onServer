---
order: 2
icon: rocket
label: "Como instalar Simple Token Authentication ?"
author:
  name: Araújo
  avatar: ../../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Instalação
---

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
---
order: 2
icon: rocket
label: "Como instalar Factory Bot ?"
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

group :development, :test do
  gem 'factory_bot_rails'
end
```

2. Instalar as dependências:

```bash
bundle install
```

3. Configurar o Factory Bot:

```bash
# ./spec/support/factory_bot.rb
# acrescentar o seguinte trecho:

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
```

```bash
# ./spec/rails_helper.rb
# descomentar a seguinte linha:

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
```
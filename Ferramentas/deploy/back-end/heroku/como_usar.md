---
order: 1
icon: rocket
label: "Como usar Heroku ?"
---

<!-- Ultima atualização: 22/09/2023 -->
<!-- Autor(es): Artur Padovesi e Pedro Augusto Ramalho Duarte -->

# Configurando o projeto para deploy

!!!
Esse deploy esta sendo feito com base em um projeto Rails
!!!

1. Crie uma branch chamada `heroku`, caso ainda não tenha, e faça as seguintes mudanças;
2. Crie um arquivo chamado `start.sh` na raíz do projeto com o seguinte conteúdo:

``` Terminal Shell
!/bin/sh
rails db:migrate
bundle exec puma -C config/puma.rb
```

- `#!/bin/sh`: essa linha tem, por principal objetivo, informar ao shell qual intérprete deverá ser usado para a execução do script. No nosso caso, o intérprete usado será o sh, ou seja o Bourne shell.

- `rails db:migrate`: a linha de código padrão para executar as migrations no rails e garantir que todos os bancos de dados estejam atualizados e com suas informações certas

- `bundle exec puma -C config/puma.rb`: esse código funciona como um rails s, ou seja, serve para executar o puma (servidor padrão do rails) com alguns recursos a mais que o rails s por si só, não oferece.

3. Caso seu projeto utilize Active Storage, ou guarda alguma imagem enviada por upload, é necessário mudar o path, no qual os arquivos ficam armazenados, escolhendo entre [cloudinary](https://cloudinary.com/documentation/ruby_rails_quickstart) e [amazon s3](https://devcenter.heroku.com/articles/active-storage-on-heroku). Execute o comando **Certo** para configurar os arquivos.

!!!
Não colocar as chaves de acesso no repositório, apenas no heroku. Na branch de produção, requisitar as variáveis de ambiente no heroku, e colocar no código com `ENV['NOME_DA_VARIAVEL']`.
!!!

```rb Errado
Cloudinary.config_from_url("cloudinary://API_KEY:API_SECRET@CLOUD_NAME")
```

```rb Certo
Cloudinary.config_from_url("cloudinary://#{ENV['CLOUDINARY_API_KEY']}:#{ENV['CLOUDINARY_API_SECRET']}@#{ENV['CLOUDINARY_CLOUD_NAME']")
```

4. Colocar as variáveis de ambiente no heroku

- Instalar a SDK do serviço escolhido;
- Executar o comando:

```rb Terminal
bundle
```

- `config/environments/production.rb`;
- `config/storage.yml`;
- `config/initializers/active_storage.rb`;
- Colocar as chaves de acesso do serviço escolhido no Heroku;

# Executando deploy do projeto

## CLI(Command Line Interface)

!!!
Tutorial para instalar o CLI do heroku https://devcenter.heroku.com/articles/heroku-cli#download-and-install
!!!

1. Logar no Heroku e criar uma nova aplicação;
2. Na pasta do repositório do projeto, executar o comando:

```bash Terminal
heroku git:remote -a {nome_da_aplicação}
```

3. Configure o banco de dados para PostgreSQL;
4. E por fim execute o comando: 

```bash Terminal
git push heroku {nome_da_aplicação}
```

## Dashboard

1. Acesse a dashboard da conta de projetos da Struct;
2. Crie uma nova aplicação;
3. Navegue até a aba Deploy e selecione a opção GitHub;
4. Selecione o repositório do projeto;
5. Selecione a branch `Heroku`;
6. Selecione a opção **Deploy Branch**. 
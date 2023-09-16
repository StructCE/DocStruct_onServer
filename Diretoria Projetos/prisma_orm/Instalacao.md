---
order: 2
icon: diamond
label: "Como instalar o Prisma ORM ?"
---

<!-- Araújo -->

## Iniciar um projeto TypeScript

### Criando pasta

```bash
mkdir teste 
```

### Acessando pasta

```bash
cd teste 
```

### Iniciar projeto

```bash
yarn init -y
```

### Adicionar typescript e pacotes complementares

```bash
yarn add -D typescript ts-node @types/node
```

### Criar arquivo `tsconfig.json`

```bash
yarn tsc --init
```

## Modificar o arquivo `tsconfig.json`

Dependendo do ambiente de execução JavaScript, pode existir um `tsconfig.json` pronto com uma configuração **BASE**, o qual pode ser encontrado em [pré-definidos](https://github.com/tsconfig/bases). Segue um exemplo, no qual é utilizado uma configuração recomendada.

### Instalação da configuração

```bash
yarn add --dev @tsconfig/recommended
```

### Adicionando a configuração no arquivo `tsconfig.json`

```bash
# teste/tsconfig.json

"extends": "@tsconfig/recommended/tsconfig.json",
```

### Configuração personalizada do `tsconfig.json`

[Documentação tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html)

## Configurar banco de dados PostgreSQL usando o Docker

**É importante ressaltar que nesse passo o Docker esta sendo utilizado como um 'simulador' 
de banco de dados PostgreSQL.**

### Criando arquivo `docker-compose.yml`

```bash
touch docker-compose.yml
```

### Adicionando a configuração no arquivo `docker-compose.yml`

```bash
# teste/docker-compose.yml

version: '3'
services:
  postgres:
    image: postgres:latest
    container_name: postgresql
    environment:
      POSTGRES_DB: teste
      POSTGRES_USER: teste
      POSTGRES_PASSWORD: teste
    ports:
      - "5432:5432"
    volumes:
      - ./dados_postgres:/var/lib/postgresql/data
```

### Inicie o Docker

```bash
sudo service docker start
```

### Inicie o container do banco de dados PostgreSQL

```bash
sudo docker-compose up -d
```

### Verifique se o banco de dados está sendo executado

```bash
sudo docker ps
```

## Configuração do Prisma.

### Instalando o Prisma

```bash
yarn add prisma --save-dev
```

### Criar arquivos `schema.prisma` e `.env`

```bash
yarn prisma init
```

`.env`: o arquivo para definir a URL de conexão do seu banco de dados.
`prisma/schema.prisma`: o arquivo de configuração principal para o seu projeto Prisma (incluirá o seu modelo de dados).

### Definir localização do seu banco de dados
 
- PATH = diretório raiz = teste
- POSTGRES_USER = usuario definido no `docker-compose.yml` = teste
- POSTGRES_PASSWORD = senha definida no `docker-compose.yml` = teste

```bash
#.env

DATABASE_URL="postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@localhost:5432/{PATH}?schema=public"
```

### Quer saber mais Prisma ORM ?

----------------->[Documentação oficial do Prisma](https://www.prisma.io/docs).<--------------------

---
order: 2
icon: rocket
label: "Como instalar o Yarn ?"
author:
  name: Araújo
  avatar: ../imagens-ferramentas-de-ambiente/logos/logo_struct.png
date: 2023-09-24
category: Instalação
---

# Como instalar o Yarn ?

## Com NPM

1. Instalar o Yarn com NPM

```bash
npm install --global yarn
```

2. Verificar se a instalação deu certo 

```bash
yarn --version
```

## Sem NPM

1. Instalar o Curl

```bash
sudo apt update
sudo apt install curl
```

2. Importar a chave GPG

```bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

3. Adicionar e habilitar o repositório oficial do Yarn

```bash
echo "deb https://dl.yarnpkg.com/debian/ stable main" |
sudo tee /etc/apt/sources.list.d/yarn.list
```

4. Atualizar o cache do sistema

```bash
 sudo apt update
```

5. Instale o Yarn com os pacotes do Node.js

```bash
sudo apt install yarn
```

6. Verifique se a instalação deu certo

```bash
yarn --version
```

### Quer saber mais sobre Yarn ?

---------------------->[Documentação oficial Yarn](https://classic.yarnpkg.com/lang/en/docs/)<-----------------------
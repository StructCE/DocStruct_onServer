---
order: 2
icon: rocket
label: "Como instalar o RVM ?"
author:
  name: Araújo
  avatar: ../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Instalação
---

## Comandos para instalação do RVM

### Instalar o Curl e dependecias necessarias

```bash
sudo apt update
sudo apt-get install curl libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
```

### Obter as chaves GPG necessárias para a instalação

```bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

### Instalar RVM

```bash
curl -sSL https://get.rvm.io | bash -s stable
source  ~/.rvm/scripts/rvm
```

### Verificar se a instalação foi bem sucedida

```bash
rvm -v
```

### Quer saber sobre mais sobre RVM ?

---------------------->[Documentação oficial RVM](https://rvm.io/)<-----------------------
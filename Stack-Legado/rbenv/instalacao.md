---
order: 2
icon: rocket
label: "Como instalar o RBenv ?"
author:
  name: Araújo
  avatar: /imagens-stack-legado/logos/logo_struct.png
date: 2023-09-24
category: Instalação
---

## Comandos para instalação do RBenv

1. Instalar o Curl

```bash
sudo apt update
sudo apt install curl
```

2. Obter o script de instalação do RBenv

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
```

3. Colocar o RBenv no PATH

```bash
echo  'export PATH="$HOME/.rbenv/bin:$PATH"'  >>  ~/.bashrc
echo  'eval "$(rbenv init -)"'  >>  ~/.bashrc
source  ~/.bashrc
```

5. Verificar se a instalação foi bem sucedida

```bash
rbenv -v
```

### Quer saber sobre mais sobre RBenv ?

---------------------->[Documentação oficial RBenv](https://github.com/rbenv/rbenv)<-----------------------
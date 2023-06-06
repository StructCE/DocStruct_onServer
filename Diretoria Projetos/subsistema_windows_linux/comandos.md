---
order: 1
icon: diamond
label: "Quais comandos posso usar ?"
---

<!-- Araújo -->

## Comandos basicos WSL

### Listar distribuições do Linux disponiveis para instalação
```bash
wsl --list --online
```
### Instalar uma distribuição do Linux
```bash
wsl --install -d <NomedaDistribuição>
```
### Listar distribuições do Linux instaladas
```bash
wsl -l
```
### Mudar versão padrão do WSL
```bash
wsl --set-default-version <versão>
```
###  Usar uma distribuição especifica
```bash
wsl -d <nomeDaDestribuição>
```
### Listar comandos disponiveis do WSL
```bash
wsl --help
```

### Quer saber mais comandos do WSL ?

---------------------->[Documentação oficial WSL](https://docs.microsoft.com/pt-br/windows/wsl/)<-----------------------
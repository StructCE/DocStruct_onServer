---
order: 2
icon: tools
label: "Instalação" 
---

# Instalação

O tRPC possui vários tipos de pacotes com conteúdos extras, porém iremos instalar o pacote padrão:

!!! Requisitos
- Deve-se certificar que a versão do TypeScript seja igual ou superior à versão 4.7.0.
- É recomendado a atribuição "strict": true no arquivo `tsconfig.json`, já que não há suporte para o contrário.
!!!

+++ npm
`
npm install @trpc/server @trpc/client
`
+++ yarn
`
yarn add @trpc/server @trpc/client
`
+++ pnpm
`
pnpm add @trpc/server @trpc/client
`
+++ bun
`
bun add @trpc/server @trpc/client
`
+++
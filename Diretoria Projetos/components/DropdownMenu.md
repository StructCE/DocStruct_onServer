# Documentação: Componente de Dropdown Menu em ReactJS

O componente de Menu Dropdown oferece uma maneira fácil de criar menus suspensos personalizados em suas aplicações React. Ele é altamente personalizável e fornece várias opções para criar menus de seleção, menus de contexto e muito mais.

## Instalação

Lembre-se de instalar a biblioteca '@radix-ui/react-alert-dialog' pelo comando : `npm install @radix-ui/react-alert-dialog`


## Adicionando Dropdown Menu a um novo projeto

Para adicionar o Dropdown Menu ao projeto, copie os seguintes arquivos para o seu projeto:

[DropdownMenu/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/DropdownMenu/index.tsx)

[DropdownMenu/example.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/DropdownMenu/example.tsx)


## Exemplo 

Uso padrão:

```js

<div className="flex justify-center">
      <DropdownMenu.Root>
        <DropdownMenu.Trigger asChild>
          <button className="border-2 border-gray-200 border-solid px-4 py-1 focus:outline-none rounded focus:ring-0 hover:bg-gray-100 transition duration-300 ease-in-out">
            Abrir
          </button>
        </DropdownMenu.Trigger>
        <DropdownMenu.Content className="w-56">
          <DropdownMenu.Label>Minha Conta</DropdownMenu.Label>
          <DropdownMenu.Separator />
          <DropdownMenu.Group>
            <DropdownMenu.Item>
              <User className="mr-2 h-4 w-4" />
              <span>Perfil</span>
            </DropdownMenu.Item>
            <DropdownMenu.Item>
              <ShoppingBag className="mr-2 h-4 w-4" />
              <span>Compras</span>
            </DropdownMenu.Item>
            <DropdownMenu.Item>
              <Heart className="mr-2 h-4 w-4" />
              <span>Meus Desejos</span>
            </DropdownMenu.Item>
          </DropdownMenu.Group>
          <DropdownMenu.Separator />
          <DropdownMenu.Group>
            <DropdownMenu.Item>
              <MapPinIcon className="mr-2 h-4 w-4" />
              <span>Endereço</span>
            </DropdownMenu.Item>
          </DropdownMenu.Group>
          <DropdownMenu.Separator />
          <DropdownMenu.Item>
            <LifeBuoy className="mr-2 h-4 w-4" />
            <span>Suporte</span>
          </DropdownMenu.Item>
          <DropdownMenu.Item>
            <Settings className="mr-2 h-4 w-4" />
            <span>Configurações</span>
          </DropdownMenu.Item>
          <DropdownMenu.Separator />
          <DropdownMenu.Item>
            <LogOut className="mr-2 h-4 w-4" />
            <span>Sair</span>
          </DropdownMenu.Item>
        </DropdownMenu.Content>
      </DropdownMenu.Root>
    </div>

```

## Observação

O Menu DropDown possúi uma implementação mais extensa que os outros components, mas o modo de uso é o mesmo:

- importar o componente.

- adicionar ou retirar algum item do menu alterando a estrutura das tags React iniciadas com `DropdownMenu`.

- Estilizar o Menu de acordo com suas preferências, alterando as marcações do Tailwind na `className`
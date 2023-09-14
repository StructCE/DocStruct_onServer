# Documentação: Componente de Table em ReactJS

O componente Table é projetado para renderizar uma tabela HTML com dados. Ele aceita uma série de props que permitem definir as colunas, as linhas e ações personalizadas a serem exibidas na tabela.

## Adicionando Table a um novo projeto

Para adicionar o Table ao projeto, copie os seguintes arquivos para o seu projeto:

[Table/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/Table/index.tsx)

[Table/styles.module.scss](https://github.com/StructCE/our-react-components/blob/main/src/components/Table/styles.module.scss)

[Table/styles.ts](https://github.com/StructCE/our-react-components/blob/main/src/components/Table/styles.ts)


## Utilização 

Para usar o componente de Table em sua aplicação, siga os seguintes passos:

1 - Importe o componente `Table`

2 - Defina os campos (colunas) que você deseja exibir na tabela. Isso é feito através da propriedade `fields`, que deve ser um array de objetos com as propriedades `title` (título da coluna) e `name` (correspondência com a propriedade dos objetos de dados).

3 - Crie um array de objetos representando as linhas de dados que você deseja exibir na tabela. Cada objeto deve ter propriedades correspondentes aos nomes definidos em `fields`.

4 - defina ações personalizadas que podem ser executadas em cada linha da tabela, através da propriedade `actions`, que deve ser um array de objetos com as propriedades `title` (título da ação), `onClick` (função a ser executada ao clicar na ação) e `Icon` ( representa o ícone da ação).

5 - personalize a aparência da tabela ajustando as classes CSS definidas no código. Adicione ou substitua classes de acordo com suas preferências de design.

## Exemplo:

```js
// Normalmente esse tipo viria do prisma, etc.
export type User = {
  id: number;
  user_name: string;
  age: number;
  status: "active" | "deactivated";
  role: "super_admin" | "admin" | "user";
};

// como não é dinâmico, pode ser colocado fora do componente:
const shownFields: GenericFields<User[]> = [
  // { title: "Id", name: "id" },
  { title: "Usuário", name: "user_name" },
  // { title: "Idade", name: "age" },
  // { title: "Status", name: "status" },
  { title: "Cargo", name: "role" },
];

const actions: GenericRowAction<User[]>[] = [
  {
    title: "Visualizar",
    Icon: ShowIcon,
    onClick: (row) =>
      // eslint-disable-next-line no-alert
      alert(
        `VISUALIZANDO OS DADOS DE ${row.user_name}\n\n ${JSON.stringify(
          row,
          null,
          2
        )}`
      ), // chamar api
  },
  {
    title: "Editar",
    Icon: EditIcon,
    // eslint-disable-next-line no-alert
    onClick: (row) =>
      alert(
        `EDITANDO OS DADOS DE ${row.user_name}\n\n ${JSON.stringify(
          row,
          null,
          2
        )}`
      ), // chamar api
  },
  {
    title: "Deletar",
    Icon: TrashIcon,
    // eslint-disable-next-line no-alert
    onClick: (row) =>
      alert(
        `DELETANDO OS DADOS DE ${row.user_name}\n\n ${JSON.stringify(
          row,
          null,
          2
        )}`
      ), // chamar api
  },
];

export function TableExample() {
  // api call, etc
  const users = getUsers();

  // pode paginar, filtrar, etc
  const shownUsers = users.filter((u) => u.status !== "deactivated");

  return (
    <PageContainer>
      <Table
        title="Usuários"
        fields={shownFields}
        actions={actions}
        rows={shownUsers}
        breakPointWidth={900}
      />
    </PageContainer>
  );
}

function getUsers() {
  const users: User[] = [
    { id: 1, user_name: "art", age: 20, status: "active", role: "admin" },
    {
      id: 2,
      user_name: "Tata Werneck",
      age: 3,
      status: "deactivated",
      role: "user",
    },
    {
      id: 3,
      user_name: "Caetas",
      age: 0,
      status: "active",
      role: "user",
    },
    {
      id: 4,
      user_name: "Nicolau",
      age: 23,
      status: "active",
      role: "super_admin",
    },
    {
      id: 5,
      user_name: "Renatinho sangue bom (demais)",
      age: 250,
      status: "active",
      role: "user",
    },
    {
      id: 6,
      user_name: "Tres21",
      age: 321,
      status: "deactivated",
      role: "admin",
    },
  ];

  return users;
}

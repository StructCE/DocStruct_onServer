---
icon: table
---

# Table

O componente Table é projetado para renderizar uma tabela HTML com dados. Ele aceita uma série de props que permitem definir as colunas, as linhas e ações personalizadas a serem exibidas na tabela.

## Adicionando Table a um novo projeto

Para adicionar o Table ao projeto, copie os seguintes arquivos para o seu projeto:

[Table/index.tsx](https://github.com/StructCE/our-react-components/blob/main/src/components/Table/index.tsx)

[Table/styles.module.scss](https://github.com/StructCE/our-react-components/blob/main/src/components/Table/styles.module.scss)

## Utilização

Para usar o componente de Table em sua aplicação, siga os seguintes passos:

1 - Importe o componente `Table`

2 - Defina os campos (colunas) que você deseja exibir na tabela. Isso é feito através da propriedade `fields`, que deve ser um array de objetos com as propriedades `title` (título da coluna) e `name` (correspondência com a propriedade dos objetos de dados).

3 - Crie um array de objetos representando as linhas de dados que você deseja exibir na tabela. Cada objeto deve ter propriedades correspondentes aos nomes definidos em `fields`.

4 - defina ações personalizadas que podem ser executadas em cada linha da tabela, através da propriedade `actions`, que deve ser um array de objetos com as propriedades `title` (título da ação), `onClick` (função a ser executada ao clicar na ação) e `Icon` ( representa o ícone da ação).

5 - personalize a aparência da tabela ajustando as classes CSS definidas no código. Adicione ou substitua classes de acordo com suas preferências de design.

## Exemplo:

```js
<PageContainer>
      <div>
        <form>
          <h2>Mostrar os seguintes campos:</h2>
          {mayShowFields.map(({ name, title }) => (
            <div>
              <input
                type="checkbox"
                name={name}
                value={name}
                checked={selectedFields[name]}
                onChange={(e) => {
                  setSelectedFields((prev) => ({
                    ...prev,
                    [name]: e.target.checked,
                  }));
                }}
                id={title}
                key={title}
              />
              <label htmlFor={title}>{title}</label>
            </div>
          ))}
        </form>
        <form>
          <h2>Mostrar os usuários:</h2>

          {["active", "deactivated"].map((statusName) => (
            <div>
              <input
                type="checkbox"
                name={statusName}
                value={statusName}
                checked={
                  filterUsersByActiveStatus[
                    statusName as "active" | "deactivated"
                  ]
                }
                onChange={(e) => {
                  setFilterUsersByActiveStatus((prev) => ({
                    ...prev,
                    [statusName]: e.target.checked,
                  }));
                }}
                id={statusName}
                key={statusName}
              />
              <label htmlFor={statusName}>{statusName}</label>
            </div>
          ))}
        </form>
      </div>
      <Table
        title="Usuários"
        fields={shownFields}
        actions={actions}
        rows={shownUsers}
        breakPointWidth={(actions.length + shownFields.length) * 190 || 900}
      />
    </PageContainer>


```

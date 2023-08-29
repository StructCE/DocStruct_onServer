# Bem-Vindo à Wiki da {struct}

Este é um espaço no Retype com o objetivo de concentrar todo o conhecimento possível da Struct em um só lugar.

## Conteúdo

Neste espaço deve-se concentrar todos os conhecimentos de gestão e execução de projetos assim como gestão da Struct em si. Por favor, contribua toda vez que verificar que algo está faltando. Caso tenha dúvidas de como trabalhar aqui, acesse a documentação do [Retype](https://retype.com).

### Como Contribuir

#### Git e GitHub

Para realizar modificações nas páginas do Retype, é necessário ter um conhecimento básico em alguns conceitos de git, como: add, commit, pull, clone, push e branch. Caso não possua domínio sobre esses conceitos ou deseje revisar algum, a Struct possui um material apresentando uma explicação sucinta [dos principais comandos](https://drive.google.com/file/d/1tH0LaDnD14pHnqq4cymkAjvYX5wkVrCs/view?usp=sharing). Caso queira obter informações mais detalhadas, pode-se consultar o livro *[Pro Git](https://git-scm.com/book/en/v2)* gratuitamente.

##### Observações importantes:

- Use, preferencialmente, a branch de desenvolvimento da sua diretoria para fazer mudanças;
- **Jamais** faça mudanças diretamente na master \(boatos de que quem o fez não está mais na Struct para contar a história\);
- Antes de abrir um pull request, verifique o funcionamento da branch no ambiente de deploy;
- Quando abrir um pull request, peça para alguém da diretoria de Adm-Fin revisar.

#### Repositório do Retype

Para começar a trabalhar no Retype, clone o [repositório no GitHub](https://github.com/StructCE/DocStruct/), acesse a branch da sua diretoria e começe a fazer as modificações nela. É recomendado avisar os outros membros da sua diretoria, para que não haja duas pessoas trabalhando na mesma branch ao mesmo tempo.

#### Padrões Utilizados no Retype

##### Arquivos Markdown

Markdown é uma ferramenta que converte texto para HTML, sendo possível marcar títulos, listas, tabelas, etc., de forma muito mais limpa e legível do que o HTML padrão. Caso deseje aprender como escrever em arquivos markdown, seria interessante dar uma olhada em sua [sintaxe básica](guia-markdown.md).

##### Funcionamento

O Retype usa arquivos de formato markdown, como componentes, para a estruturação da documentação online, os exibindo na forma de páginas web. O roteamento dos componentes é feita de forma automática pelo Retype e de acordo com os diretórios do projeto. O diretório raiz do projeto pode conter um arquivo .yml que cuida da configuração do site, como a navbar, footer etc. Assim como, cada componente do projeto também pode conter um arquivo .yml para a configuração separada do componente e um arquivo .md para a própria estruturação em markdown. 

###### arquivo.yml

Em um arquivo *.yml*, com nome padrão de index.yml, é feita a personalização e configuração do site ou de um componente específico. Para a configuração do site, pode ser necessário a consulta das ferramentas providas pelo [Retype](https://retype.com/configuration/project/#project-configuration). Já para a configuração de um componente específico há outras [ferramentas](https://retype.com/configuration/project/#project-configuration) disponíveis.

###### arquivo.md

Em um arquivo *.md* é feita a estruturação em markdown do site ou componente, sem ele nada deve aparecer no site ou no componente. O Retype provê muitas [ferramentas](https://retype.com/components/) para estruturar o conteúdo da documentação.

###### welcome.md

O arquivo *welcome.md* é o responsável, por padrão, pela estruturação da página inicial (homepage), à qual quem estiver usando o DocStruct será redirecionado primeiramente.
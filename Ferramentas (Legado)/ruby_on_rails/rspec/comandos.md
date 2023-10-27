---
order: 1
icon: rocket
label: "Como usar RSpec ?"
author:
  name: Araújo
  avatar: ../../../Imagens DocStruct/Logos/logo_struct.png
date: 2023-09-24
category: Comandos
---

## Utilizando Rspec 

1. Escrevendo testes

Os testes com RSpec são escritos em arquivos com extensão .rb na pasta spec. Existem três tipos principais de blocos de teste:

- Describe: É usado para descrever o que está sendo testado. Pode ser uma classe, método ou um conjunto de comportamentos relacionados.
- Context: É usado para definir o contexto do teste. Pode ajudar a agrupar os testes com base em diferentes cenários ou estados.
- It: Contém o teste real. Descreve o comportamento esperado do código.
- Expect: definir o objeto (valor) que você deseja testar. Ele aceita como argumento a expressão ou o resultado que você quer avaliar. Normalmente, essa expressão é a que retorna o resultado do código que está sendo testado.
- To: Indicar a expectativa do que a expressão definida no expect deve ser igual. A palavra-chave to é seguida de um "matcher" (correspondente), que é usado para verificar se o valor esperado é igual ao valor real.
- Eq: É um dos "matchers" do RSpec. Ele verifica se o valor à esquerda do eq é igual ao valor à direita. Se a expressão avaliada no expect for igual ao valor definido após o eq, o teste passa; caso contrário, o teste falhará.

Segue a baixo uma estrutura basica de teste:

```bash
# spec/model/<nome_da_model>.rb

RSpec.describe <nome_da_model> do
  describe "<descrição_do_teste>" do
    context "<contexto_do_teste>" do
      it "<comportamento_esperado>" do
        resultado = (1+1)
        expect(result).to eq(2)
      end
    end
  end

  # ...
end
```

2. Executando testes

```bash
rspec
```

## Quer saber mais sobre RSpec?

--------------->[Documentação oficial do RSpec](https://rspec.info/documentation/).<-------------------
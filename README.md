# AgendaPlus

AgendaPlus é um projeto de criação de contatos e busca, com o cadastro de contatos é possível incluir uma lista de telefones e enedereços.

## Stack do projeto

- Ruby 3.2.0
- Rails 7.0.4
- Postgres 15.1
- ElasticSearch 7.15.1
- Boostrap 5

## Requirements

- Docker
- Docker Compose

## Instalação

1. Clone the repository: `git clone git@github.com:caiohenrique12/agendaplus.git`
2. Após o download, entre na pasta do projeto: `cd agendaplus`
3. Para fazer build do projeto: `docker-compose build`
4. Após o build, execute o comando a seguir para criação do banco e rodar as migrações: `docker-compose run web rails db:create db:migrate`
5. Para popular a base de dados pode rodar o seed (opicional): Primeiro suba a aplicação `docker-compose up` e em seguida `docker-compose run web bash` e por fim `rails db:seed`.
6. E por fim para inciar a aplicação execute: `docker-compose up`

## Aplicação

Se tudo ocorrer bem, insira essa url no seu navegador para entrar na aplicação: `localhost:3000`

## Testes

Para executar os testes, vai ser necessário o seguinte comando: `docker-compose run web rspec` ou se preferir execute: `docker-compose run web bash` e depois `rspec`

As seguintes gemas foram utilizadas para compor a stack de testes:

- rspec-rails
- database-cleaner
- simplecov

## Possíveis melhorias no futuro

- Podemos aproveitar a versão atual do rails 7 e o combo (turbo + stimulus + hotwire) para criar uma pesquisa na tela de contatos para ser reativa.
- Podemos utilizar as features da gem searchkick para nos dar ideias do que fazer com os resultados pesquisados, podemos definir um rancking dessas palavras e mostrar como sugestão no momento da pesquisa (isso como exemplo).
- Podemos incluir outros campos para pesquisa, assim como adicionando respectivos indexes para facilitar o retorno da pesquisa de maneira mais performática.
- Melhorar o uso do elasticsearch nas pesquisa, o mesmo da forma como foi configurado está bem limitado.
- No futuro, quando vários usuários estiverem acessando e a tabela de contatos (e relacionadas) estiverem grandes demais, vai se tornar um gargalo, poderiamos separar o carregamento das informaçõs e usando uma estratégia de compenetização (https://viewcomponent.org/#why-use-viewcomponents), no caso isso poderia substituir a junção com alguma framework js.
- Mantive o jbuilder para contatos, mas não mantive para addresses, talvez, em uma possível utilização de API poderiamos incluir.

## Possíveis bugs

- Caso a pagina de Contact#index quebre por conta do searchkick, talvez seja necessário rodar `Contact.reindex` no console do rails, `docker-compose run web rails c`.
- Por algum motivo elasticsearch buga após executar criação do banco e rodar as migrações, por esse motivo o seed roda separadamente.
# market-api
# Backend em Rails

Este é o projeto do backend em Rails para a aplicação de uma mercado. Ele fornece a API e gerencia os dados do sistema.

## Requisitos

- Ruby 3.0.1
- Rails 7.0.5
- Banco de Dados SQLite

## Configuração

1. Clone o repositório.
2. Instale as dependências usando o comando `bundle install`.
3. Configure o banco de dados no arquivo `config/database.yml`.
4. Execute as migrações do banco de dados com o comando `rails db:migrate`.
5. Inicie o servidor com o comando `rails server`.

## Endpoints da API

A API possui os seguintes endpoints principais:

- `/clients`: Gerencia os clientes do sistema.
- `/products`: Gerencia os produtos disponíveis.
- `/purchases`: Gerencia as compras realizadas.

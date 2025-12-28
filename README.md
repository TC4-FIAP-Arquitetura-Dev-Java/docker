🚀 Tech Challenge FIAP – Ambiente de Desenvolvimento e Produção

Este repositório utiliza **Docker** para orquestrar a arquitetura completa dos microsserviços:

- **ms-login**
- **ms-usuario**
- **ms-feedback**

A infraestrutura conta com ambientes **separados para Desenvolvimento e Produção**, permitindo execução local ou deploy em servidores com facilidade e padronização.

-------------------------------------------------------------------------------
📦 Funcionalidades Principais

- Ambientes independentes: **dev** e **prod**
- Containers para microserviços + bancos **MongoDB**
- Configuração via arquivos **.env**
- Volumes para persistência de dados
- Deploy simplificado com **Docker Compose**
- Build automático no ambiente de desenvolvimento

-------------------------------------------------------------------------------
✅ Pré-requisitos

- **Docker + Docker Compose** – execução dos containers
- **Java 21+** – necessário para rodar os microsserviços
- **Git** – para clonar o projeto
- **Postman / Insomnia (opcional)** – testes de API
- **Compass / DBeaver (opcional)** – visualização do MongoDB

-------------------------------------------------------------------------------
📂 Estrutura recomendada do projeto

```
/seu-diretorio/
├─ ms-login/
├─ ms-usuario/
├─ ms-feedback/
├─ docker-compose.dev.yml      ← Ambiente Dev
├─ docker-compose.prod.yml     ← Ambiente Prod
├─ .env.dev                    ← Variáveis Dev
└─ .env.prod                   ← Variáveis Prod
```

-------------------------------------------------------------------------------
▶ Como executar o ambiente

🔧 **Ambiente de Desenvolvimento** (com rebuild automático)
```
docker compose --env-file .env.dev -f docker-compose.dev.yml up -d --build
```

Ver logs:
```
docker compose -f docker-compose.dev.yml logs -f
```

🚀 **Ambiente de Produção**
```
docker compose --env-file .env.prod -f docker-compose.prod.yml up -d
```

Parar ambiente Prod:
```
docker compose --env-file .env.prod -f docker-compose.prod.yml down
```

-------------------------------------------------------------------------------
🔍 Observações Importantes

- No **dev** utilize `--build` para reconstruir imagens ao alterar código
- Em **produção**, recomenda-se build manual:

```
docker build -t ms-usuario ./ms-usuario
docker build -t ms-feedback ./ms-feedback
docker build -t ms-login ./ms-login
```

- Atualize credenciais no **.env.prod**
- Volumes garantem persistência dos dados do MongoDB

-------------------------------------------------------------------------------
🧪 Testes de API

Acessos locais:

- http://localhost:9083 → **ms-usuario**
- http://localhost:9084 → **ms-feedback**
- http://localhost:9082 → **ms-login**

Use Postman/Insomnia para executar requisições.


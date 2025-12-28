
🚀 Ambiente de Desenvolvimento e Produção - Tech Challenge FIAP

Este projeto utiliza Docker para subir e gerenciar toda a arquitetura dos microsserviços:

- ms-login
- ms-usuario
- ms-feedback

Agora o ambiente conta com diferentes configurações para desenvolvimento e produção, permitindo execução local ou deploy em servidor.

-------------------------------------------------------------------------------
📦 O que é configurado?

- Ambientes separados dev e prod
- Containers dos microserviços + bancos MongoDB
- Arquivos .env para controle de variáveis sensíveis
- Volumes para persistência dos bancos
- Subida automática dos serviços via Docker Compose

-------------------------------------------------------------------------------
✅ Pré-requisitos

Docker + Docker Compose - Executar microsserviços e bancos em containers
Java 21+ - Necessário para rodar os microserviços
Git - Clonar os repositórios do projeto
Postman/Insomnia (opcional) - Testes dos endpoints
DBeaver/Compass (opcional) - Visualizar os bancos MongoDB

-------------------------------------------------------------------------------
📂 Estrutura esperada do projeto

/seu-diretorio/
├─ ms-login/
├─ ms-usuario/
├─ ms-feedback/
├─ docker-compose.dev.yml      (Ambiente Dev)
├─ docker-compose.prod.yml     (Ambiente Prod)
├─ .env.dev                    (Dev)
└─ .env.prod                   (Prod)

-------------------------------------------------------------------------------
▶ Como rodar o projeto

🔧 Ambiente de Desenvolvimento
docker compose --env-file .env.dev -f docker-compose.dev.yml up -d --build

Logs:
docker compose -f docker-compose.dev.yml logs -f

🚀 Ambiente de Produção
docker compose --env-file .env.prod -f docker-compose.prod.yml up -d

Parar:
docker compose --env-file .env.prod -f docker-compose.prod.yml down

-------------------------------------------------------------------------------
🔍 Observações importantes

- Dev recompila com --build
- Em prod recomenda-se gerar imagens manualmente:
  docker build -t ms-usuario ./ms-usuario
  docker build -t ms-feedback ./ms-feedback
  docker build -t ms-login ./ms-login

- Atualize credenciais no .env.prod
- Volumes mantêm os dados do banco

-------------------------------------------------------------------------------
🧪 Testando a API

http://localhost:9083  → ms-usuario
http://localhost:9084  → ms-feedback
http://localhost:9082  → ms-login

Use Postman/Insomnia para testar endpoints.

-------------------------------------------------------------------------------
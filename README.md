# 🚀 Tech Challenge FIAP – Microsserviços com Docker

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=openjdk)
![Docker](https://img.shields.io/badge/Docker-24.0-blue?style=for-the-badge&logo=docker)
![MongoDB](https://img.shields.io/badge/MongoDB-6.0-green?style=for-the-badge&logo=mongodb)
![Spring](https://img.shields.io/badge/Spring_Boot-3.x-brightgreen?style=for-the-badge&logo=springboot)

Este repositório contém a arquitetura completa de microsserviços do **Tech Challenge FIAP**. Utilizamos Docker e Docker Compose para orquestrar os serviços e garantir que o ambiente de desenvolvimento e produção seja idêntico e fácil de subir.

---

## 📌 Microsserviços Incluídos

O ecossistema é composto por três serviços principais:
1.  **ms-login**: Responsável pela autenticação e segurança.
2.  **ms-usuario**: Gestão de perfis e dados de usuários.
3.  **ms-feedback**: Coleta e análise de feedbacks.

---

## 📦 Funcionalidades do Ambiente

* **Orquestração Centralizada**: Controle total via `docker-compose.yml`.
* **Persistência de Dados**: Bancos de dados MongoDB individuais com volumes configurados.
* **Documentação Integrada**: Cada API possui sua própria interface Swagger UI.
* **Testes Facilitados**: Coleção do Postman inclusa para validação imediata.

---

## 🔧 Requisitos Mínimos

| Ferramenta | Finalidade | Versão Sugerida |
| :--- | :--- | :--- |
| **Docker + Compose** | Subir o ambiente completo | 24.0+ / 2.20+ |
| **Java JDK** | Desenvolvimento/Execução via IDE | 21 |
| **Git** | Clonagem do repositório | - |
| **Postman / Insomnia** | Testar os endpoints das APIs | - |
| **MongoDB Compass** | Visualizar dados nos bancos | (Opcional) |

---

## 📂 Estrutura do Projeto

```text
/
├── ms-login/           # Código fonte do serviço de login
├── ms-usuario/         # Código fonte do serviço de usuários
├── ms-feedback/        # Código fonte do serviço de feedback
├── collections/        # JSON para importação no Postman
└── docker-compose.yml  # Arquivo de orquestração global
```

## ▶️ Como Executar o Projeto

### ⚙️ Uso dos Scripts Automáticos

Este repositório inclui scripts para facilitar o uso do ambiente.

#### 🐧 Linux / MacOS
```
chmod +x setup.sh
./setup.sh
```

#### 🪟 Windows

```
setup.bat
```

Esses scripts realizam o download de todos os repositorios e inicializam a construção dos containers para uso da aplicação

## ▶️ Subir aplicação manualmente
### Certifique-se de estar no diretório raiz do projeto antes de executar os comandos abaixo e ter os repositorios em diretorio raiz.
1. Subir todo o ambiente (Background)
```
docker compose up -d
```
2. Monitorar logs dos serviços
```
docker compose logs -f
```
3. Parar a execução
```
docker compose down
```
4. Reset total (Limpeza profunda)
####    ⚠️ Atenção: Isso apagará todos os containers, imagens e volumes de dados.
```
docker compose down --rmi all --volumes
```

## 🔗 Endpoints Swagger UI (Documentação)

Após subir os containers, acesse as documentações nos links abaixo:

| Serviço | URL de Acesso |
| :--- | :--- |
| **ms-login** | [http://localhost:9082/swagger-ui/index.html](http://localhost:9082/swagger-ui/index.html) |
| **ms-usuario** | [http://localhost:9083/swagger-ui/index.html](http://localhost:9083/swagger-ui/index.html) |
| **ms-feedback** | [http://localhost:9084/swagger-ui/index.html](http://localhost:9084/swagger-ui/index.html) |

---

## 🗄️ Conexão com Bancos de Dados (MongoDB)

| Banco | String de Conexão |
| :--- | :--- |
| **Usuários** | `mongodb://usuarios:admin@localhost:27018/usuarios?authSource=admin` |
| **Feedback** | `mongodb://feedback:admin@localhost:27019/feedback?authSource=admin` |

---

## 🧪 Testes de API
Importe o arquivo de coleção localizado em:

```
./collections/TechChallenge.postman_collection.json
```

Este arquivo contém cenários de teste pré-configurados para todos os fluxos dos microsserviços.
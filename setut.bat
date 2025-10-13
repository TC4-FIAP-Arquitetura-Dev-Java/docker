@echo off
setlocal enabledelayedexpansion

:: Parar se ocorrer qualquer erro
set "ERRORLEVEL_CHECK=0"

:: Detectar se docker-compose existe (com ou sem hífen)
where docker-compose >nul 2>nul
if %ERRORLEVEL%==0 (
    set "DOCKER_COMPOSE_COMMAND=docker-compose"
) else (
    docker compose version >nul 2>nul
    if %ERRORLEVEL%==0 (
        set "DOCKER_COMPOSE_COMMAND=docker compose"
    ) else (
        echo Erro: docker-compose não encontrado.
        exit /b 1
    )
)

:: URLs dos repositórios
set "REPO_USUARIO=https://github.com/TC4-FIAP-Arquitetura-Dev-Java/ms-usuario"

:: Clonar se os diretórios não existirem
if not exist "ms-usuario" (
    git clone %REPO_USUARIO%
)

:: URL do docker-compose.yaml
set "GIST_RAW_URL=https://github.com/TC4-FIAP-Arquitetura-Dev-Java/docker/blob/5aaf1763ff5eb92d83791308aed4776f88b1d195/docker-compose.yml"

:: Verifica se curl está disponível
where curl >nul 2>nul
if %ERRORLEVEL%==0 (
    curl -fsSL %GIST_RAW_URL% -o docker-compose.yaml
) else (
    echo Erro: curl não está instalado.
    exit /b 1
)

:: Subir containers
%DOCKER_COMPOSE_COMMAND% up -d
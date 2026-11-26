@echo off
chcp 65001 >nul
title Ordem Paranormal - Servidor Local

echo.
echo ============================================================
echo  ORDEM PARANORMAL: BADALADAS DOS SINOS - Servidor Local
echo ============================================================
echo.
echo Iniciando servidor HTTP na pasta do projeto...
echo.
echo Acesse no navegador: http://localhost:8000
echo.
echo Pressione CTRL+C para parar o servidor.
echo ============================================================
echo.

REM Verifica se Python está instalado
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Python encontrado. Iniciando com: python -m http.server 8000
    echo.
    python -m http.server 8000
    goto :eof
)

REM Verifica se Node.js/npx está instalado
npx --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Node.js/npx encontrado. Iniciando com: npx serve
    echo.
    npx serve .
    goto :eof
)

echo [ERRO] Nenhum servidor HTTP encontrado.
echo.
echo Instale uma das opções:
echo  1. Python: https://python.org/downloads (marque "Add to PATH")
echo  2. Node.js: https://nodejs.org/download
echo.
echo Ou use a extensão "Live Server" no VS Code:
echo  - Botão direito no index.html > "Open with Live Server"
echo.
pause
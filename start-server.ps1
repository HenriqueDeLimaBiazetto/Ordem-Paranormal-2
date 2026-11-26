<#
.SYNOPSIS
    Inicia um servidor HTTP local para o projeto Ordem Paranormal VTT
.DESCRIPTION
    Tenta usar Python, Node.js (npx serve) ou sugere Live Server do VS Code
#>

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "  ORDEM PARANORMAL: BADALADAS DOS SINOS - Servidor Local" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Iniciando servidor HTTP na pasta do projeto..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Acesse no navegador: http://localhost:8000" -ForegroundColor Green
Write-Host ""
Write-Host "Pressione CTRL+C para parar o servidor." -ForegroundColor Gray
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Tenta Python
$python = Get-Command python -ErrorAction SilentlyContinue
if ($python) {
    Write-Host "[OK] Python encontrado: $($python.Source)" -ForegroundColor Green
    Write-Host "Iniciando: python -m http.server 8000" -ForegroundColor Yellow
    Write-Host ""
    python -m http.server 8000
    exit
}

# Tenta Python3
$python3 = Get-Command python3 -ErrorAction SilentlyContinue
if ($python3) {
    Write-Host "[OK] Python3 encontrado: $($python3.Source)" -ForegroundColor Green
    Write-Host "Iniciando: python3 -m http.server 8000" -ForegroundColor Yellow
    Write-Host ""
    python3 -m http.server 8000
    exit
}

# Tenta Node.js/npx
$npx = Get-Command npx -ErrorAction SilentlyContinue
if ($npx) {
    Write-Host "[OK] npx encontrado: $($npx.Source)" -ForegroundColor Green
    Write-Host "Iniciando: npx serve ." -ForegroundColor Yellow
    Write-Host ""
    npx serve .
    exit
}

# Tenta http-server (npm global)
$httpServer = Get-Command http-server -ErrorAction SilentlyContinue
if ($httpServer) {
    Write-Host "[OK] http-server encontrado: $($httpServer.Source)" -ForegroundColor Green
    Write-Host "Iniciando: http-server . -p 8000" -ForegroundColor Yellow
    Write-Host ""
    http-server . -p 8000
    exit
}

Write-Host "[ERRO] Nenhum servidor HTTP encontrado." -ForegroundColor Red
Write-Host ""
Write-Host "Instale uma das opções:" -ForegroundColor Yellow
Write-Host "  1. Python: https://python.org/downloads (marque 'Add to PATH')" -ForegroundColor White
Write-Host "  2. Node.js: https://nodejs.org/download" -ForegroundColor White
Write-Host ""
Write-Host "Ou use a extensão 'Live Server' no VS Code:" -ForegroundColor Cyan
Write-Host "  - Botão direito no index.html > 'Open with Live Server'" -ForegroundColor White
Write-Host ""
Write-Host "Pressione qualquer tecla para sair..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
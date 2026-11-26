# Ordem Paranormal: Badaladas dos Sinos — Mesa Virtual (VTT)

Um Virtual Tabletop (VTT) completo para a campanha **Ordem Paranormal: Badaladas dos Sinos**, com suporte a mapas, tokens, fichas de personagens (28 perícias oficiais), pistas, áudio, neblina de guerra e multiplayer em tempo real via Firebase.

## 🚀 Como Rodar Localmente

**IMPORTANTE:** Por segurança (CORS), navegadores bloqueiam o carregamento de arquivos locais (`file://`). Você **precisa** rodar um servidor HTTP local para ver as imagens da pasta `media/`.

### Opção 1: Script Automático (Windows)
Clique duas vezes em:
- `start-server.bat` (CMD)
- `start-server.ps1` (PowerShell — clique com botão direito → "Executar com PowerShell")

### Opção 2: Python (Recomendado)
```bash
# Na pasta do projeto
python -m http.server 8000
# Abra http://localhost:8000
```

### Opção 3: Node.js / npx
```bash
npx serve .
# Ou se tiver http-server instalado globalmente:
http-server . -p 8000
```

### Opção 4: VS Code - Live Server
1. Instale a extensão **"Live Server"**
2. Botão direito no `index.html` → **"Open with Live Server"**

---

## 🎮 Funcionalidades Principais

### 👑 Modo Mestre (GM)
- **Senha padrão:** `sino123`
- Acesso via botão "Mestre" na barra superior
- Painel lateral com abas: Mapas, Tokens, Fichas, Pistas, Áudio, **Media Viewer**

### 🗺️ Mapas & Neblina de Guerra
- Adicione mapas via upload ou URL
- Desenhe áreas ocultas (neblina de guerra) clicando e arrastando no mapa
- Grade configurável com snap-to-grid
- Controles de câmera (pan/zoom) com teclas de seta e scroll

### 🎭 Tokens
- Biblioteca de tokens com suporte a **variantes/estados** (ex: Ferido, Transformado)
- Corpo inteiro ou circular, espelhamento horizontal, rotação
- Arrastar e soltar no mapa com snap à grade
- Barra de ações flutuante para token selecionado

### 📋 Fichas de Personagem (28 Perícias Oficiais)
- Atributos: AGI, FOR, INT, PRE, VIG
- PV, PE, SAN com botões +/- 
- Todas as 28 perícias de Ordem Paranormal (Destreinado/Treinado/Veterano/Expert)
- Inventário, Rituais, Anotações
- Mestre pode ver/editar fichas dos jogadores conectados

### 🔍 Pistas & Galeria do Jogador
- Crie pistas com texto, segredo do mestre e imagem
- Revelar para jogadores → aparece overlay "Pegar ou Deixar"
- Galeria pessoal do jogador (abas: Coletadas / Reveladas na Cena)
- Importação do Miro (colar textos ou API v2)

### 🎵 Áudio
- Player com playlist, loop, volume, anterior/próximo
- Suporte a MP3, WAV, OGG, MP4
- Controles na barra superior (GM) e painel lateral

### 🌐 Multiplayer (Firebase)
- Sala padrão: `BADALADAS-AO-VIVO`
- Sincronização em tempo real: mapa, tokens, neblina, pistas, áudio, fichas
- Código de sala compartilhável

### 💾 Salvamento & Backup
- **IndexedDB** local automático
- **Firestore** (Firebase) para nuvem
- Exportar/Importar arquivo `.json` completo da campanha

---

## 📁 Pasta `media/` — Organização Automática

A pasta `media/` contém todas as imagens/áudios da campanha. O sistema classifica automaticamente:

| Padrão no nome/descrição | Vai para |
|--------------------------|----------|
| `cenas` ou `cena` | **Mapas** |
| `tokens` ou `token` | **Tokens** |
| `.mp4`, `.mp3`, `.wav`, `.ogg` | **Áudio** |
| Qualquer outro | **Pistas** |

### Carregamento Automático
1. **Via `media/manifest.json`** (GitHub Pages / servidor web):
   - O arquivo `media/manifest.json` lista todos os arquivos com categorias
   - Carrega automaticamente ao abrir o site hospedado

2. **Via Upload da Pasta** (Botão "Media" na barra superior → "Escolher Pasta Media"):
   - Selecione a pasta `media/` inteira do seu computador
   - Classifica e carrega tudo automaticamente

3. **Via GitHub** (Botão "Media" → campos Usuário/Repositório → "Buscar"):
   - Lê a pasta `media/` do repositório público via API GitHub

---

## 🖼️ Nova Aba: Visualizador de Media (Media Viewer)

Na aba **"Media"** do painel do Mestre, você pode:
- Ver **todas as imagens carregadas** organizadas por categoria (Mapas, Tokens, Pistas, Áudio)
- Filtrar por categoria (tabs: Todas, Mapas, Tokens, Pistas, Áudio)
- Clicar em qualquer imagem para **visualizar em tamanho grande** (modal)
- Instruções integradas de como rodar o servidor local

---

## 🔧 Configuração Firebase (Opcional - para Multiplayer/Nuvem)

Para usar sincronização em nuvem e multiplayer:

1. Crie um projeto no [Firebase Console](https://console.firebase.google.com)
2. Ative **Authentication** → Anonymous
3. Ative **Firestore Database** → Modo de teste
4. Copie a configuração do projeto (Web App)
5. Defina as variáveis globais antes de carregar o script (ou edite o HTML):

```javascript
window.__firebase_config = JSON.stringify({
    apiKey: "...",
    authDomain: "...",
    projectId: "...",
    storageBucket: "...",
    messagingSenderId: "...",
    appId: "..."
});
```

---

## 📝 Créditos

- **Sistema:** Ordem Paranormal (Cellbit / Jambô Editora)
- **Campanha:** Badaladas dos Sinos
- **Desenvolvimento:** VTT customizado em HTML/JS vanilla + Tailwind + Firebase

---

## 📄 Licença

Uso pessoal para mesa de RPG. Assets de Ordem Paranormal pertencem aos seus respectivos criadores.
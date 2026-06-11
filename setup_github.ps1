# ============================================================
# Setup Git + GitHub Pages — PDI Equipe Grupo Paraná
# Execute com botão direito → "Executar com PowerShell"
# ============================================================

$pasta = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $pasta

Write-Host ""
Write-Host "=== Setup Git — PDI Equipe Grupo Paraná ===" -ForegroundColor Cyan
Write-Host ""

# Remove .git corrompido, se existir
if (Test-Path ".git") {
    Write-Host "Removendo repositório git anterior..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".git"
}

# Inicializa
git init
git branch -M main

# Configuração de usuário (local)
git config user.name "Ananda Vital"
git config user.email "anandacvital@gmail.com"

# Adiciona todos os arquivos
git add .

# Primeiro commit
git commit -m "feat: painel PDI com abas DISC e Consultoria IA

- Adiciona aba Perfis DISC com visualizações individuais e comparativo da equipe
- Adiciona aba Consultoria IA com integração à API Anthropic (claude-sonnet-4-6)
- Dados DISC reais extraídos dos relatórios Innermetrix DISC Plus
- Values Index de todas as colaboradoras
- Organiza projeto como GitHub Pages (index.html)"

Write-Host ""
Write-Host "✅ Commit realizado com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "Agora vamos conectar ao GitHub..." -ForegroundColor Cyan
Write-Host ""

# Configura remote
# IMPORTANTE: Se o repositório não existir ainda, crie em https://github.com/new
# com o nome: pdi-equipe-grupo-parana (SEM inicializar com README)
$remote = "https://github.com/anandavital-gif/pdi-equipe-cf-grupo-parana.git"

git remote add origin $remote

Write-Host "Fazendo push para: $remote" -ForegroundColor Yellow
Write-Host "(Você pode ser solicitada a autenticar com seu GitHub)" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

Write-Host ""
Write-Host "=== Concluído! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Painel disponível em:" -ForegroundColor Cyan
Write-Host "https://anandavital-gif.github.io/pdi-equipe-cf-grupo-parana/" -ForegroundColor White
Write-Host ""
Write-Host "ATENÇÃO: Ative o GitHub Pages em:" -ForegroundColor Yellow
Write-Host "github.com/anandavital-gif/pdi-equipe-cf-grupo-parana → Settings → Pages" -ForegroundColor White
Write-Host "Branch: main | Pasta: / (root)" -ForegroundColor White
Write-Host ""
pause

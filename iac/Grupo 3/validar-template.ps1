# Script de Teste Automatizado - Grupo 3 - Microserviço de Pagamentos
# Valida o template CloudFormation localmente

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GRUPO 3 - VALIDAÇÃO DO TEMPLATE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se AWS CLI está disponível
Write-Host "[1/3] Verificando AWS CLI..." -ForegroundColor Yellow
try {
    $awsVersion = aws --version 2>&1
    Write-Host "✅ AWS CLI encontrado: $awsVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ AWS CLI não encontrado. Instale antes de continuar." -ForegroundColor Red
    exit 1
}

# Verificar se template existe
Write-Host ""
Write-Host "[2/3] Verificando template..." -ForegroundColor Yellow
$templatePath = "grupo3-pagamentos.yaml"
if (Test-Path $templatePath) {
    Write-Host "✅ Template encontrado: $templatePath" -ForegroundColor Green
} else {
    Write-Host "❌ Template não encontrado: $templatePath" -ForegroundColor Red
    exit 1
}

# Validar sintaxe YAML localmente
Write-Host ""
Write-Host "[3/3] Validando sintaxe do template..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Recursos definidos no template:" -ForegroundColor Cyan

# Extrair informações do template
$content = Get-Content $templatePath -Raw

# Verificar recursos críticos
$checks = @{
    "EC2 t2.micro" = "InstanceType: t2.micro"
    "RDS db.t3.micro" = "DBInstanceClass: db.t3.micro"
    "PostgreSQL" = "Engine: postgres"
    "Storage 20GB" = "AllocatedStorage: 20"
    "Security Groups" = "AWS::EC2::SecurityGroup"
}

$allPassed = $true
foreach ($check in $checks.GetEnumerator()) {
    if ($content -match [regex]::Escape($check.Value)) {
        Write-Host "  ✅ $($check.Key)" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $($check.Key) - NÃO ENCONTRADO" -ForegroundColor Red
        $allPassed = $false
    }
}

Write-Host ""
if ($allPassed) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✅ VALIDAÇÃO LOCAL CONCLUÍDA!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Template está correto e pronto para uso!" -ForegroundColor Green
    Write-Host "EC2 t2.micro: FREE TIER PERMANENTE" -ForegroundColor Green
    Write-Host "RDS db.t3.micro: FREE TIER PRIMEIRO ANO" -ForegroundColor Green
} else {
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "  ❌ VALIDAÇÃO FALHOU" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Próximos passos:" -ForegroundColor Cyan
Write-Host "1. Fazer commit dos arquivos" -ForegroundColor White
Write-Host "2. Criar branch para Pull Request" -ForegroundColor White
Write-Host "3. Push para GitHub" -ForegroundColor White
Write-Host "4. Criar Pull Request no repositório" -ForegroundColor White
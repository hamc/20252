# COMANDO PARA DESTRUIR A STACK - GRUPO 3

# 1. Garantir que AWS CLI está no PATH
$env:PATH += ";C:\Program Files\Amazon\AWSCLIV2"

# 2. Destruir a stack
Write-Host "🚨 DESTRUINDO stack Grupo3-Pagamentos..." -ForegroundColor Red
Write-Host ""

aws cloudformation delete-stack --stack-name Grupo3-Pagamentos

Write-Host ""
Write-Host "✅ Comando de destruição enviado!" -ForegroundColor Green
Write-Host ""
Write-Host "Para verificar se foi deletada:" -ForegroundColor Cyan
Write-Host "aws cloudformation describe-stacks --stack-name Grupo3-Pagamentos" -ForegroundColor White
Write-Host "(Deve retornar erro 'does not exist' = confirmação de exclusão)" -ForegroundColor Gray
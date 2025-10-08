# COMANDO PARA CRIAR A STACK - GRUPO 3

# 1. Garantir que AWS CLI está no PATH
$env:PATH += ";C:\Program Files\Amazon\AWSCLIV2"

# 2. Criar a stack
Write-Host "Criando stack Grupo3-Pagamentos..." -ForegroundColor Yellow
Write-Host ""

aws cloudformation create-stack `
  --stack-name Grupo3-Pagamentos `
  --template-body file://grupo3-pagamentos.yaml `
  --parameters `
    ParameterKey=VpcId,ParameterValue=vpc-00db397b `
    ParameterKey=SubnetId,ParameterValue=subnet-921f36f6 `
    ParameterKey=KeyName,ParameterValue=fatec5 `
    ParameterKey=DBUsername,ParameterValue=postgres `
    ParameterKey=DBPassword,ParameterValue=Senha123456

Write-Host ""
Write-Host "✅ Comando enviado!" -ForegroundColor Green
Write-Host ""
Write-Host "Para monitorar:" -ForegroundColor Cyan
Write-Host "aws cloudformation describe-stacks --stack-name Grupo3-Pagamentos" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  LEMBRE-SE DE DESTRUIR DEPOIS:" -ForegroundColor Red
Write-Host "aws cloudformation delete-stack --stack-name Grupo3-Pagamentos" -ForegroundColor White
# Grupo 3 - Microserviço de Pagamentos

## 📋 Descrição
Infraestrutura como Código (IaC) para o microserviço de pagamentos do sistema de e-commerce.

## 🏗️ Recursos AWS
- **EC2 t2.micro**: Servidor de aplicação (SEMPRE GRATUITO)
- **RDS PostgreSQL db.t3.micro**: Banco de dados para transações (Free Tier - 1º ano)
- **Security Groups**: Controle de acesso
- **Subnet adicional**: Para DB Subnet Group do RDS

## ⚙️ Configuração

### Parâmetros
- **VpcId**: vpc-00db397b (fornecida pelo professor)
- **SubnetId**: subnet-921f36f6 (fornecida pelo professor)
- **KeyName**: fatec5 (par de chaves do professor)
- **DBUsername**: postgres
- **DBPassword**: [definir senha]

## 🚀 Como Usar

### Criar Stack
```bash
aws cloudformation create-stack \
  --stack-name Grupo3-Pagamentos \
  --template-body file://iac/Grupo\ 3/grupo3-pagamentos.yaml \
  --parameters \
    ParameterKey=VpcId,ParameterValue=vpc-00db397b \
    ParameterKey=SubnetId,ParameterValue=subnet-921f36f6 \
    ParameterKey=KeyName,ParameterValue=fatec5 \
    ParameterKey=DBUsername,ParameterValue=postgres \
    ParameterKey=DBPassword,ParameterValue=SuaSenha123
```

### Verificar Status
```bash
aws cloudformation describe-stacks --stack-name Grupo3-Pagamentos
```

### 🚨 DESTRUIR Stack (OBRIGATÓRIO após teste)
```bash
aws cloudformation delete-stack --stack-name Grupo3-Pagamentos
```

## 📊 Tempo de Criação
- **EC2**: ~3 minutos
- **RDS PostgreSQL**: ~10-12 minutos
- **Total**: ~15 minutos

## ✅ Free Tier
- EC2 t2.micro: 750h/mês SEMPRE gratuito
- RDS db.t3.micro: 750h/mês gratuito no 1º ano
- Storage 20GB: Incluído no Free Tier

## 🎯 Outputs
- EC2 Instance ID
- EC2 Public IP
- RDS Endpoint
- SSH Command

## ⚠️ Importante
**SEMPRE destruir a stack após demonstração para evitar custos!**

---
**Desenvolvido por**: Grupo 3  
**Disciplina**: Infraestrutura como Código (IaC)
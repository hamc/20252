# 🚨 FLUXO COMPLETO - CRIAR E DESTRUIR STACK

## ⚡ RESUMO RÁPIDO (orientação do professor)

1. **CRIAR** stack para demonstração
2. **TESTAR** se funcionou  
3. **DESTRUIR** stack imediatamente (OBRIGATÓRIO)

---

## 🔄 COMANDOS EM SEQUÊNCIA

### 1️⃣ Criar Stack
```bash
aws cloudformation create-stack \
  --stack-name Grupo3-Pagamentos \
  --template-body file://iac/Grupo\ 3/grupo3-pagamentos.yaml \
  --parameters ParameterKey=VpcId,ParameterValue=vpc-00db397b \
               ParameterKey=SubnetId,ParameterValue=subnet-921f36f6 \
               ParameterKey=KeyName,ParameterValue=fatec5 \
               ParameterKey=DBUsername,ParameterValue=postgres \
               ParameterKey=DBPassword,ParameterValue=postgres123
```

### 2️⃣ Aguardar Criação (5-10 minutos)
```bash
aws cloudformation wait stack-create-complete --stack-name Grupo3-Pagamentos
echo "Stack criada com sucesso!"
```

### 3️⃣ Verificar Recursos
```bash
aws cloudformation describe-stacks --stack-name Grupo3-Pagamentos --query 'Stacks[0].Outputs'
```

### 4️⃣ 🚨 DESTRUIR IMEDIATAMENTE
```bash
aws cloudformation delete-stack --stack-name Grupo3-Pagamentos
echo "Comando de destruição enviado!"
```

### 5️⃣ Confirmar Exclusão
```bash
aws cloudformation wait stack-delete-complete --stack-name Grupo3-Pagamentos
echo "Stack completamente removida - sem custos!"
```

---

## ⏱️ TIMELINE SUGERIDA

| Tempo | Ação | Status |
|-------|------|--------|
| 0min | Executar create-stack | 🟡 Criando... |
| 5-10min | Stack completa | ✅ CREATE_COMPLETE |
| 10-12min | Demonstrar/testar | 🔍 Validando |
| 12min | **EXECUTAR DELETE** | 🚨 DESTRUINDO |
| 15-20min | Exclusão completa | ✅ REMOVIDO |

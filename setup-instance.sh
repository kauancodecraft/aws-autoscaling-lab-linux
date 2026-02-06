#!/bin/bash

# Script auxiliar para lançar a instância base via AWS CLI
# Preencha as variáveis abaixo antes de executar

KEYNAME="SEU_KEYNAME"
AMIID="SUA_AMIID"
HTTPACCESS="SEU_SG_ID"
SUBNETID="SUA_SUBNET_ID"

echo "Lançando instância WebServer..."

INSTANCE_ID=$(aws ec2 run-instances \
    --key-name $KEYNAME \
    --instance-type t3.micro \
    --image-id $AMIID \
    --user-data file://scripts/UserData.txt \
    --security-group-ids $HTTPACCESS \
    --subnet-id $SUBNETID \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]' \
    --output text --query 'Instances[*].InstanceId')

echo "Instância criada: $INSTANCE_ID"
echo "Aguardando inicialização..."

aws ec2 wait instance-running --instance-ids $INSTANCE_ID

echo "Instância pronta. Aguarde alguns minutos para a instalação do software antes de criar a AMI."

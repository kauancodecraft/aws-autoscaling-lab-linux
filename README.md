# AWS Auto Scaling & Load Balancing (Linux)

Este repositório contém um guia prático e scripts para configurar uma infraestrutura escalável na AWS utilizando **Amazon EC2 Auto Scaling** e **Application Load Balancer (ALB)**.

## 📋 Visão Geral

O objetivo deste projeto é demonstrar como criar uma arquitetura de alta disponibilidade que escala automaticamente com base na carga de trabalho. O fluxo de trabalho inclui:
1. Criação de uma instância EC2 base via **AWS CLI**.
2. Configuração de um servidor web com script de **User Data**.
3. Criação de uma **AMI (Amazon Machine Image)** personalizada.
4. Configuração de um **Application Load Balancer**.
5. Implementação de um **Auto Scaling Group** com políticas de escalonamento dinâmico.

## 🏗️ Arquitetura

A arquitetura final consiste em:
- Um **Application Load Balancer** em sub-redes públicas.
- Um **Auto Scaling Group** gerenciando instâncias EC2 em sub-redes privadas.
- Distribuição em duas **Zonas de Disponibilidade** para tolerância a falhas.
- Monitoramento via **Amazon CloudWatch** para gatilhos de escalonamento.

## 🚀 Como Usar

### Pré-requisitos
- Conta AWS ativa.
- AWS CLI configurado com as permissões necessárias.
- VPC com sub-redes públicas e privadas configuradas.

### Passos Principais

#### 1. Preparação da Instância Base
Utilize o script `scripts/setup-instance.sh` para lançar a instância inicial que servirá de modelo para a AMI.

#### 2. Configuração do Auto Scaling
Siga o guia detalhado em [docs/LAB_GUIDE.md](docs/LAB_GUIDE.md) para configurar o Load Balancer e o Grupo de Auto Scaling através do Console AWS ou CLI.

#### 3. Teste de Carga
Acesse o DNS do Load Balancer e utilize a função "Iniciar Estresse" para validar o comportamento do Auto Scaling.

## 🛠️ Tecnologias Utilizadas
- **Amazon EC2**: Servidores virtuais.
- **AWS Auto Scaling**: Ajuste automático de capacidade.
- **Elastic Load Balancing (ELB)**: Distribuição de tráfego.
- **Amazon CloudWatch**: Monitoramento e alarmes.
- **Bash/AWS CLI**: Automação de infraestrutura.

---
*Este projeto foi desenvolvido como parte de um laboratório prático de AWS Cloud Computing.*

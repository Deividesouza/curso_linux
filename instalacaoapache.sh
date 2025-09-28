#!/bin/bash

# Atualiza pacotes do sistema
echo "==> Atualizando pacotes..."
sudo apt update -y && sudo apt upgrade -y

# Instala Apache
echo "==> Instalando Apache2..."
sudo apt install -y apache2

# Inicia e habilita o Apache no boot
echo "==> Iniciando serviço do Apache..."
sudo systemctl start apache2
sudo systemctl enable apache2

# Configura página inicial personalizada
echo "==> Criando página inicial..."
echo "<h1>Servidor Apache Provisionado Automaticamente!</h1>" | sudo tee /var/www/html/index.html

# (Opcional) Ajusta firewall
if command -v ufw >/dev/null 2>&1; then
    echo "==> Configurando firewall (UFW)..."
    sudo ufw allow 'Apache Full'
fi

# Exibe status
echo "==> Status do Apache:"
systemctl status apache2 --no-pager

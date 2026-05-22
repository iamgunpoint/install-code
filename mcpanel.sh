#!/bin/bash

# ==========================================
#        IamGunpoint Auto Installer
# ==========================================

clear

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Animation Function
loading() {
    local pid=$!
    local spin='-\|/'
    local i=0

    while kill -0 $pid 2>/dev/null; do
        i=$(( (i+1) %4 ))
        printf "\r${CYAN}[%c] Working hard bro... ${NC}" "${spin:$i:1}"
        sleep .1
    done

    printf "\r${GREEN}✔ Done!                             ${NC}\n"
}

# Cool Banner
echo -e "${MAGENTA}"
cat << "EOF"

██╗ █████╗ ███╗   ███╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗  ██████╗ ██╗███╗   ██╗████████╗
██║██╔══██╗████╗ ████║██╔════╝ ██║   ██║████╗  ██║██╔══██╗██╔═══██╗██║████╗  ██║╚══██╔══╝
██║███████║██╔████╔██║██║  ███╗██║   ██║██╔██╗ ██║██████╔╝██║   ██║██║██╔██╗ ██║   ██║   
██║██╔══██║██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║██╔═══╝ ██║   ██║██║██║╚██╗██║   ██║   
██║██║  ██║██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║██║ ╚████║   ██║   
╚═╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝   

EOF
echo -e "${NC}"

echo -e "${CYAN}🚀 Starting MCPANEL Auto Installer...${NC}"
sleep 1

echo -e "${YELLOW}📦 Updating packages...${NC}"
apt update -y > /dev/null 2>&1 &
loading

echo -e "${YELLOW}🔧 Installing sudo & curl...${NC}"
apt install -y sudo curl git > /dev/null 2>&1 &
loading

echo -e "${YELLOW}🟢 Installing Node.js...${NC}"
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash - > /dev/null 2>&1 &
loading

sudo apt-get install -y nodejs > /dev/null 2>&1 &
loading

echo -e "${GREEN}✔ Node Version:${NC} $(node -v)"
echo -e "${GREEN}✔ NPM Version:${NC} $(npm -v)"

echo -e "${YELLOW}☕ Installing Java 21...${NC}"
apt install -y openjdk-21-jre > /dev/null 2>&1 &
loading

echo -e "${GREEN}✔ Java Version:${NC}"
java -version

echo -e "${YELLOW}📥 Cloning MCPANEL...${NC}"
git clone https://github.com/buddyshadow00/mcpanel > /dev/null 2>&1 &
loading

cd mcpanel || {
    echo -e "${RED}❌ Failed to enter mcpanel folder!${NC}"
    exit 1
}

echo -e "${YELLOW}📚 Installing npm packages...${NC}"
npm install > /dev/null 2>&1 &
loading

export PORT=8080

echo ""
echo -e "${GREEN}══════════════════════════════════════${NC}"
echo -e "${GREEN}🎉 INSTALLATION COMPLETED SUCCESSFULLY${NC}"
echo -e "${GREEN}══════════════════════════════════════${NC}"
echo ""
echo -e "${CYAN}🌐 Panel Port:${NC} 8080"
echo -e "${CYAN}📂 Directory:${NC} $(pwd)"
echo -e "${CYAN}👑 Owner:${NC} IamGunpoint"
echo ""
echo -e "${MAGENTA}🚀 Starting MCPANEL...${NC}"
echo ""

sleep 2

node .

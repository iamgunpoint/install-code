#!/bin/bash

# ==============================
#        ImGunpoint Panel
# ==============================

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Loading Animation
loading() {
    clear
    echo -e "${MAGENTA}"
    echo "╔══════════════════════════════════════╗"
    echo "║        Starting ImGunpoint          ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${NC}"

    for i in {1..20}; do
        echo -ne "${CYAN}Loading${NC} ${GREEN}["
        
        for j in $(seq 1 $i); do
            echo -ne "■"
        done
        
        for j in $(seq $i 19); do
            echo -ne " "
        done
        
        echo -ne "] ${YELLOW}$((i * 5))%${NC}\r"
        sleep 0.08
    done

    echo ""
    sleep 0.3
}

# Banner
banner() {
    clear
    echo -e "${GREEN}"
echo '██╗███╗   ███╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗  ██████╗ ██╗███╗   ██╗████████╗'
echo '██║████╗ ████║██╔════╝ ██║   ██║████╗  ██║██╔══██╗██╔═══██╗██║████╗  ██║╚══██╔══╝'
echo '██║██╔████╔██║██║  ███╗██║   ██║██╔██╗ ██║██████╔╝██║   ██║██║██╔██╗ ██║   ██║'
echo '██║██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║██╔═══╝ ██║   ██║██║██║╚██╗██║   ██║'
echo '██║██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║██║ ╚████║   ██║'
echo '╚═╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝'
    echo -e "${NC}"

    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}              Welcome ${GREEN}ImGunpoint${NC}"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Pause Function
pause() {
    echo ""
    read -p "Press Enter to continue..."
}

# Main Menu
main_menu() {
    while true; do
        banner

        echo ""
        echo -e "${MAGENTA}╔══════════════════════╗${NC}"
        echo -e "${MAGENTA}║${WHITE}       MAIN MENU      ${MAGENTA}║${NC}"
        echo -e "${MAGENTA}╚══════════════════════╝${NC}"

        echo -e "${GREEN}[1]${NC} PufferPanel"
        echo -e "${GREEN}[2]${NC} Root"
        echo -e "${GREEN}[3]${NC} Tools"
        echo -e "${GREEN}[4]${NC} HVM Panel"
        echo -e "${RED}[0]${NC} Exit"
        echo ""

        read -p "Select Option ➜ " option

        case $option in
            1)
                pufferpanel_menu
                ;;
            2)
                root_menu
                ;;
            3)
                tools_menu
                ;;
            4)
                hvm_menu
                ;;
            0)
                clear
                echo -e "${RED}"
                echo "╔════════════════════════════╗"
                echo "║     Goodbye ImGunpoint    ║"
                echo "╚════════════════════════════╝"
                echo -e "${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid Option!${NC}"
                sleep 1
                ;;
        esac
    done
}

# PufferPanel Menu
pufferpanel_menu() {
    while true; do
        banner

        echo ""
        echo -e "${BLUE}╔══════════════════════════════╗${NC}"
        echo -e "${BLUE}║${WHITE}      PUFFERPANEL MENU       ${BLUE}║${NC}"
        echo -e "${BLUE}╚══════════════════════════════╝${NC}"

        echo -e "${GREEN}[1]${NC} Install PufferPanel"
        echo -e "${GREEN}[2]${NC} Create User"
        echo -e "${GREEN}[3]${NC} Run Panel"
        echo -e "${RED}[0]${NC} Back"
        echo ""

        read -p "Select Option ➜ " puff

        case $puff in
            1)
                clear
                echo -e "${CYAN}Installing...${NC}"
                sleep 1
                bash <(curl -s https://raw.githubusercontent.com/IamGunpoint/install-code/main/pufferpanel.sh)
                pause
                ;;
            2)
                clear
                echo -e "${CYAN}Opening User Creator...${NC}"
                sleep 1
                pufferpanel user create
                pause
                ;;
            3)
                clear
                echo -e "${CYAN}Starting Service...${NC}"
                sleep 1
                pufferpanel runService
                pause
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}Invalid Option!${NC}"
                sleep 1
                ;;
        esac
    done
}

# Root Menu
root_menu() {
    while true; do
        banner

        echo ""
        echo -e "${CYAN}╔══════════════════════════════╗${NC}"
        echo -e "${CYAN}║${WHITE}         ROOT MENU           ${CYAN}║${NC}"
        echo -e "${CYAN}╚══════════════════════════════╝${NC}"

        echo -e "${GREEN}[1]${NC} Run Root Installer"
        echo -e "${RED}[0]${NC} Back"
        echo ""

        read -p "Select Option ➜ " rootopt

        case $rootopt in
            1)
                clear
                echo -e "${CYAN}Launching...${NC}"
                sleep 1
                bash <(curl -s https://raw.githubusercontent.com/IamGunpoint/install-code/main/root.sh)
                pause
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}Invalid Option!${NC}"
                sleep 1
                ;;
        esac
    done
}

# Tools Menu
tools_menu() {
    while true; do
        banner

        echo ""
        echo -e "${YELLOW}╔══════════════════════════════╗${NC}"
        echo -e "${YELLOW}║${WHITE}         TOOLS MENU          ${YELLOW}║${NC}"
        echo -e "${YELLOW}╚══════════════════════════════╝${NC}"

        echo -e "${GREEN}[1]${NC} Tool 1"
        echo -e "${GREEN}[2]${NC} Tool 2"
        echo -e "${GREEN}[3]${NC} Tool 3"
        echo -e "${RED}[0]${NC} Back"
        echo ""

        read -p "Select Option ➜ " tool

        case $tool in
            1)
                clear
                echo -e "${CYAN}Running...${NC}"
                sleep 1
                curl -fsSL https://tailscale.com/install.sh | sh
                pause
                ;;
            2)
                clear
                echo -e "${CYAN}Running...${NC}"
                sleep 1
                curl -sSf https://sshx.io/get | sh
                pause
                ;;
            3)
                clear
                echo -e "${CYAN}Running...${NC}"
                sleep 1

                sudo mkdir -p --mode=0755 /usr/share/keyrings
                curl -fsSL https://pkg.cloudflare.com/cloudflare-public-v2.gpg | sudo tee /usr/share/keyrings/cloudflare-public-v2.gpg >/dev/null

                echo 'deb [signed-by=/usr/share/keyrings/cloudflare-public-v2.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list

                sudo apt-get update && sudo apt-get install cloudflared -y

                pause
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}Invalid Option!${NC}"
                sleep 1
                ;;
        esac
    done
}

# HVM Menu
hvm_menu() {
    while true; do
        banner

        echo ""
        echo -e "${MAGENTA}╔══════════════════════════════╗${NC}"
        echo -e "${MAGENTA}║${WHITE}         HVM PANEL           ${MAGENTA}║${NC}"
        echo -e "${MAGENTA}╚══════════════════════════════╝${NC}"

        echo -e "${GREEN}[1]${NC} Run HVM Panel"
        echo -e "${RED}[0]${NC} Back"
        echo ""

        read -p "Select Option ➜ " hvm

        case $hvm in
            1)
                clear
                echo -e "${CYAN}Launching HVM Panel...${NC}"
                sleep 1
                bash <(curl -s https://raw.githubusercontent.com/officialraghavwarrior-commits/test/refs/heads/main/test.sh)
                pause
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}Invalid Option!${NC}"
                sleep 1
                ;;
        esac
    done
}

# Start
loading
main_menu

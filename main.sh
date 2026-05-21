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
        echo -e "${GREEN}[2]${NC} Root Installer"
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
                echo -e "${CYAN}Installing PufferPanel...${NC}"
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
                echo -e "${CYAN}Starting PufferPanel Service...${NC}"
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
                echo -e "${CYAN}Launching Root Installer...${NC}"
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

# Start
loading
main_menu

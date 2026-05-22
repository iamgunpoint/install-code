#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
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
        
        echo -ne "] $((i * 5))%\r"
        sleep 0.05
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

    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}              Welcome ImGunpoint${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# Pause
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
        echo -e "${MAGENTA}║${GREEN}       MAIN MENU      ${MAGENTA}║${NC}"
        echo -e "${MAGENTA}╚══════════════════════╝${NC}"

        echo -e "${GREEN}[1]${NC} Root"
        echo -e "${GREEN}[2]${NC} MCPANEL Install"
        echo -e "${RED}[0]${NC} Exit"
        echo ""

        read -p "Select Option ➜ " option

        case $option in
            1)
                clear
                echo -e "${CYAN}Launching Root Installer...${NC}"
                sleep 1
                bash <(curl -s https://raw.githubusercontent.com/IamGunpoint/install-code/main/root.sh)
                pause
                ;;

            2)
                clear
                echo -e "${CYAN}Installing MCPANEL...${NC}"
                sleep 1
                bash <(curl -s https://raw.githubusercontent.com/IamGunpoint/install-code/main/mcpanel.sh)
                pause
                ;;

            0)
                clear
                echo -e "${RED}"
                echo "╔════════════════════════════╗"
                echo "║      Goodbye ImGunpoint   ║"
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

# Start
loading
main_menu

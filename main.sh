#!/bin/bash

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Banner
clear
echo -e "${GREEN}"
echo "██╗███╗   ███╗ ██████╗ ██╗   ██╗███╗   ██╗██████╗  ██████╗ ██╗███╗   ██╗████████╗"
echo "██║████╗ ████║██╔════╝ ██║   ██║████╗  ██║██╔══██╗██╔═══██╗██║████╗  ██║╚══██╔══╝"
echo "██║██╔████╔██║██║  ███╗██║   ██║██╔██╗ ██║██████╔╝██║   ██║██║██╔██╗ ██║   ██║"
echo "██║██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║██╔═══╝ ██║   ██║██║██║╚██╗██║   ██║"
echo "██║██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║██║ ╚████║   ██║"
echo "╚═╝╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝╚═╝  ╚═══╝   ╚═╝"
echo -e "${NC}"

echo -e "${GREEN}Welcome ImGunpoint${NC}"

main_menu() {
    echo ""
    echo -e "${CYAN}===== MAIN MENU =====${NC}"
    echo "1) PufferPanel"
    echo "0) Exit"
    echo ""

    read -p "Select Option: " main_option

    case $main_option in
        1)
            pufferpanel_menu
            ;;
        0)
            echo -e "${RED}Exiting...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid Option!${NC}"
            main_menu
            ;;
    esac
}

pufferpanel_menu() {
    clear
    echo -e "${YELLOW}===== PUFFERPANEL MENU =====${NC}"
    echo "1) Install PufferPanel"
    echo "2) Create User"
    echo "3) Run Panel"
    echo "0) Back"
    echo ""

    read -p "Select Option: " puff_option

    case $puff_option in
        1)
            echo -e "${GREEN}Installing PufferPanel...${NC}"
            bash <(curl -s https://raw.githubusercontent.com/IamGunpoint/install-code/main/pufferpanel.sh)
            ;;
        2)
            echo -e "${GREEN}Creating User...${NC}"
            pufferpanel user create
            ;;
        3)
            echo -e "${GREEN}Running PufferPanel...${NC}"
            pufferpanel runService
            ;;
        0)
            clear
            main_menu
            ;;
        *)
            echo -e "${RED}Invalid Option!${NC}"
            pufferpanel_menu
            ;;
    esac

    echo ""
    read -p "Press Enter to continue..."
    clear
    pufferpanel_menu
}

main_menu

#!/bin/bash

# --- Colors ---
C_CYAN="\e[38;5;51m"
C_BLUE="\e[38;5;33m"
C_PURPLE="\e[38;5;141m"
C_GREEN="\e[38;5;46m"
C_YELLOW="\e[38;5;226m"
C_RED="\e[38;5;196m"
C_WHITE="\e[1;37m"
C_GRAY="\e[38;5;240m"
C_GLOW="\e[38;5;87m"
NC="\e[0m"

echo -ne "\e[?25l"
trap "echo -ne '\e[?25h'; clear; exit" INT TERM EXIT

clear
echo ""

# ==========================================
# 1. CREDITS ANIMATION
# ==========================================
echo -e "    ${C_YELLOW}✦ ─────── DEVELOPED BY ─────── ✦${NC}"
sleep 0.3

BOX_BORDER="${C_CYAN}"
TEXT_COLOR="${C_WHITE}"
print_top()    { echo -e "    ${BOX_BORDER}╭────────────────────────────────────────────────────────────────────────╮${NC}"; }
print_bottom() { echo -e "    ${BOX_BORDER}╰────────────────────────────────────────────────────────────────────────╯${NC}"; }
type_in_box() {
    local text="$1"; local padding=$(( 72 - ${#text} ))
    echo -ne "    ${BOX_BORDER}│ ${TEXT_COLOR}"
    for (( i=0; i<${#text}; i++ )); do echo -n "${text:$i:1}"; sleep 0.01; done
    for (( i=0; i<padding; i++ )); do echo -n " "; done
    echo -e " ${BOX_BORDER}│${NC}"
}

print_top
type_in_box " Developer & Credits"
type_in_box ""
type_in_box " Developed by: Developer | Rupesh"
type_in_box " DeUP Gaming - Free Hosting Tool"
type_in_box " Built for learning and educational purposes."
print_bottom
echo ""
sleep 1

# ==========================================
# 2. MAIN MENU
# ==========================================
clear
echo ""

banner=(
"██████╗ ███████╗██╗   ██╗██████╗      "
"██╔══██╗██╔════╝██║   ██║██╔══██╗     "
"██║  ██║█████╗  ██║   ██║██████╔╝     "
"██║  ██║██╔══╝  ██║   ██║██╔═══╝      "
"██████╔╝███████╗╚██████╔╝██║          "
"╚═════╝ ╚══════╝ ╚═════╝ ╚═╝          "
" ██████╗  █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗ "
"██╔════╝ ██╔══██╗████╗ ████║██║████╗  ██║██╔════╝ "
"██║  ███╗███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗"
"██║   ██║██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║"
"╚██████╔╝██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝"
" ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ "
)

for line in "${banner[@]}"; do echo -e "    ${C_GLOW}$line${NC}"; sleep 0.05; done
echo ""

echo -e "    ${C_YELLOW}✦ ───────── MAIN MENU ───────── ✦${NC}"
echo -e "    ${C_CYAN}[1]${NC} ${C_WHITE}Hosting Command${NC}"
echo -e "    ${C_CYAN}[0]${NC} ${C_GRAY}Exit${NC}"
echo -e "    ${C_YELLOW}─────────────────────────────────${NC}"
echo -e "    ${C_GRAY}Developed by Developer | Rupesh${NC}"
echo ""

echo -ne "    ${C_WHITE}➜ Select an option (0-1): ${NC}"
echo -ne "\e[?25h"
read -r choice
echo -ne "\e[?25l"

if [[ "$choice" == "0" ]]; then clear; exit 0; fi
if [[ "$choice" != "1" ]]; then echo -e "\n    ${C_RED}❌ Invalid option. Exiting...${NC}"; exit 1; fi

# ==========================================
# LOADING ANIMATION
# ==========================================
clear
echo ""

echo -e "    ${C_CYAN}❖ DeUP GAMING CLOUD SYSTEM ❖${NC}\n"

logs=("Establishing Secure Tunnel..." "Connecting to Server Nodes..." "Allocating CPU & RAM..." "Finalizing Container Setup...")
spinners=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

for (( step=0; step<4; step++ )); do
    for (( i=0; i<15; i++ )); do
        spin=${spinners[$((i % 10))]}
        echo -ne "\e[2K\r    ${C_BLUE}${spin} ${C_WHITE}${logs[$step]}${NC}"
        sleep 0.05
    done
    echo -e "\e[2K\r    ${C_GREEN}✔ ${logs[$step]} [DONE]${NC}"
done

echo ""
bar_length=45
for (( i=1; i<=100; i++ )); do
    filled=$(( (i * bar_length) / 100 ))
    empty=$(( bar_length - filled ))
    f_bar=$(printf "%${filled}s" | tr ' ' '█')
    e_bar=$(printf "%${empty}s" | tr ' ' '░')
    echo -ne "\r    ${C_CYAN}Deploying Workspace: ${C_BLUE}▕${C_CYAN}${f_bar}${C_GRAY}${e_bar}${C_BLUE}▏ ${C_WHITE}${i}%%${NC}"
    sleep 0.03
done

echo -e "\n\n    ${C_GREEN}❖ Environment Successfully Initialized ❖${NC}"
for i in {3..1}; do echo -ne "\r    ${C_GLOW}Launching Interface in ${i}...${NC}   "; sleep 1; done
echo -ne "\r    ${C_GREEN}>>> SYSTEM ONLINE <<<      ${NC}\n"

sleep 0.5
trap - INT TERM EXIT
echo -ne "\e[?25h"
clear

# Yahan apna hosting script URL daal
# bash <(curl -sL YOUR_SCRIPT_URL)

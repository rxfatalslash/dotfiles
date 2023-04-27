#!/usr/sh
#
# Autor: rxfatalslash
#
# url: https://github.com/rxfatalslash

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
bold=$(tput bold)
normal=$(tput sgr0)

backup_dir=~/.dotBackup
date=(date +%d:%m:%Y - %H:%M:%S)

logo () {

    local text="${1:?}"
    echo -en "
    WOdddddxk0KNW                                            WNK0kxdddddOW 
     Wo........',:lx0N                                    N0xl:,'........oW 
      Xc.,clcc:;'....;lON                              NOl;....';:cclc,.cX  
       Kc'cdodlc::ccc;..:kN                          Nk:..;ccc::cldodc'cK   
        Xo;:loooooooool:,'cK                        Kc',:loooooooool:;oX    
         WKxolccclllllllc;';OW                    WO;';clllllllcccloxKW     
            WNKOOOOkkkOkkkdokN                    NkodkkkOkkkOOOOKNW       
    \n\n"
    printf ' %s [%s%s %s%s %s]%s\n\n' "${red}" "${normal}" "${yellow}" "${text}" "${normal}" "${red}" "${normal}"
}

if [ "$(id -u)" = 0 ]; then
    echo "NO debes ejecutar este script como root"
    exit 1
fi

printf "%s%sSe va a comprobar que tienes las dependencias necesarias, y si no, se instalarán. Se hará una copia de seguridad de tus archivos%s" "${bold}" "${red}" "${normal}"

while true; do
    read -rp " ¿Deseas continuar?  [s/N]: " confirm
    case $confirm in
        [Ss]*) break;;
        [Nn]*) exit;;
        *) printf " %s%sError: Escribe 's' o 'n'%s\n\n" "${bold}" "${red}" "${normal}";;
    esac
done
clear

logo "Instalando los paquetes necesarios..."

dependencias=(bspwm polybar sxhkd \
              kitty rofi meson cmake \
              nproc libev uthash libconfig \
              feh zsh-syntax-highlighting zsh-autosuggestions \
              imagemagick xorg-xsetroot lsd)

# Instalar Hack Nerd Fonts
cp -r HackNerdFonts /usr/share/fonts
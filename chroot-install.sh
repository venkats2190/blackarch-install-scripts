#!/bin/bash
################################################################################
#                                                                              #
# blackarchinstall - Blackarch Install                                         #
#                                                                              #
# FILE                                                                         #
# chroot-install.sh                                                            #
#                                                                              #
# DATE                                                                         #
# 2013-12-16                                                                   #
#                                                                              #
# DESCRIPTION                                                                  #
# Script for easy install                                                      #
#                                                                              #
# AUTHOR                                                                       #
# nrz@nullsecurity.net                                                         #
#                                                                              #
################################################################################

# SECURITY VAR - this version can rm -rf /* your hard drive
SEC_ENABLE="false"

# HD beta var
HD="sda"

# blackarchinstall version
VERSION="v0.2"

# true / false
FALSE="0"
TRUE="1"

# return codes
SUCCESS="1337"
FAILURE="31337"

# verbose mode - default: quiet
VERBOSE="/dev/null"

# colors
WHITE="$(tput bold ; tput setaf 7)"
GREEN="$(tput setaf 2)"
RED="$(tput bold; tput setaf 1)"
YELLOW="$(tput bold ; tput setaf 3)"
NC="$(tput sgr0)" # No Color

# BA REPO
BLACKARCH_REPO_URL='http://www.blackarch.org/blackarch/$repo/os/$arch'

wprintf() {
    fmt=$1
    shift
    printf "%s${fmt}%s\n" "${WHITE}" "$@" "${NC}"

    return "${SUCCESS}"
}

# print warning
warn()
{
    printf "%s[!] WARNING: %s%s\n" "${RED}" "${*}" "${NC}"

    return "${SUCCESS}"
}

# print error and exit
err()
{
    printf "%s[-] ERROR: %s%s\n" "${RED}" "${*}" "${NC}"

    return "${SUCCESS}"
}

# print error and exit
cri()
{
    printf "%s[-] CRITICAL: %s%s\n" "${RED}" "${*}" "${NC}"

    exit "${FAILURE}"
}


# usage and help
usage()
{
cat <<EOF
Usage: $0 <arg> | <misc>
OPTIONS:
    -i: install
MISC:
    -V: print version and exit
    -H: print help and exit
EOF
    return "${SUCCESS}"
}

check_env()
{
    if [ -f /var/lib/pacman/db.lck ]; then
        cri "Pacman locked - rm /var/lib/pacman/db.lck"
    fi
}

# check argument count
check_argc()
{
    return "${SUCCESS}"
}

# check if required arguments were selected
check_args()
{
    return "${SUCCESS}"
}

update_system()
{
    if ! grep -q "blackarch" /etc/pacman.conf; then
        wprintf "[+] Adding BlackArch Official Repo"
        printf '[blackarch]\nServer = %s\n' "${BLACKARCH_REPO_URL}" >> /etc/pacman.conf
    fi

    # key problem - will be solved later on
    pacman-key --init
    pacman -Syyu --noconfirm
    pacman-key -r 4345771566D76038C7FEB43863EC0ADBEA87E4E3
    pacman-key --lsign-key 4345771566D76038C7FEB43863EC0ADBEA87E4E3
    pacman -Syy

    return "${SUCCESS}"
}

install_packages()
{
    pacman -S blackarch
    pacman -S grub --noconfirm

    return "${SUCCESS}"
}

install_grub()
{
    grub-install /dev/sda
    grub-mkconfig -o /boot/grub/grub.cfg

    return "${SUCCESS}"
}

install()
{
    wprintf "[+] Updating system..."
    update_system

    wprintf "[+] Installing packages..."
    install_packages

    wprintf "[+] Installing grub..."
    install_grub

    return "${SUCCESS}"
}

# parse command line options
get_opts()
{
    while getopts ivVH flags
    do
        case "${flags}" in
            i)
                #optarg=${OPTARG}
                opt="install"
                ;;
            v)
                VERBOSE="/dev/stdout"
                ;;
            V)
                printf "%s\n" "${VERSION}"
                exit "${SUCCESS}"
                ;;
            H)
                usage
                ;;
            *)
                err "WTF?! mount /dev/brain"
                ;;
        esac
    done

    return "${SUCCESS}"
}


# controller and program flow
main()
{
    check_argc ${*}
    get_opts ${*}
    check_args ${*}
    check_env

    # commented arg opt
    install

    return "${SUCCESS}"
}


# program start
main ${*}

# EOF

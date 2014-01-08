#
# ~/.bashrc
#

# Colors
DarkGrey="$(tput bold ; tput setaf 0)"
White="$(tput bold ; tput setaf 7)"
Red="$(tput bold; tput setaf 1)"
NC="$(tput sgr0)" # No Color

PS1="\[$DarkGrey\][ \[$Red\]blackarch \[$White\]\u\[$DarkGrey\]@\h \[$Red\]\W\[$Red\] \[$DarkGrey\]]\\[$Red\]$ \[$NC\]"
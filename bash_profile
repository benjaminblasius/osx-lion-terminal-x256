# osx-lion-terminal-x256

clear

PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
PATH="/usr/local/mysql/bin:$PATH" # mysql path
export PATH

export BUNDLEEDITOR=/usr/local/bin/mate
export CLICOLOR=1
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# customize the colors in terminal preferences to your liking
export TERM='xterm-color'
export COLOR_NC='\[\033[0m\]' # No Color

export COLOR_BLACK='\[\033[0;30m\]'
export COLOR_BRIGHT_BLACK='\[\033[1;30m\]'
export COLOR_RED='\[\033[0;31m\]'
export COLOR_BRIGHT_RED='\[\033[1;31m\]'
export COLOR_GREEN='\[\033[0;32m\]'
export COLOR_BRIGHT_GREEN='\[\033[1;32m\]'
export COLOR_YELLOW='\[\033[1;33m\]'
export COLOR_BRIGHT_YELLOW='\[\033[1;33m\]'
export COLOR_BLUE='\[\033[0;34m\]'
export COLOR_BRIGHT_BLUE='\[\033[1;34m\]'
export COLOR_PURPLE='\[\033[0;35m\]'
export COLOR_BRIGHT_PURPLE='\033[1;35m\]'
export COLOR_CYAN='\[\033[0;36m\]'
export COLOR_BRIGHT_CYAN='\[\033[1;36m\]'
export COLOR_WHITE='\[\033[0;37m\]'
export COLOR_BRIGHT_WHITE='\[\033[1;37m\]'
alias colorslist="set | egrep '^COLOR_\\w*'"  # lists all the colors

# call this function from prompt then customize your terminal colors how you like in the terminal/preference/settings
# colors will change so you can see what they look like in the terminal
colorsdisplay (){
	echo -e "\033[0mCOLOR_NC (No color)"
	echo -e "\033[0;30mCOLOR_BLACK\t\033[1;30mCOLOR_BRIGHT_BLACK"
	echo -e "\033[0;31mCOLOR_RED\t\033[1;31mCOLOR_BRIGHT_RED"
	echo -e "\033[0;32mCOLOR_GREEN\t\033[1;32mCOLOR_BRIGHT_GREEN"
	echo -e "\033[0;33mCOLOR_YELLOW\t\033[1;33mCOLOR_BRIGHT_YELLOW"				
	echo -e "\033[0;34mCOLOR_BLUE\t\033[1;34mCOLOR_BRIGHT_BLUE"
	echo -e "\033[0;35mCOLOR_PURPLE\t\033[1;35mCOLOR_BRIGHT_PURPLE"
	echo -e "\033[0;36mCOLOR_CYAN\t\033[1;36mCOLOR_BRIGHT_CYAN"
	echo -e "\033[0;37mCOLOR_WHITE\t\033[1;37mCOLOR_BRIGHT_WHITE"
}

# begin rvm display (if you don't want to use the rvm prompt display just comment out these lines in this section)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
PS1="${COLOR_BRIGHT_BLACK}[${COLOR_NC}${COLOR_BRIGHT_PURPLE}rvm -> \$(~/.rvm/bin/rvm-prompt)${COLOR_NC}${COLOR_BRIGHT_BLACK}]\n"
# end rvm display

# begin git display (if you don't want to use the git prompt display just comment lines in this section)
# \W$(__git_ps1 " (%s)")
# Turn on git tab completion if the file exists (get it here: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
if [ -f ~/src/git/git-completion.bash ]; then
    . ~/src/git/git-completion.bash
	PS1="$PS1[${COLOR_NC}${COLOR_CYAN}git -> \W$(__git_ps1 " (%s)")${COLOR_NC}${COLOR_BRIGHT_BLACK}]\n"
fi
# end git display

# current working directory prompt
PS1="$PS1[${COLOR_NC}${COLOR_GREEN}pwd -> \w${COLOR_NC}${COLOR_BRIGHT_BLACK}]\n[${COLOR_NC}${COLOR_RED}\T${COLOR_NC}${COLOR_BRIGHT_BLACK}] -> ${COLOR_NC}"
export PS1
# prompt for continuing commands
PS2="${COLOR_BRIGHT_BLACK} -> ${COLOR_NC}"
export PS2

alias ls='ls --color=auto' 
alias ls='ls -Glas'
alias ll='ls -Ghlas'
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias g='grep -i'  #case insensitive grep
alias f='find . -iname'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders and files
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'

# allows you to save bookmarks to folders
#  cd ~/src/git
#  save git
#  cd ~/src/git/killer/rails/awesome/app
#  save awesome_app
# list your bookmarks
#  show
#   git="~/src/git"
#   awesome_app="~/src/git/killer/rails/awesome/app"
# easily cd into the bookmarks from any directory
#  cd git
#  cd awesome_app
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

# bash shell useful settings
export HISTCONTROL=ignoredups # Ignores dupes in the history
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# shows the commands you use most, it's useful to show you what you should create aliases for
alias profileme="history | awk '{print $2}' | awk 'BEGIN{FS=\"|\"}{print $1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
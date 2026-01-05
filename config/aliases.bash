# ~/.aliases.bash
# Sourced by ~/.bashrc

# --- Git shortcuts ---
alias push="git push origin HEAD"
alias pull="git pull origin HEAD"
alias pr="gh pr create"
alias grh="git reset --hard"
alias gr="git reset"
alias tree='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset'\'' --abbrev-commit --date=relative'
alias cleanup_git='git fetch origin --prune'
alias gti='git'

# --- vim/nvim typos ---
alias ivm='nvim'
alias ivn='nvim'
alias vin='nvim'
alias cim='nvim'
alias vom='nvim'
alias vmi='nvim'

# --- npm ---
alias ni="npm i"
alias nr="npm run"
alias nrt="npm run test"
alias nis="npm install --save"
alias nisd="npm install --save-dev"

# --- React Native ---
alias rn="npx react-native"
alias rncc='watchman watch-del-all && rm -rf node_modules && npm cache clean --force && npm i && npm start -- --reset-cache'

# --- Docker ---
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcc='docker-compose config'

# --- Navigation ---
alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'

# --- Postgres ---
alias pgstart='brew services start postgresql@14'
alias pgstop='brew services stop postgresql@14'

# --- Redis ---
alias redis_start='brew services start redis'
alias redis_stop='brew services stop redis'

# --- Utilities ---
alias es='exec $SHELL'
alias duh='du -csh'
alias myip="curl -s ipecho.net/plain; echo"
alias q='exit'
alias nuke='kill -9 %%'
alias mkdri='mkdir'

# --- Functions ---

# Backup a file with .bak extension
bak() {
    cp "$1" "${1}.bak"
}

# Extract various archive formats
extract() {
    if [ -f "$1" ]; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "ERROR: Don't know how to extract '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Search processes by name
psgrep() {
    ps ax | grep -v grep | grep "$@" -i --color=auto
}

# Search for files
search() {
    find . -iname "*$@*" | less
}

# Get PIDs by process name
get_pids() {
    ps -ax | grep "$1" | grep -v 'grep' | awk '{print $1}'
}

# List SSH config
list_ssh() {
    cat ~/.ssh/config
}

# List keys in ~/.keys
list_keys() {
    ls -al ~/.keys/"$1"
}

# Download YouTube video as MP3
ytmp3() {
    yt-dlp "$1" -x --audio-format mp3
}

# Generate .gitignore from gitignore.io
gitignoreio() {
    curl --silent "https://www.toptal.com/developers/gitignore/api/$1" >> '.gitignore'
}

# Add multiple gitignore entries
gi() {
    for val in "$@"; do
        echo "Added $val .gitignore entries"
        gitignoreio "$val"
    done
}

# Quick temp note
tmpnote() {
    nvim ~/workspace/tmp/"$(date '+%Y-%m-%d-%H%M%S')".md
}

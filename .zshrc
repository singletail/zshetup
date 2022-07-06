### ENV
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color
export PATH=$HOME/bin:$PATH

### Config
ZPLUGINDIR=$HOME/.zsh/plugins

plugins=(
  romkatv/zsh-defer
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-completions
  rupa/z
  hlissner/zsh-autopair
  djui/alias-tips
  peterhurford/up.zsh
  #sindresorhus/pure
  zsh-users/zsh-syntax-highlighting
)

files=(
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/common-aliases/common-aliases.plugin.zsh
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/extract/extract.plugin.zsh
    https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/fzf/fzf.plugin.zsh
)

### Functions
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
    echo "Cloning mattmc3/zsh_unplugged"
    git clone https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged --quiet
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.plugin.zsh

function load-files () {
    local file_name dir_name
    for url in $@; do
        file_name=${${url##*/}%}
        dir_name="${ZPLUGINDIR:-$HOME/.zsh/plugins}/$file_name"

        if [[ ! -d $dir_name ]]; then
            mkdir -p $dir_name
        fi
        if [[ ! -f $dir_name/$file_name ]]; then
		    echo "--------- Downloading $url..."
            curl -sSL $url -o $dir_name/$file_name
        fi

        fpath+=$dir_name
        if (( $+functions[zsh-defer] )); then
            zsh-defer source $dir_name/$file_name
        else
            source $dir_name/$file_name
        fi
    done
}

### Run

autoload -U compinit
compinit

HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
HISTSIZE='128000'
SAVEHIST='128000'

plugin-load $plugins
load-files $files

### Fzf

echo "---------- Setting up FZF"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git || git ls-tree -r --name-only HEAD || rg --files --hidden --follow --glob '!.git' || find ."
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(bat --style=plain --color=always {} || cat {} || tree -NC {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --exact"
export FZF_ALT_C_OPTS="--preview 'tree -NC {} | head -200'"

### Alias
alias ls="ls --color"
alias python="python3"

# Prettify ls
#if (( $+commands[gls] )); then
#    alias ls='gls --color=tty --group-directories-first'
#fi

# Modern Unix Tools
# See https://github.com/ibraheemdev/modern-unix
#alias diff="delta"
#alias find="fd"
#alias grep="rg"

# MacOS: brew install bat
# Deb: wget https://github.com/sharkdp/bat/releases/download/v0.21.0/bat_0.21.0_amd64.deb
# Debian: sudo dpkg -i bat_0.21.0_amd64.deb
alias cat="bat"

### VCS 

autoload -Uz vcs_info
precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats '%b '
# zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "
# 
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr '-'
zstyle ':vcs_info:*' stagedstr '-'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       ' [-%b%u%c]'
zstyle ':vcs_info:git:*' actionformats ' [-%b|%a%u%c]'



### Prompt

### https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
### Colors: curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash

# %T (time)
# %m (short host - %M is full host)
# %n (username)
# %~ (abbreviated directory)

# Conditional:
# %(x.true-text.false-text)
# %(!.#.%%)  means # if root, % if not.
# black=0, white=255
# Colors - Bright - R=196 O=208 Y=226 G=46 B=21 V=93 C=51 P=201
# Colors - Medium - R=124 O=136 Y=184 G=40 B=19 V=55 C=39
# Reds - bright to dark - 196 160 124 88 52

# time/host/dir/vcs
# nonroot= blue-violet-pink-cyan
echo "---------- Setting up Prompt"
setopt PROMPT_SUBST

# Start
# foreground red-196 or blue-19
# %(!.%F{196}.%F{19})%f

# Time
# background red-196 or blue-19, foreground white
# %(!.%K{196}.%K{19})%F{255}%T%f

# Username
# change background to red-160/violet-55, foreground is prev bk 
# %(!.%F{196}%K{160}.%F{19}%K{55})%f
# %F{255}%n%k%f

# Host %m
# change background to red-124/pink-126, foreground is prev bk 
# %(!.%F{160}%K{124}.%F{55}%K{126})%f
# %F{255}%m%k%f

# Directory
# change background to red-88/cyan-32, foreground is prev bk 
# %(!.%F{124}%K{88}.%F{126}%K{32})%f
# %F{255}%~%k%f

# foreground to previous background, background to null
# %(!.%F{88}.%F{32})%f

# VCS info maybe
# background null, foreground red 124
# %F{124}%f
# %K{124}%F{255}${vcs_info_msg_0_}%k%f
# %F{124}%f

# %F{190}$B${vcs_info_msg_0_}%f

PROMPT='%(!.%F{196}.%F{19})%f%(!.%K{196}.%K{19})%F{255}%T%f%(!.%F{196}%K{160}.%F{19}%K{55})%f%F{255}%n%k%f%(!.%F{160}%K{124}.%F{55}%K{126})%f%F{255}%m%k%f%(!.%F{124}%K{88}.%F{126}%K{32})%f%F{255}%~%k%f%(!.%F{88}.%F{32})%f%F{190}$B${vcs_info_msg_0_}%f '

### Local customizations, e.g. theme, plugins, aliases, etc.
# [ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

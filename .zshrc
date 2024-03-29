# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/zsh/core/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

if [[ "$TERM" != "linux" ]] {
    ZSH_THEME="powerlevel10k/powerlevel10k"
} else {
    ZSH_THEME="powerlevel10ktty/powerlevel10ktty"
}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-navigation-tools copypath)
#. $ZSH/custom/plugins/zsh-mouse/zsh-mouse.zsh
# zle-toggle-mouse

source $ZSH/oh-my-zsh.sh
if [[ "gem which colorls" ]] { source $(dirname $(gem which colorls))/tab_complete.sh; gcolors="yes" }

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ru_RU.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nano'
# else
#   export EDITOR='gedit'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
zaliaseshelp="Installed aliases:\n      \"zreboot\": exec zsh, reboots the shell\n      \"zupdate\": runs the settings update script, should be run under sudo, recommended to use\"zupdate && zreboot\" construction\n        \"zaddx\": makes a target file executable\n     \"startmsg\": shows start message\n           \"lc\": shows the contents of a directory\n          \"lcl\": shows the contents of a directory in detailed mode\n          \"lcf\": find a file in active directory\n     \"zaliases\": shows this message"

autoload -Uz zmv
alias zaddx="chmod +x"
alias zreboot="exec zsh"
alias zupdate="/usr/share/zsh/core/FM-scripts/update-zsh-settings.sh"
alias startmsg="/usr/share/zsh/core/start_terminal_session.zsh"
alias lc="colorls -A --dark --sd"
alias lcl="colorls -lA --dark --sd"
alias lcf="colorls -lA --dark --sd | grep -i "
alias zaliases="echo -e \"$zaliaseshelp\""


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

if [[ "$TERM" == "linux" ]] {
    [[ ! -f /usr/share/zsh/core/.p10ktty.zsh ]] || source /usr/share/zsh/core/.p10ktty.zsh
} else {
    [[ ! -f /usr/share/zsh/core/.p10k.zsh ]] || source /usr/share/zsh/core/.p10k.zsh
}

#if [[  ]] {
	
#} else {

#}

#printf "$OPENMSG"
startmsg
if [[ -f "/usr/share/zsh/core/.cache/$(date +'%j%d%u%I%M')_checkfile" ]] {
    rm "/usr/share/zsh/core/.cache/$(date +'%j%d%u%I%M')_checkfile"
}

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

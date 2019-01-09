# path
export PATH="/user/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:${PATH}"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/mysql/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - zsh)"

# custom
# 履歴
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

function history-all { history -E 1 }

# gitの表示
autoload -Uz vcs_info
zstyle ":vsc_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "●|"
zstyle ":vsc_info:git:*" unstagedstr "○|"
zstyle ':vcs_info:git:*' formats '<%c%u%b>'
zstyle ':vcs_info:git:*' actionformats '<%b|%a>'
precmd () { vcs_info }
setopt prompt_subst

# プロンプト
# 左側
PROMPT='YUKI.N> '

# 右側
RPROMPT=$RPROMPT'%F{cyan}%C%f%F{red}${vcs_info_msg_0_}%f'

# 複数行
# PROMPT2=''

# emacs キーバインド
bindkey -e


# 色を使用
autoload -Uz colors
colors

# ディレクトリなどの選択している候補を塗りつぶす
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# 大文字小文字問わずマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# コマンドを間違えたときに、似たものを提案
setopt correct

# ps　コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 補完
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


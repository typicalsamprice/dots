# The following lines were added by compinstall
zstyle :compinstall filename '/home/sam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

alias ..='cd ..'
alias ...='cd ...'
alias ls='exa --color=always -a'

source "$HOME/.cargo/env"

autoload -Uz add-zsh-hook
setopt prompt_subst

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
add-zsh-hook precmd vcs_info

PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f$ '

export GIT_EDITOR="nvim"
export EDITOR="nvim"

export PATH="${PATH}:$HOME/.local/bin"

autoload zmv
alias vc='vorbiscomment'
alias rl='source ~/.zshrc'

vorbis_set_metadata() {
    TMPFILE=".vorbis_set_metadata.buffer"
    for file in "$@"; do
        touch "$TMPFILE"
        printf "language=eng\n" > "$TMPFILE" # Clobber, to reset
        printf "encoder=Lavc60.3.100 libvorbis\n" >> "$TMPFILE"
        # Figure out the following things
        file_no_ext="${file%.*}"
        extension="${file##*.}"
        file_formatted=$(sed 's/ - /-/' <<< "$file_no_ext")
        # Optionally rename the file
        printf "Possibly rename file (Currently [%s], press Return to keep name): " $file_no_ext
        read new_filename
        if [ "${new_filename}x" != "x" ]; then
            mv "$file" "${new_filename}.${extension}"
            file="${new_filename}"
            file_no_ext="${file%.*}"
            file_formatted=$(sed 's/ - /-/' <<< "$file_no_ext")
        fi
        awk -F- '{printf "artist=%s\ntitle=%s\n", $1, $2}' <<< "$file_formatted" >> "$TMPFILE"
        printf "genre=\nalbum=\ndate=\n" >> "$TMPFILE"
        nvim "$TMPFILE"
        vorbiscomment -w -c "$TMPFILE" "$file"
    done
    rm "$TMPFILE"
}

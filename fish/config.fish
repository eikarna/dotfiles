if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Global Variables
set -Ux TZ "Asia/Jakarta"
set -Ux GEMINI_API_KEY ""
set -Ux EDITOR "nvim"

# ===========================
# Fish config (ported from .bashrc)
# ===========================

# ----- HISTORY -----
set -Ux HISTSIZE 1000
set -Ux HISTFILESIZE 2000

# ----- LESSPIPE -----
if type -q lesspipe
    set -x LESSOPEN "| /usr/bin/lesspipe %s"
end

# ----- LS & GREP COLORS -----
if type -q dircolors
    eval (dircolors -c ~/.dircolors 2>/dev/null; or dircolors -c)
end
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# ----- LS Aliases -----
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# ----- Notify alias -----
alias alert='notify-send --urgency=low -i (test $status -eq 0; and echo terminal; or echo error) (history | tail -n1)'

# ----- PNPM -----
set -Ux PNPM_HOME "$HOME/.local/share/pnpm"
fish_add_path $PNPM_HOME

# ----- Bun -----
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# ----- fnm -----
set -Ux FNM_PATH "$HOME/.local/share/fnm"
if test -d $FNM_PATH
    fish_add_path $FNM_PATH
    fnm env --use-on-cd | source
end

function fish_prompt
    set -l last_status $status

    # Username@host (tampil hanya kalau root atau SSH)
    if test (id -u) -eq 0
        set_color red
        echo -n (whoami)"@"(hostname -s)" "
        set_color normal
    else if set -q SSH_TTY
        set_color cyan
        echo -n (whoami)"@"(hostname -s)" "
        set_color normal
    end

    # Current directory
    set_color green
    echo -n (prompt_pwd)
    set_color normal

    # Git branch (kalau ada)
    if type -q git
        set branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if test -n "$branch"
            set_color magenta
            echo -n "  $branch"
            set_color normal
        end
    end

    # Exit status indikator
    if test $last_status -ne 0
        set_color red
        echo -n " ✘($last_status)"
        set_color normal
    end

    echo -n " ❯ "
end

# PNPM Binary Path
fish_add_path ~/.local/share/pnpm

# Servers
alias bonito='ssh -X jyx@jyx.mooo.com'
alias fsdata='ssh -X jyx@jyxpi.mooo.com'
alias hackbox='ssh -X joakim.bech@hackbox.linaro.org'
alias mount_hackbox='sshfs joakim.bech@hackbox.linaro.org:/home/joakim.bech /home/jbech/mnt/hackbox'
alias people='ssh -X joakim.bech@people.linaro.org'
alias mount_people='sshfs joakim.bech@people.linaro.org:/home/joakim.bech /home/jbech/mnt/people'

# Tools
alias t='$HOME/bin/todo.sh'

# Git related alias
alias gb='git branch'
alias gs='git status'
alias grv='git remote -v'
alias gh_url="git remote -v | head -1 | awk '{print $2}' | sed -e 's/https:\/\/github.com\/\(.*\)/git@github.com:\1/g'"
alias review_tag="echo \"Reviewed-by: Joakim Bech <joakim.bech@linaro.org>\""

# Repo related alias
alias rpo_rev='repo forall -c '\''echo $REPO_PATH -- `git log --oneline -1`'\'''
alias rpo_clean_all="repo forall -c 'echo Cleaning ... \$REPO_PATH && git clean -xdf && git checkout -f'"
alias rpo_jbech='repo forall -c "git remote add jbech git@github.com:jbech-linaro/\$REPO_PATH.git"'

alias tmux='tmux -2'

# Cscope specific
alias cscopeme='find `pwd` -name "*.[chsS]" > cscope.files && cscope -b -q -k'
alias chfind='find . -name "*.[ch]"'

# Overriding standard flags
alias rgrep='grep -r --color'


# Functions
function mgrep()
{
	find . -name .repo -prune -o -name .git -prune -o -path ./out -prune -o -regextype posix-egrep -iregex '(.*\/Makefile|.*\/Makefile\..*|.*\.make|.*\.mak|.*\.mk)' -type f -print0 | xargs -0 grep --color -n "$@"
}

# Copy files to clipboard
alias file_to_clip="xclip -sel clip <"
alias tb="nc termbin.com 9999"

alias ll='ls -al'

alias nemo='nemo --no-desktop'

# If we're using globash, then change PS1 slightly
[ -n "$GHOME" ] && PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\n\$ '

# Add this to .bashrc or its equivalent
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

HGIT_ENVIRONMENT="GIT_WORK_TREE=~/ GIT_DIR=~/.dot-files.git"
alias h="${HGIT_ENVIRONMENT}"

hs() {
	h git status -uno
}

hkey() {
	remote=$1
	ssh $1 "mkdir -p ~/.ssh/"
	cat ~/.ssh/id_rsa.pub | ssh $1 "cat >> ~/.ssh/authorized_keys"
}

hinit() {
	remote=$1
	ssh $1 "${HGIT_ENVIRONMENT} mkdir -p ~/.dot-files.git"
	ssh $1 "${HGIT_ENVIRONMENT} git init"
        ssh $1 "${HGIT_ENVIRONMENT} git remote add origin https://github.com/jameswalmsley/dotfiles.git"
	ssh $1 "${HGIT_ENVIRONMENT} git fetch"
	ssh $1 "${HGIT_ENVIRONMENT} git checkout master $2"
}

hsync() {
	ssh $1 "${HGIT_ENVIRONMENT} git pull"
}

alias tmux="tmux -2 attach -d || tmux -2"

if [ -n "$(which nvim)" ]; then
	alias vim="nvim"
fi


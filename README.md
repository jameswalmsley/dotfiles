export GIT_WORK_TREE=$HOME 
export GIT_DIR=$HOME/develop/.dot-files.git
mkdir -p ~/develop/.dot-files.git
git init
git remote add origin https://github.com/jameswalmsley/dotfiles.git
git fetch
git checkout master


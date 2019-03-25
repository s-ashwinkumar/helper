alias be='bundle exec unicorn'
alias set_alias='vim ~/.bash_aliases;source ~/.bash_aliases'
alias start_dev='stash;codev;pulldev;spop'
alias stash='git stash'
alias spop='git stash pop'
alias pulldev='git pull origin development'
alias codev='git checkout development'
alias comas='git checkout master'
alias coqa='git checkout qa'
alias work_dir='cd /code'
function hotfix_from() { 
  git stash;
  REBASE_FROM=${1:-master}
  git checkout $REBASE_FROM;
  git pull origin $1;
  git checkout -b $2;
  git stash pop;
}
function last_commit () { git show --pretty="" --name-status; }
function rebase () { 
  git stash;
  git rebase -i HEAD~"$1";
  spop;
}
function rb_branch () {
  REBASE_FROM=${1:-development}
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git stash;
  git checkout $REBASE_FROM;
  git pull origin $REBASE_FROM;
  git checkout $CURRENT_BRANCH;
  git rebase $REBASE_FROM;
  git stash pop;
}
function force_push () {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git push origin -f $CURRENT_BRANCH
}

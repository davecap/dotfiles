export PATH=/usr/local/bin:~/.rvm/bin:$PATH
export CLICOLOR=1

source ~/.git-completion.bash

alias bh='git branch -a'
alias ct='git checkout'
alias cb='git checkout -b'
alias pl='git pull'
alias ph='git push'
alias pht='git push --tags'
alias me='git merge'
alias cm='git commit -a'
alias cms='git commit -s -a'
alias st='git status'
alias lg='git log'
alias gp='git grep'
alias di='git diff --ignore-space-change'
alias ada='git add . -A'
alias gf='git fetch --all'
alias gph='git push heroku master'
eval "$(hub alias -s)"

alias scr='screen -RAad'
alias ve='source venv/bin/activate'

if [ `whoami` = 'root' ]; then
PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[01;35m\]$(__git_ps1 "[%s]") \[\033[00m\]\$ '
else
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[01;35m\]$(vcprompt -f "[%b%m] ")\[\033[00m\]\$ '
fi

umask 022

alias delpyc='find ./ -type f -name "*.pyc" -exec rm -f {} \;'
alias l='ls -lsat'
alias fig='docker-compose'

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

# AWS config
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
# export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
# export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
# export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
# export AWS_IAM_HOME="/usr/local/Cellar/aws-iam-tools/1.5.0/jars"
# export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
export AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

export SOLVEBIO_LOGLEVEL="WARN"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

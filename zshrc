ZSH=$HOME/.oh-my-zsh
ZSH_DISABLE_COMPFIX=true

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful plugins for Rails development with Sublime Text
plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search zsh-autosuggestions)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

export PATH="/usr/local/opt/awscli@1/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"




alias tidal='cd; cd code/tidal'
alias gitAbortMerge='git merge --abort'
alias gitShowAssumeUnchanged="git ls-files -v | grep '^[a-z]' | cut -c3-"
alias gitdUntrackAllUnTrackedFiles="git ls-files -v | grep '^[a-z]' | cut -c 3- | tr '\012' '\000' | xargs -0 git update-index --no-assume-unchanged"
alias gitRefreshPrune="git remote prune origin"



alias awsTidalLogin="saml2aws login --session-duration=43200"
alias awsTidalLogin2="aws-google-auth -u clement.boret@tidal.com -S 1042655796932 -I C00itggk3 -R us-east-1 -d 43200 -p default"
alias awsTidalStage="aws --profile stage "
alias awsTidalProd="aws --profile prod "
alias awsTidalSshStage="aws --profile stage ssm start-session --target "
alias awsTidalSshProd="aws --profile prod ssm start-session --target "
stagessh() {
   ssh -i ~/.ssh/stage.pem ubuntu@$@
}

prodssh() {
   ssh -i ~/.ssh/tidal-us-east-1-2.pem ubuntu@$@
}

dockerLog() {
   docker logs -f $@
}

alias awsAssumeRole="~/.aws/assume-role"




alias beyondCompareReset="rm Library/Application\ Support/Beyond\ Compare/registry.dat;"




source ~/.tidal-dotfiles/main.sh
source ~/.dotfiles/javasetup
source ~/.dotfiles/mavensetup
source ~/.dotfiles/npmsetup
source ~/.dotfiles/dockersetup
source ~/.dotfiles/gcloudsetup





bindkey '^ ' autosuggest-execute
bindkey '^x' autosuggest-clear



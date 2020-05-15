ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful plugins for Rails development with Sublime Text
plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search)

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


# docker kill containers that are running;
alias dockerKillAll='docker kill $(docker ps -q)'

# docker delete containers that are not running
alias dockerRmAll='docker rm $(docker ps -a -q)'

# docker kill and delete containers
alias dockerClean='dockerKillAll;dockerRmAll;'
alias dclsl='dockerClean; ./local_docker.sh start'

alias dockerRmAllImages='docker rmi -f $(docker images -a -q)'

stagessh() {
   ssh -i ~/.ssh/stage.pem ubuntu@$@
}

prodssh() {
   ssh -i ~/.ssh/tidal-us-east-1-2.pem ubuntu@$@
}

dockerLog() {
   docker logs -f $@
}

alias mvnci='mvn -T 4 clean install'
alias mvncint='mvnci -Dmaven.test.skip=true -DUT.skip=true -DIT.skip=true'
alias tidal='cd; cd code/tidal'
alias gitAbortMerge='git merge --abort'
alias gitShowAssumeUnchanged="git ls-files -v | grep '^[a-z]' | cut -c3-"
alias gitdUntrackAllUnTrackedFiles="git ls-files -v | grep '^[a-z]' | cut -c 3- | tr '\012' '\000' | xargs -0 git update-index --no-assume-unchanged"
alias gitRefreshPrune="git remote prune origin"

alias mvnSetVersion='mvn org.codehaus.mojo:versions-maven-plugin:2.7:set -DprocessAllModules=true -DgenerateBackupPoms=false'
alias mvnSetVersionNotAll='mvn org.codehaus.mojo:versions-maven-plugin:2.7:set -DgenerateBackupPoms=false'
alias mvnUpdateTidalVersions='mvn org.codehaus.mojo:versions-maven-plugin:2.7:update-properties -Dincludes=com.tidal\*:\*,com.wimp\*:\* -DallowSnapshots=true -DgenerateBackupPoms=false;mvn org.codehaus.mojo:versions-maven-plugin:2.7:use-latest-versions -Dincludes=com.tidal\*:\*,com.wimp\*:\* -DallowSnapshots=true -DgenerateBackupPoms=false'
alias mvnUpdateAllVersions='mvn org.codehaus.mojo:versions-maven-plugin:2.7:update-properties -DgenerateBackupPoms=false; mvn org.codehaus.mojo:versions-maven-plugin:2.7:use-latest-versions -DgenerateBackupPoms=false'
alias mvnUpdateCboOnlyVersions='mvn org.codehaus.mojo:versions-maven-plugin:2.7:update-properties -DgenerateBackupPoms=false -DprocessParent=true -DexcludeReactor=false -Dincludes=com.cbo\*:\*; mvn org.codehaus.mojo:versions-maven-plugin:2.7:use-latest-versions -DgenerateBackupPoms=false -DprocessParent=true -DexcludeReactor=false -Dincludes=com.cbo\*:\*'
alias mvnList="mvn fr.jcgay.maven.plugins:buildplan-maven-plugin:list"

# alias changeUsrLocal='sudo chown -R $(whoami):admin /usr/local'
alias switchToPython2='unlink /usr/local/bin/python; ln -s /usr/local/Cellar/python@2/2.7.15_1/bin/python /usr/local/bin/python;'
alias switchToPython3='unlink /usr/local/bin/python; ln -s /usr/local/Cellar/python/3.6.4_3/bin/python /usr/local/bin/python;'

alias awsTidalLogin="saml2aws login --session-duration=43200"
alias awsTidalStage="aws --profile stage "
alias awsTidalProd="aws --profile prod "
alias awsTidalSshStage="aws --profile stage ssm start-session --target "
alias awsTidalSshProd="aws --profile prod ssm start-session --target "

alias awsAssumeRole="~/.aws/assume-role"




















































































source ~/.javasetup
source ~/.npmsetup













export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

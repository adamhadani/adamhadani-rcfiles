#
# adamhadani's console aliases / definitions
#

alias mod="if [ -e '.svn' ]; then svn stat; else git status; fi"


###### Git aliases #######

# Commit
alias gcm="git commit -a -m"
# Push master to origin 
alias gpush="git push origin master"
# Pull master from origin
alias gpull="git pull origin master"

# usage of this file: . prof

# NOTE THE DOT IS REQUIRED - don't call as just "prof"

# reloads the PowerShell profile to pick up any new changes without restarting the terminal
# put this prof.ps1 file at C:\Users\<YOUR-USER-NAME>\.local\bin\prof.ps1
# this is the ps version of: alias bas='source ~/.bash_profile' # so aliases in .bash_profile update and become available
# you still have to start a new PS terminal to reflect a deleted command if you delete a command from C:\Users\<YOUR-USER-NAME>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
. $PROFILE

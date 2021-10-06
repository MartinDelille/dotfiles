#Invoke-BatchFile 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsx86_amd64.bat'

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}
## Dracula Prompt Configuration
#$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
#$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
#$GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
#$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
#$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
#$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
#$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
#$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue

Set-Alias which get-command
Set-Alias l ls
Set-Alias m jom
Set-Alias o ii

Function d { Set-Location -Path ~/dev/md/dotfiles }
Function j { Set-Location -Path ~/dev/phonations/core }
Function cci { Set-Location -Path ~/dev/clone/conan-center-index/recipes }
Function lmb { lab mr b }
Function glom { git log --oneline --decorate --color master.. $args }
Function grbmi { git rebase master --interactive }
Function grbmia { git rebase master --interactive --autosquash }
Function gcfx($sha) { git commit --fixup $sha }
Function gsuri { git submodule update --recursive --init }
Function ghprb { gh pr view --web }
Function mcd ($path) { md $path;cd $path }
Function qtlog { vi ~/AppData/Local/QtProject/qtlogging.ini }

~/.secret.ps1

Function pong ($message = "pong") {
  python $Env:MATTERMOST_SCRIPT $Env:MATTERMOST_BOT_USER $Env:MATTERMOST_BOT_PASSWORD $Env:MATTERMOST_CHANNEL $message
}

Import-Module posh-git

$Env:CONAN_TRACE_FILE = "C:\Users\marti\dev\clone\conan-center-index\recipes\log.txt"
$Env:CONAN_PRINT_RUN_COMMANDS  = 1

cd ~

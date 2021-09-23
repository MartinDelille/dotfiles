Invoke-BatchFile 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsx86_amd64.bat'

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

Function d {
  Set-Location -Path ~/dev/md/dotfiles
}

Function cci {
  Set-Location -Path ~/dev/clone/conan-center-index/recipes
}

Function mcd ($path) {
  md $path;cd $path
}

Import-Module posh-git

$Env:CONAN_TRACE_FILE = "C:\Users\marti\dev\clone\conan-center-index\recipes\log.txt"
$Env:CONAN_PRINT_RUN_COMMANDS  = 1

cd ~

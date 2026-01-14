Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+f -Function AcceptSuggestion

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

Set-Alias which get-command
Set-Alias l ls
Set-Alias m make
Set-Alias o ii
Set-Alias trash Remove-ItemSafely
if(Get-Command nvim) {
  Set-Alias v nvim
  Set-Alias vi nvim
}

Function x { exit 0 }
Function c ($path) { Set-Clipboard ((Get-Item $path).FullName) }
Function cr ($path) { Set-Clipboard (Get-Item $path | Resolve-Path -Relative) }
Function d { Set-Location -Path ~/dev/md/dotfiles }
Function j { Set-Location -Path ~/dev/phonations/core }
Function cci { Set-Location -Path ~/dev/clone/cci/recipes }
Function adm { Set-Location -Path ~/dev/atelier/atelierdesmedias.github.io }
Function hex($file) { hexdump -C $file | more }
Function ghprb { gh pr view --web }
Function mcd ($path) { md $path;cd $path }
Function qtlog { vi $Env:QT_LOGGING_FILE }
Function say ($content) { (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak($content)}
Function kw {
  $success = $?
  Add-Type -AssemblyName System.Speech
  $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
  if($success) {
    $speak.Speak("done")
  } else {
    $speak.Speak("bad")
  }
}
Function lmb { lab mr b }
Function lcv { lab ci view }
Function lci { sleep 1; lab ci trace; say (git describe --all) }
Function q { Invoke-Item "C:\Qt\Tools\QtCreator\bin\qtcreator.exe" }
Function oc { opencode }

~/.secret.ps1

Function pong ($message = "pong") {
  python $Env:MATTERMOST_SCRIPT $Env:MATTERMOST_BOT_USER $Env:MATTERMOST_BOT_PASSWORD $Env:MATTERMOST_CHANNEL $message
}

Function pongf ($file) {
  python $Env:MATTERMOST_SCRIPT $Env:MATTERMOST_BOT_USER $Env:MATTERMOST_BOT_PASSWORD $Env:MATTERMOST_CHANNEL $file $file
}

Import-Module git-aliases -DisableNameChecking
Import-Module posh-git

Function glom {
  $MainBranch = Get-Git-MainBranch
  git log --oneline --decorate --color "${MainBranch}.." $args
}
Function grbmi {
  $MainBranch = Get-Git-MainBranch
  git rebase $MainBranch --interactive
}
Function grbmia {
  $MainBranch = Get-Git-MainBranch
  git rebase $MainBranch --interactive --autosquash
}
Function gcfx($sha) { git commit --fixup $sha }
Function gsuri { git submodule update --recursive --init }

Function hd($file) { hexdump -C $file | more }

$Env:CONAN_PRINT_RUN_COMMANDS  = 1
cd ~/dev/phonations/core

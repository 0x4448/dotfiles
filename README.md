# dotfiles

Track my dotfiles using a [bare repo](https://www.atlassian.com/git/tutorials/dotfiles).


## Installation

### Windows PowerShell
```powershell
Set-Location $env:USERPROFILE
Set-Content .gitignore .dotfiles
git clone --bare https://github.com/0x4448/dotfiles .dotfiles

function config {
    & git --git-dir="$env:USERPROFILE\.dotfiles\" --work-tree="$env:USERPROFILE" @args
}

config checkout --force
config config status.showUntrackedFiles no

New-Item -ItemType HardLink -Path "$env:APPDATA\Code\User\settings.json" -Target ".config\Code\User\settings.json"
```

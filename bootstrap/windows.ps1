Set-Location $env:USERPROFILE
Set-Content .gitignore .dotfiles
git clone --bare https://github.com/0x4448/dotfiles .dotfiles

function config {
    & git --git-dir="$env:USERPROFILE\.dotfiles\" --work-tree="$env:USERPROFILE" @args
}

config checkout --force
config config status.showUntrackedFiles no

$VSCodeDir = "$env:APPDATA\Code\User"
if (-not (Test-Path "$VSCodeDir")) {
    New-Item -Type Directory "$VSCodeDir"
}

New-Item -ItemType HardLink -Path "$VSCodeDir\settings.json" -Target ".config\Code\User\settings.json"

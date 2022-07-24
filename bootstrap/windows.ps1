Set-Location $env:USERPROFILE
Set-Content .gitignore .dotfiles
git clone --bare https://github.com/0x4448/dotfiles .dotfiles

function dotfiles {
    Set-Item -Path "Env:\GIT_DIR" -Value "$HOME/.dotfiles/"
    Set-Item -Path "Env:\GIT_WORK_TREE" -Value "$HOME/"

    $Executable = (-Split $Args)[0]
    $Args = ($Args -Replace "^$Executable", "")
    & "$Executable" @Args

    Remove-Item -Path "Env:\GIT_DIR"
    Remove-Item -Path "Env:\GIT_WORK_TREE"
}

dotfiles git checkout --force
dotfiles git config status.showUntrackedFiles no

$VSCodeDir = "$env:APPDATA\Code\User"
if (-not (Test-Path "$VSCodeDir")) {
    New-Item -Type Directory "$VSCodeDir"
}

New-Item -ItemType HardLink -Path "$VSCodeDir\settings.json" -Target ".config\Code\User\settings.json"

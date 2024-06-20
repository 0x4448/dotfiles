function config {
    & git --git-dir="$env:USERPROFILE\.dotfiles\" --work-tree="$env:USERPROFILE" @args
}

function Enable-WSLForward {
    Get-NetIPInterface | `
    where {$_.InterfaceAlias -eq 'vEthernet (WSL)' -or $_.InterfaceAlias -eq 'vEthernet (Default Switch)'} | `
    Set-NetIPInterface -Forwarding Enabled
}

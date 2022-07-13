function config {
    & git --git-dir="$env:USERPROFILE\.dotfiles\" --work-tree="$env:USERPROFILE" @args
}

param(
    # overwrite upstream param
    [String]$upstream = "ScoopInstaller/Main:master"
)

if(!$env:SCOOP_HOME) { $env:SCOOP_HOME = resolve-path (split-path (split-path (scoop which scoop))) }
$autopr = "$env:SCOOP_HOME/bin/auto-pr.ps1"
$dir = "$psscriptroot/.." # checks the parent dir
Invoke-Expression -command "$autopr -dir $dir -upstream $upstream $($args | ForEach-Object { "$_ " })"

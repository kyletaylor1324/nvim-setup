function add {
    param(
        [string]$Name,
        [string]$Value
    )
    $filePath = "$env:USERPROFILE\.$Name"
    $list = (@($Value) + (Get-Content $filePath -ErrorAction SilentlyContinue) | Select-Object -Unique)
    $list | Set-Content $filePath
    return $list
}

function get {
    param([string]$Name)
    $filePath = "$env:USERPROFILE\.$Name"
    if (Test-Path $filePath) {
        return Get-Content $filePath
    }
    return @()
}

function getPath {
    param([string]$Name)
    return "$env:USERPROFILE\.$Name"
}

function cdf {
    param([int]$Depth = 2)
    
    $directory = Get-ChildItem -Directory -Recurse -Depth $Depth | Select-Object -ExpandProperty FullName | fzf
    
    if ($directory) {
        add "dirhistory" $directory
        Set-Location $directory
    }
}

function cdh {
    $selected =  get "dirhistory" | fzf
    if ($selected) {
        Set-Location $selected
    }
}

function kill-all {
    Get-Process -Name node,powershell | Stop-Process
}

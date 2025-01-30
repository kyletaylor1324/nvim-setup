function nvim {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Paths
    )

    $HostPath = if ($Paths) { 
        (Resolve-Path -Path $Paths[0]).Path 
    } else { 
        (Get-Location).Path 
    }

    docker run -it --rm `
        -v "${HostPath}:/workspace" `
        -v nvim-data:/root/.local/share/nvim `
        -v nvim-config:/root/.config/nvim `
        nvim
}
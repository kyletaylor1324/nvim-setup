scoop install neovim
scoop install tree-sitter
scoop install ripgrep
scoop install lazygit
scoop install gdu
scoop install bottom
scoop install python
scoop install nvm
nvm install lts 
scoop install gcc


Copy-Item -Path "./config/nvim/" -Destination "$env:LOCALAPPDATA" -Recurse
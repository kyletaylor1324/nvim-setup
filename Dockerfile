FROM alpine:edge

# Install dependencies
RUN apk update && apk add --no-cache \
    bash git neovim nodejs npm python3 \
    ripgrep lazygit bottom fzf gcc make \
    curl go lua

# Configure AstroNvim
RUN mkdir -p /root/.config/nvim && \
    git clone --depth 1 \
    https://github.com/AstroNvim/template \
    /root/.config/nvim

RUN mkdir -p /root/.config/lazygit 


WORKDIR /workspace
ENTRYPOINT ["nvim"] 

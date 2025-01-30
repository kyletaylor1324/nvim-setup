FROM alpine:edge

# Install dependencies
RUN apk update && apk add --no-cache \
    bash git neovim nodejs npm python3 \
    ripgrep lazygit bottom fzf gcc make \
    curl go lua

# Configure
COPY /config /root/.config

WORKDIR /workspace
ENTRYPOINT ["nvim"] 
 
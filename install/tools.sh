#!/bin/zsh

# Make sure profile is loaded
source $HOME/.zshrc

# Install the SDKs
echo "Checking for SDKs"
install_latest rust asdf-community/asdf-rust
cargo install ripgrep # for neovim searches
cargo install fd-find # for neovim searches
cargo install tree-sitter-cli # for neovim tree-sitter plugin
install_latest python asdf-community/asdf-python
pip install compiledb # for generating compilation database
pip install boto3 # for aws sdk access
install_latest ruby asdf-vm/asdf-ruby
install_latest nodejs asdf-vm/asdf-nodejs
npm install -g @devcontainers/cli # for devcontainer api
install_latest lua Stratus3D/asdf-lua
install_latest golang kennyp/asdf-golang

# Install AWS Cli
if ! [ -f /usr/local/bin/aws ]; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip -q awscliv2.zip \
    && ./aws/install
fi

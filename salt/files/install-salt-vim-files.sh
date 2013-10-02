#!/bin/bash
git clone https://github.com/saltstack/salt-vim.git
if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
fi
cp -r salt-vim/* ~/.vim/.

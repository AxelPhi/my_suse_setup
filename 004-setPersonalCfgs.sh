#! /bin/bash

echo Start setting up personal config.

echo Setting up bash ...
cp -r assets/bash ~/.bash
cat >> ~/.bashrc <<EOF
# Add local bash additions
if [ -d ~/.bash ]; then
    . ~/.bash/prompt.sh
fi
EOF

echo Setting up git ...
cp assets/gitconfig ~/.gitconfig

echo Done setting up personal config.

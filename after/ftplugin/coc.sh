#!/bin/bash

# TODO (after initializing neovim)
# for tailwindcss autocompletion
# https://github.com/yaegassy/coc-tailwindcss3
# Run :CocInstall yaegassy/coc-tailwindcss3

# Check if npm is installed
if ! command -v npm &> /dev/null; then

  echo "Error: npm is not installed. Please install Node.js/npm before running this script."
  exit 1
fi

# Install @yaegassy/coc-tailwindcss3 globally
npm install -g @yaegassy/coc-tailwindcss3

# Check if installation was successful
if [ $? -eq 0 ]; then
  echo "Installation successful."
else
  echo "Error: Installation failed."
  exit 1
fi

exit 0

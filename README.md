### Introduction

A starting point for Neovim that is:

- Small
- Single-file (with examples of moving to multi-file)
- Documented
- Modular

This repo is meant to be used by **YOU** to begin your Neovim journey; remove the things you don't use and add what you miss.

This repo is a fork of Kickstart.nvim that targets _only_ the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim. If you are experiencing issues, please make sure you have the latest versions.

### Installation

> **NOTE** > Backup your previous configuration (if any exists)

Requirements:

- Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  - [xclip](https://linuxconfig.org/how-to-use-xclip-on-linux) is required for the clipboard to work properly.
  - [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.
  - [build-essential](https://phoenixnap.com/kb/install-gcc-ubuntu) for gcc and clang tools
  - [nodejs and NPM](https://nodejs.org/en) for typescript server and prettier
  - [stylua](https://github.com/JohnnyMorganz/StyLua) for formatting lua files. Can be installed easily with Rust's Cargo package manager

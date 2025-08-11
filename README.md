### Introduction

A starting point for Neovim that is:

- Small
- Documented
- Modular

This repo is meant to be used by **YOU** to begin your Neovim journey; remove the things you don't use and add what you miss.

This repo is a fork of Kickstart.nvim that targets _only_ the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim. If you are experiencing issues, please make sure you have the latest versions.

### Installation

> **NOTE** > Backup your previous configuration (if any exists)

Requirements:

- Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  - [xclip](https://linuxconfig.org/how-to-use-xclip-on-linux) is required for the clipboard to work properly.
  - [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [mini.pick](https://github.com/echasnovski/mini.pick) pickers.
  - [build-essential](https://phoenixnap.com/kb/install-gcc-ubuntu) like gcc and stuff
  - [nodejs and NPM](https://nodejs.org/en) for typescript server and prettierd
  - [Golang](https://go.dev/doc/install) for golang server and formatting/linting tools
  - [stylua](https://github.com/JohnnyMorganz/StyLua) for formatting lua files. Can be installed easily with Rust's Cargo package manager

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = { __default = "// %s", __multiline = "/* %s */" },
    },
  },
  auto_install = true,
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "yaml",
    "toml",
    "bash",
    "json",
    "jsonc",
    "lua",
    "tsx",
    "typescript",
    "prisma",
    "markdown",
    "vim",
    "vimdoc",
    "gitignore",
    "gitcommit",
    "diff",
    "sql",
    "dockerfile",
    "xml",
    "tmux",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>vv",
      node_incremental = "+",
      scope_incremental = false,
      node_decremental = "_",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = { query = "@function.outer", desc = "around a function" },
        ["if"] = { query = "@function.inner", desc = "inner part of a function" },
        ["ac"] = { query = "@class.outer", desc = "around a class" },
        ["ic"] = { query = "@class.inner", desc = "inner part of a class" },
        ["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
        ["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
        ["al"] = { query = "@loop.outer", desc = "around a loop" },
        ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
        ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
        ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
      },
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@parameter.inner"] = "v", -- charwise
        ["@function.outer"] = "v", -- charwise
        ["@conditional.outer"] = "V", -- linewise
        ["@loop.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_previous_start = {
        ["[f"] = { query = "@function.outer", desc = "Previous function" },
        ["[c"] = { query = "@class.outer", desc = "Previous class" },
        ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
      },
      goto_next_start = {
        ["]f"] = { query = "@function.outer", desc = "Next function" },
        ["]c"] = { query = "@class.outer", desc = "Next class" },
        ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
})

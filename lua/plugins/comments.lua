require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
    end,
  },
  hooks = {
    pre = function()
      require("ts_context_commentstring.internal").update_commentstring({})
    end,
  },
})

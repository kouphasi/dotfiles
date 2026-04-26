return {
  cmd = { "copilot-language-server", "--stdio" },
  filetypes = { "*" },
  root_dir = function(_, cb)
    cb(vim.fn.getcwd())
  end,
  settings = {
    github = {
      copilot = {
        enable = { ["*"] = true },
        inlineSuggest = { enable = true },
      },
    },
  },
}

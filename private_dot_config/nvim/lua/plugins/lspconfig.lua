return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- TOML
        taplo = {
          root_dir = function(fname)
            local lspconfig = require("lspconfig")
            return lspconfig.util.root_pattern("taplo.toml", ".git")(fname) or vim.loop.os_homedir()
          end,
        },
      },
    },
  },
}

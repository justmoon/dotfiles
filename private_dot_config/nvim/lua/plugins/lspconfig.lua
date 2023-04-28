local util = require("lspconfig").util

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
            return util.root_pattern("taplo.toml", ".git")(fname) or vim.loop.os_homedir()
          end,
        },
        -- ESLint
        eslint = {
          root_dir = function(fname)
            return util.root_pattern("pnpm-workspace.yaml")(fname)
              or util.root_pattern("turbo.json")(fname)
              or util.root_pattern(".git")(fname)
              or util.root_pattern("package.json")(fname)
              or util.root_pattern(".eslintrc.js")(fname)
          end,
        },
        -- TypeScript
        tsserver = {
          root_dir = function(fname)
            return util.root_pattern("pnpm-workspace.yaml")(fname)
              or util.root_pattern("turbo.json")(fname)
              or util.root_pattern("tsconfig.base.json")(fname)
              or util.root_pattern(".git")(fname)
              or util.root_pattern("package.json")(fname)
              or util.root_pattern("tsconfig.json")(fname)
              or util.root_pattern("jsconfig.json")(fname)
          end,
        },
      },
    },
  },
}

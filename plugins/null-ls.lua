return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.autopep8.with({ extra_args = { "--max-line-length", "120" } }),
      null_ls.builtins.diagnostics.flake8.with({ extra_args = { "--max-line-length", "120" } })
    }
    return config -- return final config table
  end,
}

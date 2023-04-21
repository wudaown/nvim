return {
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = function()
      require('code_runner').setup({
        -- put here the commands by filetype
        filetype = {
          python = "python3 -u",
          go = "go run",
        },
        startinsert = true,
        mode = "float",
        float = {
          -- Window border (see ':h nvim_open_win')
          border = "rounded",
          -- Num from `0 - 1` for measurements
          height = 0.8,
          width = 0.8,
          x = 0.5,
          y = 0.5,
          -- Highlight group for floating window/border (see ':h winhl')
          border_hl = "FloatBorder",
          float_hl = "Normal",
          -- Transparency (see ':h winblend')
          blend = 0,
        }
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = "v2",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  }
}

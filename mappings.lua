-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<S-h>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc =
    "Previous buffer" },
    ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc =
    "Next buffer" },
    ["<leader>h"] = { "<cmd>HopChar1<cr>", desc = "Hop Char" },
    ["<leader>a"] = { "<cmd>Telescope aerial<cr>", desc = "Show Symbols" },
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    ["<leader>r"] = { "<cmd>RunCode<cr>", desc = "Code runner" },
    ["<leader>o"] = { "<cmd>AerialToggle<cr>", desc = "AerialToggle" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  i = {
    ["<C-L>"] = {'copilot#Accept("<CR>")', desc = "Copilot accept", noremap = true, silent = true, expr=true, replace_keycodes = false},
  }
}

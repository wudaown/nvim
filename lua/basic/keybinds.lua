-- 默认的键位设置函数太长了，所以这里将它们重新引用一下
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = { noremap = true, silent = true }
}


-- 用 H 和 L 代替 ^ 与 $
-- vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
-- vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
-- vim.keybinds.gmap("v", "L", "$", vim.keybinds.opts)


-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<A-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<A-l>", "<right>", vim.keybinds.opts)

-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)

function _G.CloseBufferNvimTreeAware()
    local t = vim.bo.filetype
    if t == "NvimTree" then
        vim.cmd(":NvimTreeClose")
        vim.cmd(":bdelete!")
        vim.cmd(":NvimTreeOpen")
    else
        vim.cmd(":bdelete!")
    end
    -- local input_status = tonumber(vim.fn.system("fcitx-remote"))
    -- if input_status == 2 then
    --     vim.fn.system("fcitx-remote -c")
    -- end
end

vim.keybinds.gmap("n", "<C-P>", "<C-W>w<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-W>", ":lua CloseBufferNvimTreeAware() <CR>", vim.keybinds.opts)

vim.keybinds.gmap("n", "<F6>", ":lua require('dap').continue()<CR>", vim.keybinds.opts)

-- ToggleTerm
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- Remove search focus
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Swap split focus
vim.keymap.set("n", "<S-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<S-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<S-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<S-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- Swap tmux windows focus
-- vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "move focus to the left window" })
-- vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "move focus to the right window" })
-- vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "move focus to the lower window" })
-- vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "move focus to the upper window" })

-- Navigate between buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-w>", ":bd<CR>", { noremap = true, silent = true })

-- highlight when yanking (copying) text
--  see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("textyankpost", {
  desc = "highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

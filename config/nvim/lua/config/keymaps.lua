-- -- lua/config/keymaps.lua
vim.g.mapleader = ","

local map = vim.keymap.set

-- -- Better ESC in insert mode
map("i", "kj", "<Esc>", { desc = "Exit insert mode" })

-- Typo fixes
 map("c", "W", "w", { noremap = true })
 map("c", "WQ", "wq")
 map("c", "Wq", "wq")
 map("c", "Wqa", "wqa")
 map("c", "WQa", "wqa")
 map("c", "wQa", "wqa")
 map("c", "wqA", "wqa")


-- -- Command mode
map("n", "<leader>/", ":nohlsearch<CR>", { silent = true })

-- Git shortcuts
map("n", "<leader>`", ":!git diff<cr>", { silent = true })
map("n", "<leader>1", ":!git status<cr>", { silent = true })
map("n", "<leader>2", ":!git log<cr>", { silent = true })
map("n", "<leader>3", ":!git add %<cr>", { silent = true })
map("n", "<leader>4", ":!git add .<cr>", { silent = true })
map("n", "<leader>5", ":!git commit<cr>", { silent = true })
map("n", "<leader>6", ":!git diff origin/master<cr>", { silent = true })
map("n", "<leader>7", ":!git diff master<cr>", { silent = true })
map("n", "<leader>8", ":!git checkout master<cr>", { silent = true })
map("n", "<leader>9", ":!git branch -v<cr>", { silent = true })
map("n", "<leader>0", ":!git stash pop<cr>", { silent = true })
map("n", "<leader>-", ":!git stash<cr>", { silent = true })
map("n", "<leader>=", ":!git push origin HEAD<cr>", { silent = true })

-- Pane navigation
 map("n", "<C-h>", "<C-w>h")
 map("n", "<C-j>", "<C-w>j")
 map("n", "<C-k>", "<C-w>k")
 map("n", "<C-l>", "<C-w>l")

-- Punish arrow key usage
for _, key in ipairs({ "<Left>", "<Right>", "<Up>", "<Down>" }) do
  map("n", key, ':echo "Shame on you."<CR>')
end

-- Filetree
map("n", "<leader>t", function()
  local oil = require("oil")
  local is_oil = vim.bo.filetype == "oil"
  if is_oil then
    vim.cmd.bdelete() -- Close Oil buffer
  else
    oil.open()
  end
end, { desc = "Toggle Oil file explorer" })

-- Toggle line or block comment
map("n", "<leader>c", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })

map("v", "<leader>c", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment" })


-- Live grep
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

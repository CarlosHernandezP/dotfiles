local opts = {
  noremap = true,  -- Don't allow for recursive mappings
  silent = true   -- Execute command silently
}
local keymap = vim.api.nvim_set_keymap

-- The almighty leader
keymap("", "<Space>", "<Nop", opts) -- Dissable initial use of <Space>
vim.g.mapleader = " "       -- Sets the almighty leader
vim.g.maplocalleader = " "  -- Setting <leader> for mappings local to a buffer

-- Quality of life {{{
-- Better split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab navigation
keymap("n", "H", ":tabprevious<cr>", opts)
keymap("n", "L", ":tabnext<cr>", opts)

-- Window resizing
keymap("n", "<C-Up>", ":resize -1<cr>", opts)
keymap("n", "<C-Down>", ":resize +1<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize +1<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize -1<cr>", opts)

-- Keep visual selection while indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Remove current search highlight
keymap("n", "<leader>h", ":nohlsearch<cr>", opts)

keymap("n", "<C-s><C-s>", ":w<cr>", {noremap=true})
keymap("i", "<C-s><C-s>", "<esc>:w<cr>", {noremap=true})
keymap("v", "<C-s><C-s>", "<esc>:w<cr>i", {noremap=true})

-- Open and resource init.lua
keymap("n", "<leader>ev", ":lua require'telescope.builtin'.find_files({cwd='~/.config/nvim/lua'})<cr>", {noremap=true})
keymap("n", "<leader>df", ":lua require'telescope.builtin'.find_files({cwd='~/.config'})<cr>", {noremap=true})
keymap("n", "<leader>r", ":source %<cr>", {noremap=true})

-- toggle wrap
keymap("n", "<leader>tw", ":set wrap!<cr>", opts)
-- }}}

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>fe", ":NvimTreeFindFileToggle<cr>", opts)

keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)
keymap("n", "<C-b>", ":Telescope buffers<CR>", opts)
keymap("n", "<C-h>", ":Telescope help_tags<CR>", opts)
keymap("n", "<C-g>", ":Telescope git_branches<CR>", opts)
keymap("n", "<c-l>", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>ds", ":Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>tt", ":TroubleToggle<CR>", opts)


keymap("n", "<leader>ga", ":Git add %:p<CR>", opts)
keymap("n", "<leader>gs", ":Git<CR>", opts)
keymap("n", "<leader><leader>gs", ":Gtabedit :<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)

keymap("n", "<leader>hs", ":lua require('gitsigns').preview_hunk()<CR>", opts)
keymap("n", "<leader>hn", ":lua require('gitsigns').next_hunk({wrap = true})<CR>", opts)
keymap("n", "<leader>hp", ":lua require('gitsigns').prev_hunk({wrap = true})<CR>", opts)

keymap("n", "<leader>gg", ":Goyo<CR>", opts)

keymap("n", "<c-w><c-w>", ":VimwikiTabIndex<CR>", opts)
keymap("n", "<c-w><c-w>", ":VimwikiTabIndex<CR>", opts)
keymap("n", "<leader><leader>p", ":!pandoc -t beamer ~/dotfiles/nvim/pandoc_header % --from=markdown --output=%:r.pdf", {noremap = true})

-- Spelling
keymap("n", "<leader>ss", ":setlocal spell!<cr>", opts)
-- Shortcuts:
-- Go to next/previous highlighted word (n, p)
keymap("n", "<leader>sn", "]s", opts)
keymap("n", "<leader>sp", "[s", opts)
-- Add to dictionary
keymap("n", "<leader>sa", "zg", opts)
keymap("n", "z=", ":lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor())<cr>", opts)

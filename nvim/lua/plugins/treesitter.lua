local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup({
  ensure_installed="all",
  syn_install=false,
  highlight = {
    enable = true, -- Otherwise extension will be disabled
    disable = {""}, -- list of languages to disable
    additional_vim_regex_highlighting=true,
  },
  indent = {enable = true},
  rainbow = {enable = true}
})

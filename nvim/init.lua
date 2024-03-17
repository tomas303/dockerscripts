
-- from https://bryankegley.me/posts/nvim-getting-started/

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.relativenumber = true
wo.signcolumn = 'yes'
wo.wrap = false

vim.g.mapleader = ' '


local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')




local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- add you plugins here like:
  -- use 'neovim/nvim-lspconfig'
  end
)



packer.startup(function()
  local use = use
  use 'nvim-treesitter/nvim-treesitter'
  use 'sheerun/vim-polyglot'
  -- these are optional themes but I hear good things about gloombuddy ;)
  -- colorbuddy allows us to run the gloombuddy theme
  use 'tjdevries/colorbuddy.nvim'
  use 'bkegley/gloombuddy'
  -- sneaking some formatting in here too
  use {'prettier/vim-prettier', run = 'yarn install' }
  end
)




vim.g.colors_name = 'gloombuddy'


local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  }
}



local lspconfig = require'lspconfig'
local completion = require'completion'
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  completion.on_attach(client)
end
local default_config = {
  on_attach = custom_on_attach,
}
-- setup language servers here
lspconfig.tsserver.setup(default_config)


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)





key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')






use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-lua/telescope.nvim'
use 'jremmen/vim-ripgrep'




key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')



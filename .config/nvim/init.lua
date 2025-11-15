-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars = {
  eob = "~",
}

vim.opt.shortmess:append("I")

-- Setup plugins
require("lazy").setup({
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
      })
    end,
  },

  -- Better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash", "python", "c", "cpp", "lua", "vim", "make", "cmake"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Auto-close brackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
})

-- Colorscheme
vim.opt.termguicolors = false

vim.cmd([[
  highlight clear
  syntax reset
]])

vim.cmd([[
  " Background/Foreground
  highlight Normal ctermfg=NONE ctermbg=NONE
  highlight NonText ctermfg=0 ctermbg=NONE
  
  " Line numbers
  highlight LineNr ctermfg=8 ctermbg=NONE
  highlight CursorLineNr ctermfg=8 ctermbg=NONE cterm=bold
  
  " Cursor line
  highlight CursorLine ctermbg=0 cterm=NONE
  
  " Status line
  highlight StatusLine ctermfg=0 ctermbg=NONE cterm=NONE
  highlight StatusLineNC ctermfg=0 ctermbg=NONE cterm=NONE
  
  " Vertical split
  highlight VertSplit ctermfg=0 ctermbg=NONE cterm=NONE
  
  " Popup menu (autocomplete)
  highlight Pmenu ctermfg=0 ctermbg=0
  highlight PmenuSel ctermfg=0 ctermbg=4
  
  " Search
  highlight Search ctermfg=0 ctermbg=3
  highlight IncSearch ctermfg=0 ctermbg=6
  
  " Visual selection
  highlight Visual ctermfg=NONE ctermbg=8

  highlight EndOfBuffer ctermfg=0 ctermbg=NONE

  " Lazy.nvim UI
  highlight LazyNormal ctermfg=NONE ctermbg=NONE
  highlight LazyButton ctermfg=1 ctermbg=0
  highlight LazyButtonActive ctermfg=1 ctermbg=8
  highlight LazyH1 ctermfg=3 ctermbg=NONE cterm=bold
  highlight LazyH2 ctermfg=4 ctermbg=NONE cterm=bold
  highlight LazyComment ctermfg=8 ctermbg=NONE
  highlight LazyProgressDone ctermfg=2 ctermbg=NONE
  highlight LazyProgressTodo ctermfg=8 ctermbg=NONE
  highlight LazySpecial ctermfg=5 ctermbg=NONE
  highlight LazyProp ctermfg=6 ctermbg=NONE
  highlight LazyValue ctermfg=7 ctermbg=NONE
  highlight LazyDir ctermfg=4 ctermbg=NONE
  highlight LazyUrl ctermfg=4 ctermbg=NONE cterm=underline
]])

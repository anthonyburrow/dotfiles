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
  highlight LineNr ctermfg=11 ctermbg=NONE
  highlight CursorLineNr ctermfg=11 ctermbg=NONE cterm=bold
  
  " Cursor line
  highlight CursorLine ctermbg=0 cterm=NONE
  
  " Status line
  highlight StatusLine ctermfg=11 ctermbg=NONE cterm=NONE
  highlight StatusLineNC ctermfg=11 ctermbg=NONE cterm=NONE
  
  " Vertical split
  highlight VertSplit ctermfg=0 ctermbg=NONE cterm=NONE
  
  " Popup menu (autocomplete)
  highlight Pmenu ctermfg=11 ctermbg=NONE
  highlight PmenuSel ctermfg=7 ctermbg=11
  
  " Search
  highlight Search ctermfg=0 ctermbg=3
  highlight IncSearch ctermfg=0 ctermbg=6
  
  " Visual selection
  highlight Visual ctermfg=NONE ctermbg=8

  highlight EndOfBuffer ctermfg=7 ctermbg=NONE

  " Command line and messages
  highlight MsgArea ctermfg=6 ctermbg=NONE
  highlight MsgSeparator ctermfg=8 ctermbg=NONE
  
  " When typing commands
  highlight NormalFloat ctermfg=6 ctermbg=0
  highlight FloatBorder ctermfg=6 ctermbg=0
  
  " Error/warning messages
  highlight ErrorMsg ctermfg=0 ctermbg=NONE
  highlight WarningMsg ctermfg=0 ctermbg=NONE
  highlight MoreMsg ctermfg=0 ctermbg=NONE
  highlight Question ctermfg=0 ctermbg=NONE

  highlight ModeMsg ctermfg=6 ctermbg=NONE cterm=bold

  " Lazy.nvim UI
  highlight LazyNormal ctermfg=NONE ctermbg=NONE
  highlight LazyButton ctermfg=7 ctermbg=11
  highlight LazyButtonActive ctermfg=7 ctermbg=10
  highlight LazyH1 ctermfg=11 ctermbg=NONE cterm=bold
  highlight LazyH2 ctermfg=11 ctermbg=NONE cterm=bold
  highlight LazyComment ctermfg=11 ctermbg=NONE
  highlight LazyProgressDone ctermfg=2 ctermbg=NONE
  highlight LazyProgressTodo ctermfg=11 ctermbg=NONE
  highlight LazySpecial ctermfg=11 ctermbg=NONE
  highlight LazyProp ctermfg=11 ctermbg=NONE
  highlight LazyValue ctermfg=7 ctermbg=NONE
  highlight LazyDir ctermfg=11 ctermbg=NONE
  highlight LazyUrl ctermfg=11 ctermbg=NONE cterm=underline
]])

-- Options are automatically loaded before lazy.nvim startup
vim.cmd([[
  highlight Normal      guibg=NONE ctermbg=NONE
  highlight NormalNC    guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE ctermbg=NONE
  highlight SignColumn  guibg=NONE ctermbg=NONE
  highlight VertSplit   guibg=NONE ctermbg=NONE
]])
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Diagnostic configuration - disable warnings by default
vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  signs = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
  float = {
    severity = { min = vim.diagnostic.severity.ERROR }
  },
})

-- Global variable to track warning visibility state
vim.g.warnings_visible = false

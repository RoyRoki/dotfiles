-- vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Image viewing keybindings
vim.keymap.set("n", "<leader>it", function()
  require("image").clear()
end, { desc = "Clear images" })

vim.keymap.set("n", "<leader>ir", function()
  require("image").setup({})
end, { desc = "Reload images" })

-- Toggle warnings function
local function toggle_warnings()
  if vim.g.warnings_visible then
    -- Hide warnings - show only errors
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
    vim.g.warnings_visible = false
    print("Warnings hidden (showing only errors)")
  else
    -- Show all diagnostics including warnings
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      float = {
        border = "rounded",
      },
    })
    vim.g.warnings_visible = true
    print("All warnings visible")
  end
end

-- Keymap to toggle warnings
vim.keymap.set("n", "<leader>tw", toggle_warnings, { desc = "Toggle warnings" })

-- Buffer navigation keymaps
-- Map leader ww to switch to previous buffer (same as leader bb in LazyVim)
vim.keymap.set("n", "<leader>ww", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

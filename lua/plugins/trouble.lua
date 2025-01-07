if true then return {} end
-- Trouble for Diagnostics Navigation
-- Add trouble.nvim for quick navigation through LSP diagnostics:
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    position = "bottom",
    height = 10,
  },
  keys = {
    { "<leader>xx", ":TroubleToggle<CR>", desc = "Toggle Trouble" },
  },
}
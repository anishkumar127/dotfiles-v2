if true then return {} end

--  Enhance Git Workflow
-- Add gitsigns.nvim for Git Integration
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
  keys = {
    { "<leader>hs", ":Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
    { "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
    { "<leader>hr", ":Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
  },
}
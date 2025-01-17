-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })

local map = vim.keymap.set

-- how to use this 
-- In normal mode:

-- Press <Ctrl> + <Alt> + k to duplicate the current line above.
-- Press <Ctrl> + <Alt> + j to duplicate the current line below.
-- In visual mode:

-- Select a block of text using visual mode (v).
-- Press <Ctrl> + <Alt> + k to duplicate the selection above.
-- Press <Ctrl> + <Alt> + j to duplicate the selection below.
map("n", "<C-A-k>", "yy[P", { noremap = true, silent = true, desc = "Duplicate line up" })
map("n", "<C-A-j>", "yy]p", { noremap = true, silent = true, desc = "Duplicate line down" })
map("v", "<C-A-k>", "yP", { noremap = true, silent = true, desc = "Duplicate selection up" })
map("v", "<C-A-j>", "y]p", { noremap = true, silent = true, desc = "Duplicate selection down" })

-- Exit insert mode with 'jj' in insert mode
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Exit with 'qq' in normal mode
map("n", "qq", ":q<CR>", { noremap = true, silent = true })


-- TODO: need to read this cmd
-- Delete without copying to register in visual mode
map("v", "<Del>", '"_d', { noremap = true, silent = true })

-- DBui
map("n", "<leader>DBui", ":tabnew | DBUI<CR>", { noremap = true, silent = true })

-- Lspsaga keymaps
map("n", "<S-r>", "<cmd>Lspsaga hover_doc<CR>", { desc = "show hover doc" })
map("n", "<leader>ol", "<cmd>Lspsaga outline<CR>", { desc = "show outline" })
-- map("n", "<C-a>", "<cmd>Lspsaga code_action<CR>", { desc = "code action" })
map("n", "<C-c>d", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek definition" })
map("n", "<C-c>t", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "peek type definition" })

-- Auto save toggle
-- map("n", "<leader>AST", ":ASToggle<CR>", { noremap = true, silent = true })

-- Cheat.sh
map("n", "<leader>ch", "<cmd>Cheat<CR>", { noremap = true, silent = true, desc = "Cheat Sheet" })

-- LSP saga

map("n", "[d", function()
  require("lspsaga.diagnostic"):goto_prev()
end, { noremap = true, silent = true, desc = "Next diagnostic" })
map("n", "]d", function()
  require("lspsaga.diagnostic"):goto_next()
end, { noremap = true, silent = true, desc = "Prev diagnostic" })

-- Obsidian
-- map("n", "<leader>O", "", { desc = "+Obsidian" })
-- map(
--   "n",
--   "<leader>On",
--   ":execute 'ObsidianNew ' . input('Enter a name: ')<CR>",
--   { noremap = true, silent = true, desc = "New note" }
-- )
-- map("n", "<leader>Os", ":ObsidianQuickSwitch<CR>", { noremap = true, silent = true, desc = "Quick switch" })
-- map(
--   "n",
--   "<leader>Of",
--   ":lua local user_input = vim.fn.input('Enter v for vsplit, h for hsplit or leave empty: ') if user_input == 'v' then vim.cmd('ObsidianFollowLink vsplit') elseif user_input == 'h' then vim.cmd('ObsidianFollowLink hsplit') else vim.cmd('ObsidianFollowLink') end<CR>",
--   { noremap = true, silent = true, desc = "Follow link" }
-- )
-- map("n", "<leader>Ob", ":ObsidianBacklinks<CR>", { noremap = true, silent = true, desc = "Backlinks" })
-- map("n", "<leader>Od", ":ObsidianDailies<CR>", { noremap = true, silent = true, desc = "Dailies" })
-- map(
--   "n",
--   "<leader>Ot",
--   ":execute '<cmd>ObsidianTemplate<CR>",
--   { noremap = true, silent = true, desc = "Insert template" }
-- )
-- map("n", "<leader>sO", "<cmd>ObsidianSearch<CR>", { noremap = true, silent = true, desc = "Obsidian search" })
-- map(
--   "n",
--   "<leader>Or",
--   ":execute 'ObsidianRename ' . input('Enter new name: ')<CR>",
--   { noremap = true, silent = true, desc = "Rename note" }
-- )
-- map("n", "<leader>Oc", ":ObsidianToggleCheckbox<CR>", { noremap = true, silent = true, desc = "Toggle checkbox" })
-- map("n", "<leader>OT", "<cmd>ObsidianTags<CR>", { desc = "Search tags" })

-- Sessions
map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select session" })

map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Load last session" })

map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Don't save current session" })

-- Projects
map("n", "<leaderP", "", { desc = "+Projects" })
map("n", "<leader>Pd", "<cmd>Telescope neovim-project discover<CR>", { desc = "Discover projects" })
map("n", "<leader>PhDiscover projects", "<cmd>Telescope neovim-project history<CR>", { desc = "Projects history" })

map("n", "<leader>gh", "", { desc = "+Gitsigns" })

-- Tailwind Tools
map("n", "<leader>tt", "", { desc = "+Tailwind" })
map("n", "<leader>tts", "<cmd>TailwindSort<CR>", { desc = "Tailwind Sort" })
map("n", "<leader>ttS", "<cmd>TailwindSortSelection<CR>", { desc = "Tailwind Sort Selection" })
map("n", "<leader>ttc", "<cmd>TailwindConcealToggle<CR>", { desc = "Tailwind Conceal Toggle" })
map("n", "<leader>ttC", "<cmd>TailwindConcealEnable<CR>", { desc = "Tailwind Conceal Enable" })
map("n", "<leader>ttCd", "<cmd>TailwindConcealDisable<CR>", { desc = "Tailwind Conceal Disable" })
map("n", "<leader>ttco", "<cmd>TailwindColorToggle<CR>", { desc = "Tailwind Color Toggle" })
map("n", "<leader>ttcoe", "<cmd>TailwindColorEnable<CR>", { desc = "Tailwind Color Enable" })
map("n", "<leader>ttcod", "<cmd>TailwindColorDisable<CR>", { desc = "Tailwind Color Disable" })
map("n", "]tc", "<cmd>TailwindNextClass<CR>", { desc = "Tailwind Next Class" })
map("n", "[tc", "<cmd>TailwindPrevClass<CR>", { desc = "Tailwind Prev Class" })

-- Ts Import
map("n", "<leader>ti", "<cmd>Telescope import<CR>", { desc = "Import" })

-- Typescript tools
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "typescript", "typescriptreact" },
--   callback = function()
--     map("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Sorts and removes unused imports" })
--     map("n", "<leader>cS", "<cmd>TSToolsSortImports<cr>", { desc = "Sorts imports" })
--     map("n", "<leader>cr", "<cmd>TSToolsRemoveUnusedImports<cr>", { desc = "Removes unused imports" })
--     map("n", "<leader>cru", "<cmd>TSToolsRemoveUnused<cr>", { desc = "Removes all unused statements" })
--     map("n", "<leader>cM", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add missing imports" })
--     map("n", "<leader>cFa", "<cmd>TSToolsFixAll<cr>", { desc = "Fixes all fixable errors" })
--     map("n", "<leader>cR", "<cmd>TSToolsRenameFile<cr>", { desc = "Rename file" })
--     map("n", "<leader>cFr", "<cmd>TSToolsFileReferences<cr>", { desc = "Find file references" })
--   end,
-- })

map("n", "<S-A-j>", "<cmd>Treewalker Down<CR>", { noremap = true, desc = "Treewalker Down" })
map("n", "<S-A-k>", "<cmd>Treewalker Up<CR>", { noremap = true, desc = "Treewalker Up" })
map("n", "<S-A-h>", "<cmd>Treewalker Left<CR>", { noremap = true, desc = "Treewalker Left" })
map("n", "<S-A-l>", "<cmd>Treewalker Right<CR>", { noremap = true, desc = "Treewalker Right" })

--- Switch Tab with tab+tab
map("n", "<Tab><Tab>", "<cmd>tabnext<CR>", { noremap = true, silent = true })

-- Buffers
-- map(
--   "n",
--   "]b",
--   require("custom.buffers").next_buffer_in_tab,
--   { noremap = true, silent = true, desc = "Next buffer in tab" }
-- )
-- map(
--   "n",
--   "[b",
--   require("custom.buffers").prev_buffer_in_tab,
--   { noremap = true, silent = true, desc = "Previous buffer in tab" }
-- )
-- local tabufline = require("nvchad.tabufline")

-- map("n", "[B", function()
--   tabufline.move_buf(-1)
-- end, { noremap = true, silent = true, desc = "Move buffer left" })
-- map("n", "]B", function()
--   tabufline.move_buf(1)
-- end, { noremap = true, silent = true, desc = "Move buffer right" })
-- map("n", "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", { noremap = true, silent = true, desc = "Delete buffer" })
-- --

-- map("n", "<C-left>", "<cmd>wincmd h<CR>", { noremap = true, silent = true }) -- Move to the left window
-- map("n", "<C-right>", "<cmd>wincmd l<CR>", { noremap = true, silent = true }) -- Move to the right window
-- map("n", "<C-up>", "<cmd>wincmd k<CR>", { noremap = true, silent = true }) -- Move to the top window
-- map("n", "<C-down>", "<cmd>wincmd j<CR>", { noremap = true, silent = true }) -- Move to the bottom window
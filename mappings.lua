-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local chatgpt = require "chatgpt"

return {
  -- first key is the mode
  i = {
    ["<c-g>"] = { "accept codeium suggestion" },
    ["<c-;>"] = { "next codeium suggestion" },
    ["<c-,>"] = { "previous codeium suggestion" },
    ["<c-x>"] = { "clear codeium suggestions" },
  },
  n = {
    -- second key is the lefthand side of the map
    -- these first 4 codeium mappings do nothing - just here to show what the
    -- insert mode mappings are
    ["<c-g>"] = { "accept codeium suggestion" },
    ["<c-;>"] = { "next codeium suggestion" },
    ["<c-,>"] = { "previous codeium suggestion" },
    ["<c-x>"] = { "clear codeium suggestions" },
    ["<leader>;"] = { "toggle codeium on/off" },
    ["gh"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Swap source/header" },
    ["]q"] = { "<cmd>cn<cr>", desc = "Next quickfix message" },
    ["[q"] = { "<cmd>cp<cr>", desc = "Previous quickfix message" },
    ["gz"] = { name = "Surround" },
    ["<leader>bn"] = { "<cmd>file!<cr>", desc = "Display file name" },
    [",,"] = { "<cmd>b#<cr>", desc = "Alternate buffer" },
    ["<leader>uH"] = { "<cmd>set list!<cr>", desc = "Toggle hidden characters" },
    ["<leader>a"] = {
      name = "ChatGPT",
      e = {
        function() chatgpt.edit_with_instructions() end,
        "Edit with instructions",
      },
      -- prefix = "<leader>",
      -- mode = "v",
    },
    -- View treesitter highlight groups
    ["<leader>k"] = { ":TSHighlightCapturesUnderCursor<cr>", desc = "View Highlight Group" },
    -- Search highlight groups
    ["<space>fg"] = { "<cmd>Telescope highlights<cr>", desc = "Highlight groups" },

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    ["<leader>fB"] = {
      function() require("telescope.builtin").buffers { sort_mru = true } end,
      desc = "Buffers mru list",
    },
    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>uA"] = { "<cmd>AerialToggle<cr>", desc = "Toggle aerial" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

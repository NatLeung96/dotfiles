------- Keymaps -----------------------------------------------------------------------------------
vim.keymap.set("n", "<space>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-j>", ":bprev<CR>")
vim.keymap.set("n", "<C-k>", ":bnext<CR>")
------- Settings ----------------------------------------------------------------------------------
vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 8
vim.o.colorcolumn = "100"

vim.o.tabstop = 3
vim.o.shiftwidth = 3
vim.o.expandtab = false
vim.o.softtabstop = 3

vim.api.nvim_set_option("clipboard", "unnamedplus")
------- Package Manager ---------------------------------------------------------------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system {
      'git',

      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
   }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   { -- LSP Configuration & Plugins
      'neovim/nvim-lspconfig',
      dependencies = {
         {'williamboman/mason.nvim', config = true},
         'williamboman/mason-lspconfig.nvim',
         -- Useful status updates for LSP
         {'j-hui/fidget.nvim', opts = {}},
         'folke/neodev.nvim',
      },
   },
   
   {'JuliaEditorSupport/julia-vim'},

   {'numToStr/Comment.nvim'},

   {'tjdevries/colorbuddy.nvim'},

   {'catppuccin/nvim', name = 'catppuccin', priority = 1000},

   {'rose-pine/neovim', name = 'rose-pine'},

   {'sainnhe/gruvbox-material', name = 'gruvbox'},

   {'Shadorain/shadotheme', name = 'shadotheme'},

   {'nvim-lualine/lualine.nvim',
      dependencies = {
         'kyazdani42/nvim-web-devicons',
      },
   },

   {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
   }, 

   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
         -- your configuration comes here
         -- or leave it empty to use the default settings
         -- refer to the configuration section below
      },
      keys = {
         {
            "<leader>?",
            function()
               require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
         },
      },
   },

   { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      dependencies = {
         'nvim-treesitter/nvim-treesitter-textobjects',
      },
      build = ":TSUpdate",
   },
})
------- Configure Packages ------------------------------------------------------------------------
-- Configure Treesitter
require('nvim-treesitter.configs').setup{
   ensure_installed = {
      'ada',
      'bash',
      'c',
      'fortran',
      'julia',
      'latex',
      'lua',
      'python',
      'rust',
   },
   sync_install = false,
   auto_install = true,
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
}

require('Comment').setup()

require('catppuccin').setup({
   flavour = 'mocha',
   transparent_background = true,
   custom_highlights = function(colors)
      return {
         LineNr = {fg = colors.pink},
      }
   end
})

require('rose-pine').setup({
   styles = {
      italic = false,
      transparency = true,
   },
})

--vim.g['gruvbox_material_transparent_background'] = '2'

vim.cmd.colorscheme 'shado'
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
--require('colorbuddy').colorscheme('BlackLotusTheme')
require('shadotheme_lualine')

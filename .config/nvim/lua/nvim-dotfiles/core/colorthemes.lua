local themes = {}

themes.items = {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- themesake sure to load this before all the other start plugins.
    lazy = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = false },
        },
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        integrations = {
          gitsigns = true,
          treesitter = true,
          telescope = { enabled = true },
          which_key = true,
          fidget = true,
          mason = true,
          mini = true,
        },
      }
    end,
  },
}

function themes.names()
  local names = {}

  for _, item in ipairs(themes.items) do
    vim.list_extend(names, item.schemes)
  end

  return names
end

return themes

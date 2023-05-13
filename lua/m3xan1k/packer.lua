-- Auto install packer
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print('Installing packer close and reopen Neovim...')
    vim.cmd [[packadd packer.nvim]]
end

-- don't error on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- packer in popup window
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end
    }
})

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'    -- Packer can manage itself
    use 'nvim-lua/popup.nvim'       -- Popup API for Neovim
    use 'nvim-lua/plenary.nvim'     -- Useful lua functions used by lots of plugins

    -- TOOLS
    use 'nvim-telescope/telescope.nvim'

    use 'm3xan1k/simple'		-- my colorscheme

    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup()
        end
    }

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox-material',
                    section_separators = '',
                    component_separators = '',
                }
            })
        end
    }

    use("petertriho/nvim-scrollbar")

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
            require("scrollbar.handlers.gitsigns").setup()
        end
    }

    use {
        "kevinhwang91/nvim-hlslens",
        config = function()
            -- require('hlslens').setup()
            require("scrollbar.handlers.search").setup({
                override_lens = function() end,
        })
        end,
    }

    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end
    }

        -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'tpope/vim-surround'

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup({})
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'mbbill/undotree'
    use 'rmagatti/auto-session'
    use 'RRethy/vim-illuminate'
    use 'nvim-treesitter/nvim-treesitter'

    use {
      "kevinhwang91/nvim-ufo",
      requires = {
        "kevinhwang91/promise-async",
        {
          "luukvbaal/statuscol.nvim",
          config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup(
              {
                relculright = true,
                segments = {
                  {text = {builtin.foldfunc}, click = "v:lua.ScFa"},
                  {text = {"%s"}, click = "v:lua.ScSa"},
                  {text = {builtin.lnumfunc, " "}, click = "v:lua.ScLa"}
                }
              }
            )
          end

        }
      }
    }

    use {
        'f-person/git-blame.nvim',
        config = function()
            vim.g.gitblame_delay = 1000
        end
    }

    use 'preservim/nerdtree' 

    use {
        "ray-x/lsp_signature.nvim",
    }

end)

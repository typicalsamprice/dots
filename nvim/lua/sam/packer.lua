vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({})
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0", requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
        }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/playground"

    use "theprimeagen/harpoon"
    use "mbbill/undotree"

    use "windwp/nvim-autopairs"

    use "tpope/vim-fugitive"

    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "ray-x/lsp_signature.nvim"
    use "saadparwaiz1/cmp_luasnip"

    use "rust-lang/rust.vim"
    use "rhysd/vim-clang-format"
    use "stephpy/vim-yaml"
    use "cespare/vim-toml"

    use "itchyny/lightline.vim"
    use "shinchu/lightline-gruvbox.vim"

    use { "folke/todo-comments.nvim", requires = {{ "nvim-lua/plenary.nvim" }} }

    -- Colorschemes below this line
    use {
        "rose-pine/neovim",
        as = "rose-pine",
    }

    use "ellisonleao/gruvbox.nvim"
end)

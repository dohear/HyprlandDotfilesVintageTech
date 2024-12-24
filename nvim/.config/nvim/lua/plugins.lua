-- ~/.config/nvim/lua/plugins.lua
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Plenary is required by Telescope
    use 'nvim-lua/plenary.nvim'
    
    -- Telescope and its dependencies
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'}
        },
        tag = '0.1.4'  -- Using a stable version
    }
end)

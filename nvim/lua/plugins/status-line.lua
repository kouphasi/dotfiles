return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- ← ここにカンマ
    config = function()
        require('lualine').setup()
    end,
}

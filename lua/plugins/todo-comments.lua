return {
    'folke/todo-comments.nvim',
    tag = 'v1.3.0',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        signs = true,
        keywords = {
            TODO = {
                icon = ""
            }
        }
    }

}

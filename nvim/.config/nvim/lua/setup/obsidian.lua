require('telescope').load_extension('zk')
require('obsidian').setup({
    dir = '~/vimwiki',
    disable_frontmatter = true,
    completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    daily_notes = {
        folder = 'daily',
    },
})
vim.keymap.set('n', 'gf', function()
    if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>ObsidianFollowLink<CR>'
    else
        return 'gf'
    end
end, { noremap = false, expr = true })

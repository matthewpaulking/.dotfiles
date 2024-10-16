return {
    'gsuuon/tshjkl.nvim',
    opts = {
        keymaps = {
            toggle = '<leader><leader>j',
        },
        binds = function(bind, tshjkl)
            bind('<Esc>', function()
                tshjkl.exit(true)
            end)

            bind('q', function()
                tshjkl.exit(true)
            end)

            bind('t', function()
                print(tshjkl.current_node():type())
            end)
            bind('e', function()
                local node = tshjkl.current_node()

                while node do
                    local type = node:type()

                    if type:match('element') then -- declaration or definition
                        tshjkl.set_node(node)
                        return
                    end

                    node = node:parent()
                end
            end)
        end,
    },
}

return {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    config = function()
        local ls = require('luasnip')
        local s = ls.snippet
        local i = ls.insert_node
        local fmt = require('luasnip.extras.fmt').fmt
        ls.add_snippets('php', {
            s(
                'pf',
                fmt(
                    [[
                      public function {}({})
                      {{
                          return {}
                      }}
                      ]],
                    {
                        i(1, 'name'),
                        i(2, ''),
                        i(3, ''),
                    }
                )
            ),
        })
        ls.add_snippets('vue', {
            s(
                'vue',
                fmt(
                    [[
                    <script setup lang="ts">
                    let props = defineProps<{{}}>()
                    </script>

                    <template>
                    {}
                    </template>
              ]],
                    {
                        i(1, 'prop'),
                    }
                )
            ),
        })
    end,
}

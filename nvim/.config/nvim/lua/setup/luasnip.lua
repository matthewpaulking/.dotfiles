-- load snippets from path/of/your/nvim/config/my-cool-snippets
-- require('ls.loaders.from_vscode').lazy_load({ paths = { './snippets' } })

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local ls = require('luasnip')
local cmp = require('cmp')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require('luasnip.util.events')
local ai = require('luasnip.nodes.absolute_indexer')
local extras = require('luasnip.extras')
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require('luasnip.extras.expand_conditions')
local postfix = require('luasnip.extras.postfix').postfix
local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet

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

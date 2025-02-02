local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
    completion = {
        autocomplete = {
            require('cmp.types').cmp.TriggerEvent.TextChanged,
        },
        completeopt = 'menu,menuone,noselect',
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
        get_trigger_characters = function(trigger_characters)
            return trigger_characters
        end,
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        --['<CR>'] = cmp.mapping.confirm {
        --    behavior = cmp.ConfirmBehavior.Replace,
        --    select = true,
        --},
        -- Add back after codium
        --['<Tab>'] = function(fallback)
        --    if cmp.visible() then
        --        cmp.select_next_item()
        --    elseif luasnip.expand_or_jumpable() then
        --        luasnip.expand_or_jumpable()
        --    else
        --        fallback()
        --    end
        --end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

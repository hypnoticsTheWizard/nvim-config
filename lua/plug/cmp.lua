-- https://github.com/Saghen/blink.cmp
-- https://github.com/rafamadriz/friendly-snippets
-- TODO: Complete theaming and customisation
return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'none',

        ['<M-j>'] = { 'select_next', 'fallback_to_mappings' },
        ['<M-k>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<M-l>'] = { 'snippet_forward', 'fallback_to_mappings' },
        ['<M-h>'] = { 'snippet_backward', 'fallback_to_mappings' },

        ['<C-f>'] = { 'accept_and_enter', 'fallback_to_mappings' },

        ['<M-d>'] = { 'show_documentation', 'hide_documentation', 'fallback_to_mappings' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback_to_mappings' },

      },

      cmdline = {
        keymap = {
          ['<Tab>'] = { 'show', 'hide' },

          ['<M-j>'] = { 'select_next', 'fallback_to_mappings' },
          ['<M-k>'] = { 'select_prev', 'fallback_to_mappings' },

          ['<C-f>'] = { 'accept_and_enter', 'fallback_to_mappings' },

          ['<M-d>'] = { 'show_documentation', 'hide_documentation', 'fallback_to_mappings' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        },
        completion = { menu = { auto_show = false, }, },

        sources = {default = {'cmdline','path'}},
      },

      term = {
        enabled = true,
        sources = {default = {'term','path'}},
        keymap = {
          ['<Tab>'] = { 'show', 'hide' },

          ['<M-j>'] = { 'select_next', 'fallback_to_mappings' },
          ['<M-k>'] = { 'select_prev', 'fallback_to_mappings' },

          ['<C-f>'] = { 'accept_and_enter', 'fallback_to_mappings' },

          ['<M-d>'] = { 'show_documentation', 'hide_documentation', 'fallback_to_mappings' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        },
      },

      list = {
        selection = { preselect = false, auto_insert = true },
      },

      appearance = { nerd_font_variant = 'mono' },

      completion = { documentation = { auto_show = true } },

      snippets = { preset = 'default' },
      sources = {
        default = { 'lsp', 'snippets', 'buffer' },

        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
        },

        providers = {
          lazydev = { ... },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      menu = {
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        },
      },

    },

    opts_extend = { "sources.default" }
  },
}

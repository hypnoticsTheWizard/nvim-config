-- https://github.com/Saghen/blink.cmp
-- https://github.com/rafamadriz/friendly-snippets
-- TODO: Complete theaming and customisation
return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        cmd = "LazyDev",
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            "nvim-dap-ui",
          },
        },
      },
    },
    version = '1.*',
    event = "InsertEnter",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'none',

        ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
        ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-l>'] = { 'snippet_forward', 'fallback_to_mappings' },
        ['<C-h>'] = { 'snippet_backward', 'fallback_to_mappings' },

        ['<C-f>'] = { 'select_and_accept', 'fallback_to_mappings' },
        ['<M-g>'] = { 'cancel', 'fallback_to_mappings' },

        ['<M-d>'] = { 'show_documentation', 'hide_documentation', 'fallback_to_mappings' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback_to_mappings' },

      },

      cmdline = {
        enabled = false, -- TODO: cmdline completion appears broken?
        keymap = {
          ['<Tab>'] = { 'show', 'hide' },

          ['<M-j>'] = { 'select_next', 'fallback_to_mappings' },
          ['<M-k>'] = { 'select_prev', 'fallback_to_mappings' },

          ['<C-f>'] = { 'select_and_accept', 'fallback_to_mappings' },

          ['<M-d>'] = { 'show_documentation', 'hide_documentation', 'fallback_to_mappings' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        },

        completion = { menu = { auto_show = false, }, },
        sources = function()
          local type = vim.fn.getcmdtype()

          if type == '/' or '?' then return { 'buffer' } end
          if type == ':' or '@' then return { 'cmdline' } end

          return {}
        end,
        ghost_text = { enabled = true },
      },

      term = {
        enabled = false, -- TODO: cmdline completion appears broken?
        sources = { default = { 'term', 'path' } },
        keymap = {
          ['<Tab>'] = { 'show', 'hide' },

          ['<M-j>'] = { 'select_next', 'fallback_to_mappings' },
          ['<M-k>'] = { 'select_prev', 'fallback_to_mappings' },

          ['<C-f>'] = { 'select_and_accept', 'fallback_to_mappings' },

          ['<M-d>'] = { 'show_documentation', 'hide_documentation', 'fallback_to_mappings' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback_to_mappings' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback_to_mappings' },
        },
      },


      appearance = { nerd_font_variant = 'mono' },

      completion = {

        documentation = { auto_show = true },

        list = {
          selection = { preselect = true, auto_insert = false },
        },

        accept = {
          auto_brackets = { enabled = true },
        },

        menu = {
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" }
            },
          },
        },
      },

      snippets = { preset = 'default' },
      sources = {
        default = { 'lsp', 'snippets', 'buffer' },

        per_filetype = {
          lua = { inherit_defaults = true, 'lazydev' },
        },

        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          lsp = {
            name = 'LSP',
            module = 'blink.cmp.sources.lsp',
            enabled = true,
            async = false,
            timeout_ms = 2000,
            min_keyword_length = 1,
            max_items = 32,
            should_show_items = true,
            score_offset = 100,
          }
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },


    },

    opts_extend = { "sources.default" }
  },
}

local hydra = require("hydra")
local dap = require("dap")
local dap_ui_widg = require("dap.ui.widgets")

hydra({
  name = "Debugger",
  mode = 'n',
  config = {
    hint = false
  },

  body = '<leader>d',

  heads = {
    {
      "c",
      function () dap.continue() end,
      {desc = "Continues the debugging processes"}
    },
    {
      "n",
      function () dap.step_into() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "o",
      function () dap.step_over() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "O",
      function () dap.step_out() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "t",
      function () dap.toggle_breakpoint() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "s",
      function () dap.set_breakpoint() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "l",
      function () dap.set_breakpoint(nil, nil, vim.fn.input('Log note: ')) end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "R",
      function () dap.repl.open() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "$",
      function () dap.run_last() end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "K",
      function () dap_ui_widg.hover() end,
      {desc = "Goto the next breakpoint", mode = {"n","v"}}
    },
    {
      "@",
      function () dap_ui_widg.preview() end,
      {desc = "Goto the next breakpoint", mode = {"n","v"}}
    },
    {
      "f",
      function () dap_ui_widg.centered_float(dap_ui_widg.frames) end,
      {desc = "Goto the next breakpoint"}
    },
    {
      "{",
      function () dap_ui_widg.centered_float(dap_ui_widg.scopes) end,
      {desc = "Goto the next breakpoint"}
    },
  }
})

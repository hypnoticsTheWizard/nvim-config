---@brief
---
--- https://clangd.llvm.org/installation.html
---
--- - **NOTE:** Clang >= 11 is recommended! See [#23](https://github.com/neovim/nvim-lspconfig/issues/23).
--- - If `compile_commands.json` lives in a build directory, you should
---   symlink it to the root of your source tree.
---   ```
---   ln -s /path/to/myproject/build/compile_commands.json /path/to/myproject/
---   ```
--- - clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
---   specified as compile_commands.json, see https://clangd.llvm.org/installation#compile_commandsjson

-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
--
return {
  cmd = { "clangd" },
  root_markers = { ".clangd", "compile_commands.json" },
  capabilities = {
    textDocument ={
      completion = {
        editsNearCursor = true,
      }
    }
  },
  filetypes = { "c", "cpp", "cc", "cxx", "h", "hxx", "hpp" },
  on_attach = function() end,
  on_init = function()
    vim.notify("Clang-daemon summoned", vim.log.levels.INFO)
  end,
}

local M = {}

-- function M.get_lsp_snippets(remap)
--   local cap = vim.lsp.protocol.make_client_capabilities()
--   cap.textDocument.completion = require("cmp_nvim_lsp").default_capabilities().textDocument.completion
--
--   if (type(remap) == "table") then
--     vim.tbl_deep_extend('force',cap,remap)
--   end
--
--   return cap
-- end

M.autogroups = {
  keymap = vim.api.nvim_create_augroup("hyp/lsp/keymap", {clear=true}),
  folds = vim.api.nvim_create_augroup("hyp/lsp/folds", {clear=true})
}


function M.tbl_flatten(t)
  return vim.iter(t):flatten(math.huge):totable()
end

function M.strip_archive_subpath(path)
  -- Matches regex from zip.vim / tar.vim
  path = vim.fn.substitute(path, 'zipfile://\\(.\\{-}\\)::[^\\\\].*$', '\\1', '')
  path = vim.fn.substitute(path, 'tarfile:\\(.\\{-}\\)::.*$', '\\1', '')
  return path
end


local function escape_wildcards(path)
  return path:gsub('([%[%]%?%*])', '\\%1')
end

function M.root_pattern(...)
  local patterns = M.tbl_flatten { ... }
  return function(startpath)
    startpath = M.strip_archive_subpath(startpath)
    for _, pattern in ipairs(patterns) do
      local match = vim.validate('func', function(path)
        for _, p in ipairs(vim.fn.glob(table.concat({ escape_wildcards(path), pattern }, '/'), true, true)) do
          if vim.uv.fs_stat(p) then
            return path
          end
        end
      end,'function')

      if match ~= nil then
        return match
      end
    end
  end
end

return M

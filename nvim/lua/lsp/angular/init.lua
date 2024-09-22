local cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd() .. "/node_modules", "--ngProbeLocations",
  "/home/nagashima/.nodenv/versions/20.15.0/lib/node_modules" }

local is_running_prettier = false;
local is_running_eslint = false;

local function runPrettier()
  is_running_prettier = true;
  local function resume()
    vim.cmd('edit')
    is_running_prettier = false;
  end;
  vim.fn.jobstart("npx prettier --write " .. vim.fn.expand('%'), {
    on_exit = resume,
    on_stderr = resume
  })
end

local function runESLint()
  local function resume()
    vim.cmd('edit')
    is_running_eslint = false;
  end;
  vim.fn.jobstart("npx eslint --fix " .. vim.fn.expand('%'), {
    on_exit = resume,
    on_stderr = resume
  })
end

require('lspconfig').angularls.setup {
  cmd = cmd,
  filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular", "scss" },
  on_new_config = function(new_config, _new_root_dir)
    new_config.cmd = cmd
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      callback = function()
        if not is_running_prettier then
          runPrettier();
        end
        if not is_running_eslint then
          runESLint();
        end
      end,
    })
  end
}

local cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd() .. "/node_modules", "--ngProbeLocations",
  "/home/nagashima/.nodenv/versions/20.15.0/lib/node_modules" }

local running_prettier = false;
local running_eslint = false;
local linting = false;

local function runPrettier()
  running_prettier = true;
  linting = true;
  local function resume()
    running_prettier = false;
    if not running_eslint then
      vim.cmd('edit');
      linting = false;
    end
  end;
  vim.fn.jobstart("npx prettier --write " .. vim.fn.expand('%'), {
    on_exit = resume,
    on_stderr = resume
  })
end

local function runESLint()
  running_eslint = true;
    linting = true;
  local function resume()
    running_eslint = false;
    if not running_prettier then
      vim.cmd('edit');
      linting = false;
    end
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
        if not linting then
          runPrettier();
          runESLint();
        end
      end,
    })
  end
}

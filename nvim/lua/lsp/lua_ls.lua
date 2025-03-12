return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Use LuaJIT for NeoVim
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" }, -- Recognize the `vim` global
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
  autostart = true,
}

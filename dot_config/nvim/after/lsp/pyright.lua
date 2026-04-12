---@type vim.lsp.Config
return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticSeverityOverrides = {
          reportMissingImports = "none",
        },
      },
    },
  },
  on_init = function(client)
    local root = client.config.root_dir
    if not root then
      return
    end
    local venv_python = root .. "/.venv/bin/python"
    if vim.uv.fs_stat(venv_python) then
      client.settings = vim.tbl_deep_extend("force", client.settings, {
        python = { pythonPath = venv_python },
      })
    elseif vim.env.VIRTUAL_ENV then
      client.settings = vim.tbl_deep_extend("force", client.settings, {
        python = { pythonPath = vim.env.VIRTUAL_ENV .. "/bin/python" },
      })
    end
  end,
}

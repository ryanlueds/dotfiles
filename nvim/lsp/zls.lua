---@type vim.lsp.Config
return {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zir' },
    root_dir = lspconfig.util.root_pattern("build.zig", ".git") or vim.loop.cwd,
    single_file_support = true,
}


return {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = { "python" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    single_file_support = true
}

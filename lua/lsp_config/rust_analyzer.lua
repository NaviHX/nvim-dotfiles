
return {
    cmd = {"rust-analyzer"},
    root_dir = function()
        return vim.fn.getcwd()
    end,
    single_file_support = true
}

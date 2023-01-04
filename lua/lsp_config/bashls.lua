return {
    cmd = {
        "bash-language-server",
        "start"
    },
    root_dir = function()
        return vim.fn.getcwd()
    end
}

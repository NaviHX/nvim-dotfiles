return {
    adapter = {
        type = 'executable',
        command = 'lldb-vscode',
        env = {
            LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
        },
        name = "lldb"
    },
    configuration = {
        {
            name = "Launch",
            type = "cpp",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            args = {}
        }
    }
}

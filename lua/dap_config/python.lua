-- python3 -m pip install debugpy
return {
    adapter = {
        type = "executable",
        command = "python3",
        args = {"-m", "debugpy.adapter"}
    },
    configuration = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
        }
    }
}

-- 加载插件
local dap = require('dap')

-- 读取调试器配置
local dap_config = {
    rust = require('dap_config.rust'),
    cpp = require('dap_config.cpp'),
    python = require('dap_config.python'),
}

-- 为DAP插件加载调试器设置
for lang, config in pairs(dap_config) do
    dap.adapters[lang] = config.adapter
    dap.configurations[lang] = config.configuration
end

-- 键位设置

-- == 断点快捷键 ==
-- -- 断点
-- vim.keybinds.gmap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", vim.keybinds.opts)
-- -- 条件断点
-- vim.keybinds.gmap("n", "<leader>dcb", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", vim.keybinds.opts)

local wk = require('which-key')
wk.register({
    d = {
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint"},
        cb = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", "Conditional Breakpoint"},
    }
}, { prefix = "<leader>" })

-- == 调试器快捷键 ==
-- 开启调试, 运行到下一个断点
vim.keybinds.gmap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", vim.keybinds.opts)
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.keybinds.gmap("n", "<F6>", "<cmd>lua require'dap'.step_into()<CR>", vim.keybinds.opts)
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.keybinds.gmap("n", "<F7>", "<cmd>lua require'dap'.step_over()<CR>", vim.keybinds.opts)
-- 步出当前函数
vim.keybinds.gmap("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", vim.keybinds.opts)
-- 重启调试
vim.keybinds.gmap("n", "<F9>", "<cmd>lua require'dap'.run_last()<CR>", vim.keybinds.opts)
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.keybinds.gmap(
    "n",
    "<F10>",
    "<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
    vim.keybinds.opts
)

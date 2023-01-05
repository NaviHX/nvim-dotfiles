-- https://github.com/nvim-telescope/telescope.nvim
-- WARN: telescope 手动安装依赖 fd 和 repgrep
require("telescope").setup()
-- -- 查找文件
-- vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)
-- -- 查找文字
-- vim.keybinds.gmap("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>", vim.keybinds.opts)
-- -- 查找特殊符号
-- vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)
-- -- 查找帮助文档
-- vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)
-- -- 查找最近打开的文件
-- vim.keybinds.gmap("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)
-- -- 查找 marks 标记
-- vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)
-- -- 查找 TODO 标签
-- vim.keybinds.gmap("n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<CR>", vim.keybinds.opts)

local wk = require('which-key')
wk.register({
    f = {
        name = "Fuzzy Find",
        f = { "<cmd>Telescope fd theme=dropdown<CR>", "Find file"},
        g = { "<cmd>Telescope live_grep theme=dropdown<CR>", "Live grep"},
        b = { "<cmd>Telescope buffers theme=dropdown<CR>", "Find buffer"},
        h = { "<cmd>Telescope help_tags theme=dropdown<CR>", "Search help doc"},
        o = { "<cmd>Telescope oldfiles theme=dropdown<CR>", "Find old file"},
        m = { "<cmd>Telescope marks theme=dropdown<CR>", "Find mark"},
        t = { "<cmd>TodoTelescope theme=dropdown<CR>", "Find todo"},
        n = { "<cmd>lua require('telescope').extensions.notify.notify()<CR>", "Search notification history"},
        c = { "<cmd>NvimTreeFindFile<CR>", "Locate current file in NvimTree"}, -- This is not telescope command
    }
}, { prefix = "<leader>" })

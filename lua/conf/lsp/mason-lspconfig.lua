local setting = {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = { "sumneko_lua", "clangd", "rust_analyzer" },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
}

require('mason-lspconfig').setup(setting)
-- 这里是 LSP 服务启动后的按键加载
local function attach(_, bufnr)
    -- -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    -- vim.keybinds.bmap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", vim.keybinds.opts)
    -- -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
    -- vim.keybinds.bmap(bufnr, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", vim.keybinds.opts)
    -- -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
    -- vim.keybinds.bmap(bufnr, "n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", vim.keybinds.opts)
    -- -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
    -- vim.keybinds.bmap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", vim.keybinds.opts)
    -- -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    -- vim.keybinds.bmap(bufnr, "n", "<leader>cn", "<cmd>Lspsaga rename<CR>", vim.keybinds.opts)
    -- -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    -- vim.keybinds.bmap(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", vim.keybinds.opts)
    -- -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    -- vim.keybinds.bmap(bufnr, "n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", vim.keybinds.opts)
    -- -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    -- vim.keybinds.bmap(bufnr, "n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", vim.keybinds.opts)
    -- 悬浮窗口上翻页，由 Lspsaga 提供
    vim.keybinds.bmap(
        bufnr,
        "n",
        "<C-p>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
        vim.keybinds.opts
    )
    -- 悬浮窗口下翻页，由 Lspsaga 提供
    vim.keybinds.bmap(
        bufnr,
        "n",
        "<C-n>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
        vim.keybinds.opts
    )

    local wk = require('which-key')
    wk.register({
        g = {
            name = "LSP",
            d = { "<cmd>Telescope lsp_definitions theme=dropdown<CR>", "Go to defination"},
            r = { "<cmd>Telescope lsp_references theme=dropdown<CR>", "List references"},
            o = { "<cmd>Telescope diagnostics theme=dropdown<CR>", "List diagnostics"},
            h = { "<cmd>Lspsaga hover_doc<CR>", "Show help info"},
            [ '[' ] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Jump to prev diagnostic"},
            [ ']' ] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Jump to next diagnostic"},
        }
    }, { prefix = "<leader>", buffer = bufnr})
    wk.register({
        c = {
            name = "Code Action",
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "List available code action"},
            n = { "<cmd>Lspsaga rename<CR>", "Rename identifier"},
        }
    }, { prefix = "<leader>", buffer = bufnr})
end
-- flags
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- 自动启动LSP
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
            on_attach = attach,
            flags = lsp_flags,
        })
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
        require("lspconfig")["rust_analyzer"].setup({
            on_attach = attach,
            flags = lsp_flags,
            -- require("lsp_config.rust_analyzer")
        })
        -- require("conf.lsp.rust-tools")
    end,

    ["sumneko_lua"] = function ()
        require("lspconfig")["sumneko_lua"].setup({
            on_attach = attach,
            flags = lsp_flags,
            require("lsp_config.sumneko_lua")
        })
    end,

    ["clangd"] = function ()
        require("lspconfig")["clangd"].setup({
            on_attach = attach,
            flags = lsp_flags,
            require("lsp_config.clangd")
        })
    end
}


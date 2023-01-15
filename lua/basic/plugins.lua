---@diagnostic disable: undefined-global
-- 插件的设置文件在lua/conf目录下
-- lsp与dap设置文件在lua/lsp, lua/dap目录下

local packer = require("packer")
packer.startup(
    {
        function()
            -- packer 可以管理自己
            use {
                "wbthomason/packer.nvim"
            }

            -- vim 中文文档
            use {
                "yianwillis/vimcdoc"
            }

            -- === general ===
            -- nvim-tree 文件管理器
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    "kyazdani42/nvim-web-devicons"
                },
                config = function ()
                    require("conf.nvim-tree")
                end
            }

            -- which-key 提示快捷键
            use {
                'folke/which-key.nvim',
                config = function ()
                    require('conf.which-key')
                end
            }

            -- nvim-surround
            use {
                "kylechui/nvim-surround",
                tag = "*",
                config = function ()
                    require("conf.nvim-surround")
                end
            }

            -- Comment.nvim
            use {
                'numToStr/Comment.nvim',
                config = function ()
                    require('conf.Comment')
                end
            }

            -- 主题: tokyonight
            use {
                "folke/tokyonight.nvim",
                config = function ()
                    require("conf.tokyonight")
                end
            }

            -- lualine 底部的状态栏
            use {
                'nvim-lualine/lualine.nvim',
                requires = {
                    'kyazdani42/nvim-web-devicons', opt = true
                },
                config = function ()
                    require("conf.lualine")
                end
            }

            -- buffer栏 支持显示LSP状态
            use {
                'akinsho/bufferline.nvim',
                requires = {
                    'famiu/bufdelete.nvim' -- 关闭buffer不影响布局
                },
                config = function ()
                    require("conf.bufferline")
                end
            }

            -- 搜索时显示条目
            use {
                'kevinhwang91/nvim-hlslens',
                config = function ()
                    require("conf.nvim-hlslens")
                end
            }

            -- 自动匹配括号
            use {
                'windwp/nvim-autopairs',
                config = function ()
                    require("conf.nvim-autopairs")
                end
            }

            -- 高亮光标词汇
            use {
                'RRethy/vim-illuminate',
                config = function ()
                    require("conf.vim-illuminate")
                end
            }

            -- 恢复光标位置
            use {
                'ethanholz/nvim-lastplace',
                config = function ()
                    require("conf.nvim-lastplace")
                end
            }

            -- auto session
            use {
                'rmagatti/auto-session',
                config = function ()
                    require("conf.auto-session")
                end
            }

            -- auto save
            use {
                'Pocco81/auto-save.nvim',
                config = function ()
                    require("conf.auto-save")
                end
            }

            -- terminal
            use {
                'akinsho/toggleterm.nvim',
                config = function ()
                    require('conf.toggleterm')
                end
            }

            -- fuzzy find
            use {
                'nvim-telescope/telescope.nvim',
                requires = {
                    'nvim-lua/plenary.nvim',
                    'BurntSushi/ripgrep',
                    'sharkdp/fd'
                },
                config = function ()
                    require('conf.telescope')
                end
            }

            -- todo comment
            use {
                'folke/todo-comments.nvim',
                config = function ()
                    require('conf.todo-comments')
                end
            }

            -- format
            use {
                'sbdchd/neoformat',
                config = function ()
                    require('conf.neoformat')
                end
            }

            -- nvim notification
            use {
                'rcarriga/nvim-notify',
                config = function ()
                    require('conf.nvim-notify')
                end
            }

            -- symbols-outline.nvim
            use {
                'simrat39/symbols-outline.nvim',
                config = function()
                    require("conf.lsp.symbols-outline")
                end
            }

            -- === Org Mode ===
            use {
                'nvim-orgmode/orgmode',
                config = function()
                    require('conf.orgmode')
                end
            }

            -- === LSP ===
            -- LSP 基础服务
            use {
                'williamboman/mason.nvim',
                config = function ()
                    require('conf.lsp.mason')
                end
            }

            use {
                'williamboman/mason-lspconfig.nvim',
                config = function ()
                    require('conf.lsp.mason-lspconfig')
                end
            }

            use {
                'neovim/nvim-lspconfig',
                config = function ()
                    require('conf.lsp.nvim-lspconfig')
                end
            }

            -- lsp ui
            use {
                'tami5/lspsaga.nvim',
                config = function ()
                    require('conf.lsp.lspsaga')
                end
            }

            -- lsp 工作进度
            use {
                'j-hui/fidget.nvim',
                config = function ()
                    require('conf.lsp.fidget')
                end
            }

            -- 插入模式获取函数签名
            use {
                'ray-x/lsp_signature.nvim',
                config = function ()
                    require('conf.lsp.lsp_signature')
                end
            }

            -- code action 提示
            use {
                'kosayoda/nvim-lightbulb',
                config = function ()
                    require('conf.lsp.nvim-lightbulb')
                end
            }

            -- rust tools
            -- 配置由mason-lspconfig自动完成
            use {
                'simrat39/rust-tools.nvim',
            }

            -- 自动补全
            use {
                'hrsh7th/nvim-cmp',
                requires = {
                    {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                    {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                    {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                    {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                    {"hrsh7th/cmp-path"}, -- 路径补全
                    {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                    {"hrsh7th/cmp-cmdline"}, -- 命令补全
                    {"f3fora/cmp-spell"}, -- 拼写建议
                    {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                    {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
                    -- {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
                },
                config = function ()
                    require('conf.lsp.nvim-cmp')
                end
            }

            -- treesitter highlighting
            use {
                'nvim-treesitter/nvim-treesitter',
                run = function()
                    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                    ts_update()
                end,
                config = function ()
                    require('conf.lsp.nvim-treesitter')
                end
            }
            -- === DAP ===
            -- DAP基础服务
            -- 调试器安装由Mason管理
            use {
                'mfussenegger/nvim-dap',
                config = function ()
                    require('conf.dap.nvim-dap')
                end
            }

            -- 调试器UI
            use {
                'rcarriga/nvim-dap-ui',
                config = function ()
                    require('conf.dap.nvim-dap-ui')
                end
            }

            -- 调试器UI内联虚拟文本
            use {
                "theHamsta/nvim-dap-virtual-text",
                config = function ()
                    require('conf.dap.nvim-dap-virtual-text')
                end
            }
        end,

        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

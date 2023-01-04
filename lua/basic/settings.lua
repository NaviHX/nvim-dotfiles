vim.o.encoding = "utf-8"
vim.updatetime = 100 -- 无操作时交换文件写到磁盘的等待时间
vim.o.timeoutlen = 500 -- 等待按键的延迟
vim.o.showcmd = true
vim.o.hidden = true -- 允许Buffer未写入就切换
vim.o.termguicolors = true
vim.o.cursorline = true -- 高亮当前行
vim.o.syntax = "enable"
vim.o.number = true -- 绝对行号
vim.o.relativenumber = true -- 相对行号
vim.o.scrolloff = 5 -- 光标上下保留的行数
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.backup = false
vim.o.swapfile = false
vim.o.list = true -- 特殊显示空格等字符
vim.o.autoindent = true
-- vim.o.filetype = "plugin"
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.wildmenu = true -- 命令行补全
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.spell = true
vim.o.spelllang = "en_us,cjk"
vim.o.foldenable = true
vim.o.foldmethod = "indent"
vim.o.foldlevel = 100

-- 是否将 tab 替换为 space
vim.o.expandtab = true
-- 换行或 >> << 缩进时的 space 数量    
vim.o.shiftwidth = 4    
-- 一个 tab 占用几个 space    
vim.o.tabstop = 4    
-- tab 和 space 的混合，和上面 2 个设置成相同即可    
vim.o.softtabstop = 4
vim.opt.listchars:append("space:⋅")

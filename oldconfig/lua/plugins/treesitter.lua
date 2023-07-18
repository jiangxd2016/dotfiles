-- Highlight, edit, and navigate code
local rainbow = {
    "#CC8888", "#CCCC88", "#88CC88", "#88CCCC", "#8888CC", "#CC88CC"
}
for i, c in ipairs(rainbow) do -- p00f/rainbow#81
  vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update({with_sync = true}))
        end,
        dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
        config = function()
            local treesitter = require("nvim-treesitter.configs")
						treesitter.setup({
							-- 安装 language parser
							-- :TSInstallInfo 命令查看支持的语言
							ensure_installed = { "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx", "python", "java","c", "cpp", "go", "lua", "python", "rust" },
							sync_intsall = true,
							-- ensure_installed = "maintained",
						
							-- 启用代码高亮模块
							highlight = {
								enable = true,
								-- 大文件关闭高亮
								disable = function(lang, buf)
									local max_filesize = 100 * 1024 -- 100 KB
									local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
									if ok and stats and stats.size > max_filesize then
										return true
									end
								end,
								additional_vim_regex_highlighting = false,
							},
							-- 启用增量选择模块
							incremental_selection = {
								enable = true,
								keymaps = {
									init_selection = "<CR>",
									node_incremental = "<CR>",
									node_decremental = "<BS>",
									scope_incremental = "<TAB>",
								},
							},
							-- 启用代码缩进模块, 启用这个功能后visual模式下对代码进行选中按(=)可以格式化代码, gg=G: 返回文件首行，相当于对所有代码进行格式化
							-- 这边我们使用coc的代码格式化
							indent = {
								enable = false,
								disable = {}
							},
							autotag = {
								enable = true
							},
							context_commentstring = {
								enable = true
							},
							yati = {
								enable = true,
								disable = {},
								default_lazy = true,
								default_fallback = "asis"
							},
							-- p00f/nvim-ts-rainbow
							rainbow = {
								enable = true,
								-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
								extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
								max_file_lines = nil, -- Do not enable for files with more than n lines, int
								colors = rainbow,
								termcolors = rainbow
								-- colors = {
								--   "#95ca60",
								--   "#ee6985",
								--   "#D6A760",
								--   "#7794f4",
								--   "#b38bf5",
								--   "#7cc7fe",
								-- }, -- table of hex strings
								-- termcolors = { } -- table of colour name strings
							},
						})
        end
    }
}

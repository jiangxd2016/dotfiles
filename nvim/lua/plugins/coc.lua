local map = vim.keymap.set

return {
  "honza/vim-snippets",
  "github/copilot.vim",
  {
    "neoclide/coc.nvim",
    build = "nio",
    init = function()
      vim.g.coc_global_extensions = {
        "coc-word",
        "coc-dictionary",
        "coc-emoji",
        "coc-yaml",
        "coc-toml",
        "@yaegassy/coc-tailwindcss3",
        "coc-css",
        'coc-eslint', 
        'coc-sql',  
        "coc-emmet",  
        "coc-tabnine",  
        '@yaegassy/coc-volar',
         '@yaegassy/coc-volar-tools',
        "coc-highlight",
        "coc-html",
        'coc-go',
        "coc-rust-analyzer",
        "coc-htmldjango",
        "coc-json",
        "coc-pyright",
        "coc-rust-analyzer",
        "coc-tsserver", 
        "coc-tag",
        "coc-sumneko-lua",
        "coc-clangd",
        "coc-snippets",
        "coc-spell-checker",
        "coc-sumneko-lua",
      }
    end,
    config = function()
      vim.o.tagfunc = "CocTagFunc"
      vim.cmd([[
        augroup CocAutocomands
          autocmd!
          " Show function signature while completing args
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
          autocmd FileType
                \ json,js,html,c,cpp,h,hh
                \ setlocal formatexpr=CocAction('formatSelected')
        augroup END
      ]])

      require("helpers.keys").maps(require("core.keymaps").coc)  
    end,
  },
}

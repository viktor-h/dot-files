return {
    "tpope/vim-fugitive",
    config = function ()
        vim.cmd[[set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P]]
    end
}

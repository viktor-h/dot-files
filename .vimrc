syntax on " Use syntax hilighting
set number " Use Numbering
set laststatus=2 " show statusline

" Move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

set tabstop=4 " Number of visal spaces per TAB
set softtabstop=4 " Number of spaces in tab when editing
set expandtab " Tabs are spaces
" Other tab settings
set autoindent
set smartindent

" Search
set incsearch " jump to best fit
set hlsearch " hilight matches
" Turn off search hilight with <CR>
nnoremap <CR> :nohlsearch<CR><CR>


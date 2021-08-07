

" " general remaps " "
map <C-a> <esc>ggVG<CR> " ctrl a -> Select all

noremap  <silent> <C-S>      :update<CR> " control S -> save
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
nnoremap <silent> <C-L>  :nohlsearch<CR>h<C-L> 
" ctrl L -> clear highlighted search result
tnoremap <Esc> <C-\><C-n> " esc in terminal mode -> exit


" " tabs " "
nnoremap <C-p> :bnext<CR>
nnoremap <C-o> :bprevious<CR>
nmap <C-n> :enew<cr>
noremap <silent> <C-q> :bd<CR> 
" Close current buffer


" Go to normal mode with <jk> (esc is too far)
inoremap jk <esc>
vnoremap jk <esc>
inoremap kj <esc>
vnoremap kj <esc>

" fix :WQ problem
nnoremap ; :
vnoremap ; :
command Wq wq
command WQ wq
command W w
command X x
command Q x


" " map most frequent actions with leader

" open new file
nnoremap <Leader>o :CtrlP<CR> 

" save and close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" copy paste with space
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" visual line mode
nmap <Leader><Leader> V

nmap <leader>l  :Autoformat<CR>

" ctrl a -> Select all
map <C-a> <esc>ggVG<CR>

" control S -> save
noremap  <silent> <C-S>      :update<CR>
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


inoremap <C-c> <Esc>

" disable Q
noremap Q <nop>

" fix :WQ problem
nnoremap ; :
vnoremap ; :
command Wq wq
command WQ wq
command W w
command Q x

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


" open new file
nnoremap <Leader>o :Telescope find_files<CR>
nnoremap <leader><tab> <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" visual line mode
nmap <Leader><Leader> V

nmap <leader>l  :Neoformat<CR>


nmap  <leader>j :! idea format %<CR>


nnoremap <C-f> :NvimTreeFindFileToggle<cr>


" generate new serial episode download link from the old one
let @z='yyp/S..EfE€kr€krg€kh'

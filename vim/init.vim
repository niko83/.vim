source $HOME/.vim/opts.vim
source $HOME/.vim/maps.vim

nnoremap <silent> <C-W>t :tabnew<CR>
noremap <silent> <leader>bd :bd<CR>




call plug#begin('~/.vim/plugged')
" Plug 'vim-scripts/wombat256.vim'
" Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'python-rope/ropevim'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>,' 
let g:ctrlp_custom_ignore = '__pycache__'

Plug 'wfxr/minimap.vim'
let g:minimap_auto_start = 0
let g:minimap_highlight_range = 1
let g:minimap_width = 20
hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B guibg=#32302f                                                                                                                                                                           
let g:minimap_cursor_color = 'MinimapCurrentLine'
noremap <F3> :MinimapToggle<CR> :MinimapRefresh<CR>


Plug 'powerman/vim-plugin-AnsiEsc'

Plug 'scrooloose/nerdtree'
nnoremap <silent> <leader>dd :NERDTreeFocus<CR>
let NERDTreeIgnore=['\~$', '\.AppleDouble$', '\.beam$', 'build$',
\'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$',
\'\.lo$', '\.\~lock.*#$', '\.mo$', '\.o$', '\.pt.cache$',
\'\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$',
\'\.rej$', '\.ropeproject$', '\.svn$', '\.tags$' ]


Plug 'github/copilot.vim'


Plug 'tpope/vim-fugitive'
" nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gb :Git blame<CR>
" nnoremap <leader>gd :Gdiffsplit<CR>
" nnoremap <leader>go :Gread<CR>
nnoremap <leader>gs :Git<CR>
" nnoremap <leader>gr :GDelete<CR>
" nnoremap <leader>gp :Git push<CR>
" nnoremap <leader>gc :Git commit %<CR>
nnoremap <leader>gl :Git log %<CR>
" nnoremap <leader>gL :Git log<CR>



Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
source $HOME/.vim/pluggins/coc.vim

"  Plug 'yaegassy/coc-ruff'
" :CocInstall @yaegassy/coc-ruff
" :CocCommand ruff.builtin.installServer

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'
let g:startify_files_number = 8
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'cp': [ 'Clean Plugins', ':PlugClean' ] },
\   { 'ps': [ 'Plugins Status', ':PlugStatus' ] },
\ ]
set nocompatible 

let g:polyglot_disabled = ['python.plugin']
Plug 'sheerun/vim-polyglot'


Plug 'tomasiser/vim-code-dark'

call plug#end()

fun! RGrep() "{{{ 
    let pattern = input("Search for pattern: ", expand("<cword>"))
    if pattern == ""
        return
    endif

    let cwd = getcwd()
    let startdir = input("Start searching from directory: ", cwd, "dir")
    if startdir == ""
        return
    endif

    let filepattern = input("Search in files matching pattern: ", "*.*") 
    if filepattern == ""
        return
    endif

    try
        execute 'noautocmd vimgrep /'.pattern.'/gj '.startdir.'/**/'.filepattern
        botright copen
    catch /.*/
        echohl WarningMsg | echo "Not found: ".pattern | echohl None
    endtry
endfun "}}} 
nnoremap <silent> <leader>gw :call RGrep()<CR>


function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <leader>ll :call ToggleQuickFix()<CR>
nnoremap <silent> <Enter> :.cc<CR>

noremap <silent> <leader>ii :call CocAction('organizeImport')<CR>


" Color theme
if !exists('g:colors_name')
    colorscheme codedark
    set background=dark
endif


aug python
  au!
  au BufWrite *.py call CocAction('format')
aug END
" :autocmd BufWritePre,FileType python %s/\s*$//g
" :autocmd BufWritePre,FileType python %s/\t/    /g
" :autocmd BufWritePre,FileType *.j2 %s/\t/  /g


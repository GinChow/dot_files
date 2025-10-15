" Configuration file for vim
" if !has('nvim')
"     set pythonthreedll=/Users/jin_zhou/.pyenv/versions/3.7.11/Library/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7.dylib
"     set pythondll=/Users/jin_zhou/.pyenv/versions/3.7.11/Library/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7.dylib
" endif
set modelines=0		" CVE-2007-2438
set encoding=utf-8
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
setlocal wrap
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
" set indent and use space instead of tab
" set tabstop=2
" set shiftwidth=4
" set expandtab
" indent
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=2
set expandtab
" end indent

let skip_defaults_vim=1
" Color theme
colorscheme dracula
let g:dracula_italic = 0
highlight Normal ctermbg=None
set wrap
set textwidth=0
set formatoptions+=t
set relativenumber
set nu!
set ruler
set mouse=a
set showmatch
set hlsearch

" GVIM config
if has("gui_running")
    set guicursor+=a:blinkon0
    set guioptions-=m " menu bar
    set guioptions-=M
    set guioptions-=T " tool bar
    if has("gui_gtk2")
        set guifont=Inconsolata\ 18
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h18
    elseif has("gui_win32")
        set guifont=Consolas:h13:cANSI
    endif
endif

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set background=dark


" Filetype related
" filetype plugin on
autocmd FileType c setlocal shiftwidth=2 tabstop=2 
autocmd FileType h setlocal shiftwidth=2 tabstop=2 
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 
autocmd FileType py setlocal shiftwidth=4 tabstop=4

call vundle#begin()
Plugin 'wesQ3/vim-windowswap'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dracula/vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'junegunn/fzf'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'othree/xml.vim'
Plugin 'chemzqm/wxapp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'skywind3000/vim-preview'
Plugin 'easymotion/vim-easymotion'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'skywind3000/gutentags_plus'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-startify'
Plugin 'will133/vim-dirdiff'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'tpope/vim-fugitive'
Plugin 'mg979/vim-visual-multi'
call vundle#end()
filetype plugin indent on


"runtime
runtime macros/matchit.vim

let mapleader = ","

" config for Easymotion
map <Leader><Leader>l <Plug>(easymotion-bd-jk)

" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" nerdtree config
" 打开/关闭 NERDTree
" function! MyNERDTreeToggle()
"   if g:NERDTree.IsOpen()
"     NERDTreeClose
"   else
"     NERDTree
"     NERDTreeFocus
"   endif
" endfunction

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

" ctrlp config
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP :pwd'

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*.so,*.swp,*.zip,*/.git/*,*/.hg/*,*/.svn/*
set wildmenu
set wildmode=longest:full,full

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }


let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files=0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'

" config ctrlp_funky
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>F :execute 'CtrlPFunky' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

" config vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='dracula'
" 窗口编号显示配置
let g:airline#extensions#windowswap#enabled = 1

" 自定义状态栏布局，包含窗口编号
" let g:airline_section_a = airline#section#create_left(['mode', 'crypt', 'paste', 'spell', 'capslock', 'winnr'])
let g:airline_section_a = '[%{winnr()}] %{airline#util#wrap(airline#parts#mode(),0)}'
" 在状态栏显示窗口编号
let g:airline_section_b = airline#section#create(['hunks', 'branch'])
let g:airline_section_c = airline#section#create(['%<', 'file', 'readonly'])
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])
let g:airline_section_y = airline#section#create_right(['ffenc'])
let g:airline_section_z = airline#section#create(['windowswap', '%3p%%', 'linenr', 'maxlinenr', 'colnr'])

" 窗口编号的快捷键映射
nnoremap <leader>1 1<C-w>w
nnoremap <leader>2 2<C-w>w
nnoremap <leader>3 3<C-w>w
nnoremap <leader>4 4<C-w>w
nnoremap <leader>5 5<C-w>w

" 标签页和缓冲区设置
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
" 文件名格式
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemod = ':t'
" 关闭按钮
let g:airline#extensions#tabline#show_close_button = 0
" 排除某些文件类型
let g:airline#extensions#tabline#excludes = ['defx', 'nerdtree']
" 非活动窗口配置 - 关键设置
let g:airline_inactive_collapse = 0
let g:airline_inactive_alt_sep = 0

" 为非活动窗口自定义状态栏段
function! SetInactiveSections()
  let w:airline_section_a = '[' . winnr() . ']'
  let w:airline_section_b = ''
  let w:airline_section_c = '%f'
  let w:airline_section_x = ''
  let w:airline_section_y = ''
  let w:airline_section_z = '%l/%L'
endfunction

" 在窗口进入时设置非活动状态栏
autocmd WinEnter * call SetInactiveSections()
autocmd WinLeave * call SetInactiveSections()



" tagbar config 
nmap <F10> :TagbarToggle<CR>
" YCM config
let g:ycm_python_binary_path = '/Users/jamesjzhou/.pyenv/shims/python'
let g:ycm_path_to_python_interpreter='/Users/jamesjzhou/.pyenv/shims/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_mum_of_chars_for_completion=2
let python_highlight_all = 1
let g:rehash256 = 1
" let g:ycm_key_list_stop_completion = ['<Enter>']

let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" YouCompleteMe config
let g:ycm_show_diagnostics_ui=0
" 补全菜单的开启与关闭
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

" 补全菜单中各项之间进行切换和选取：默认使用tab  s-tab进行上下切换，使用空格选取。可进行自定义设置：
let g:ycm_key_list_select_completion=['<C-j>']
"let g:ycm_key_list_select_completion = ['<Down>']      " 通过上下键在补全菜单中进行切换
let g:ycm_key_list_previous_completion=['<C-k>']
"let g:ycm_key_list_previous_completion = ['<Up>']
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    " 回车即选中补全菜单中的当前项
let g:SuperTabDefaultCompletionType = '<C-n>'

" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全
let g:ycm_key_invoke_completion = '<c-x>'

" 重映射快捷键
"上下左右键的行为 会显示其他信息,inoremap由i 插入模式和noremap不重映射组成，只映射一层，不会映射到映射的映射
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>jc    :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd    :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jr    :YcmCompleter GoToReferences<CR>
nnoremap <leader>jt    :YcmCompleter GetType<CR>
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
let g:ycm_confirm_extra_conf=1                 " 关闭加载.ycm_extra_conf.py确认提示


" NERDCommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

inoremap <leader>ci <SPACE><BS><ESC>:call NERDComment('i', 'insert')<CR>

" Emmet-vim config
let g:user_emmet_leader_key='<Leader>z'
let g:user_emmet_settings = {
  \ 'wxss': {
  \   'extends': 'css',
  \ },
  \ 'wxml': {
  \   'extends': 'html',
  \   'aliases': {
  \     'div': 'view',
  \     'span': 'text',
  \   },
  \  'default_attributes': {
  \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
  \     'navigator': [{'url': '', 'redirect': 'false'}],
  \     'scroll-view': [{'bindscroll': ''}],
  \     'swiper': [{'autoplay': 'false', 'current': '0'}],
  \     'icon': [{'type': 'success', 'size': '23'}],
  \     'progress': [{'precent': '0'}],
  \     'button': [{'size': 'default'}],
  \     'checkbox-group': [{'bindchange': ''}],
  \     'checkbox': [{'value': '', 'checked': ''}],
  \     'form': [{'bindsubmit': ''}],
  \     'input': [{'type': 'text'}],
  \     'label': [{'for': ''}],
  \     'picker': [{'bindchange': ''}],
  \     'radio-group': [{'bindchange': ''}],
  \     'radio': [{'checked': ''}],
  \     'switch': [{'checked': ''}],
  \     'slider': [{'value': ''}],
  \     'action-sheet': [{'bindchange': ''}],
  \     'modal': [{'title': ''}],
  \     'loading': [{'bindchange': ''}],
  \     'toast': [{'duration': '1500'}],
  \     'audio': [{'src': ''}],
  \     'video': [{'src': ''}],
  \     'image': [{'src': '', 'mode': 'scaleToFill'}],
  \   }
  \ },
  \}

" geeknote config
let g:GeeknoteFormat="markdown"


" MarkDown preview
" let vim_markdown_preview_hotkey='<C-m>'
" let vim_markdown_preview_browser='Google Chrome'

" Config for auto-pairs
" let g:AutoPairsShortcutJump = '<Leader>'
" let g:AutoPairsShortcutFastWrap = '<Leader>'
" set <M-p>=p " g:AutoPairsShortcutToggle
" set <M-e>=e " g:AutoPairsShortcutFastWrap
" set <M-n>=n " Map <BS> to delete brackets, quotes in pair

" Gtags
let $GTAGSLABEL='native-pygments'
" let $GTAGSLABEL='native'
let $GTAGSCONF='/Users/zhoujin/.globalrc'

let g:gutentags_file_list_command = 'ag -l'
" Debug toggle
let g:gutentags_trace = 0
let g:gutentags_define_advanced_commands = 1
let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1

noremap <silent> <leader>gb :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gr :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
" UlSnips

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="vertical"

" Copilot Setting
let g:copilot_filetypes = {
  \ 'python': v:true,
  \ }


" multi-cursor
let g:VM_maps         = {}  
let g:VM_maps['Find Under']         = '<M-m>'   " replace C-n
let g:VM_maps['Find Subword Under'] = '<M-m>'   " replace visual C-n
let g:VM_maps["Add Cursor Down"]    = '<M-j>'   " new cursor down
let g:VM_maps["Add Cursor Up"]      = '<M-k>'   " new cursor up
let g:VM_check_mappings = 0
" let g:VM_maps["Exit"]               = '<Space>' " quit VM

" " Default highlighting (see help :highlight and help :highlight-link)
" highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
" highlight link multiple_cursors_visual Visual
let g:VM_theme = 'sand'


"Shortcut key
noremap <Leader>ss :update<CR>
noremap <Leader>gs :vimgrep  **/*.<C-R>=expand("%:e")<CR><S-Left><Left>
noremap <Leader>ws :vimgrep <C-R><C-W> **/*.<C-R>=expand("%:e")<CR><CR>
noremap <Leader>tt :terminal<CR>
map <C-o> <C-o>zz
map <C-i> <C-i>zz

noremap j gj
noremap k gk

" filename 
" cnoremap \fn <C-R>=expand("%:t:r")<CR>
" file extention
" cnoremap \fe <C-R>=expand("%:e")<CR>

" insert mode shortcut
inoremap  <M-h> <Left>
inoremap  <M-j> <Down>
inoremap  <M-k> <Up>
inoremap  <M-l> <Right>
inoremap  <C-d> <DELETE>

" set <M-h>=h
" set <M-j>=j
" set <M-k>=k
" set <M-l>=l

"map * *<C-o>
"map # #<C-o>

"Tabs config"
" noremap <S-l> gt
" noremap <S-h> gT
syntax on

" 将 H 映射为移动到行首
nnoremap H ^
" 将 L 映射为移动到行尾  
nnoremap L $

" QuickFix List Toggler
" command -bang -nargs=? QFix call QFixToggle(<bang>0)
" function! QFixToggle(forced)
"   if exists("g:qfix_win") && a:forced == 0
"     cclose
"     unlet g:qfix_win
"   else
"     copen 10
"     let g:qfix_win = bufnr("$")
"   endif
" endfunction
"
" noremap <silent> <leader>ql :QFix<CR>


" Quickfix settings
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction

nnoremap <silent> ql :call QuickFix_toggle()<cr>

augroup DragQuickfixWindowDown
  autocmd!
  autocmd FileType qf wincmd J
augroup end

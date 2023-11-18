""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ██████  ██████  ████████ ██  ██████  ███    ██ ███████ 
" ██    ██ ██   ██    ██    ██ ██    ██ ████   ██ ██      
" ██    ██ ██████     ██    ██ ██    ██ ██ ██  ██ ███████ 
" ██    ██ ██         ██    ██ ██    ██ ██  ██ ██      ██ 
"  ██████  ██         ██    ██  ██████  ██   ████ ███████ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 中文参考资料 https://yianwillis.github.io/vimcdoc/doc/quickref.html
set nocompatible          " 不与 Vi 兼容, 使用 VIM 自己的操作命令
set number                " 显示行号
set nowrap                " 不要自动换号
set autochdir             " 自动根据当前窗口的文件切换目录
set autoindent            " 根据上一行自动缩进
set autoread              " 有 Vim 之外的改动时自动重读文件
set autowrite             " 有改动时自动写回文件
set showmode              " 显示当前编辑器的模式
set showcmd               " 命令模式下, 在底部显示, 当前键入的指令
set encoding=utf-8        " 文件编码格式
set fileencoding=utf-8    " 文件编码格式
set tabstop=4             " tab 键对应的空格数量
set expandtab             " 将 tab 按键自动转空格
set softtabstop=4         " 一个 tab 转换未多少个空格(tab 转空格功能开启后)
set laststatus=2          " 状态栏(0:不显示 1:多窗口时显示 2 一直显示)
set hlsearch              " 高亮显示搜索结果
set nobackup              " 不要创建备份文件(这个操作应该自己来完成,养成习惯)
set noswapfile            " 不创建交换文件
set undofile              " 保留撤销历史, 否则关闭编辑器, 撤销历史也没有了
set noerrorbells          " 关闭声音
set history=1000          " 操作历史个数上限
set termguicolors         " 终端使用 GUI 颜色
set t_Co=256              " 设置终端类型为256色(如果终端支持的话)
set clipboard+=unnamed    " 使用系统剪切板
set updatetime=100        " 更新间隔时间(ms), 比如按下 <Leader> 键后没有再
set timeoutlen=300        " 按其他键多久后自动取消 <Leader>, 不需要太快否则会频繁触发 which-key
syntax on                 " 开启语法高亮
syntax enable             " 开启语法高亮
filetype indent on        " 开启根据文件类型来处理缩进功能
let g:loaded_matchparen=1 " 不要自动高亮匹配的括号

colorscheme slate         " 设置当前主题
set cursorline            " 高亮当前行
hi CursorLine   cterm=NONE ctermfg=NONE ctermbg=black gui=NONE guifg=NONE guibg=#151719
hi CursorLineNr cterm=NONE ctermfg=NONE ctermbg=black gui=NONE guifg=NONE guibg=#222528
hi StatusLine   cterm=NONE ctermfg=NONE ctermbg=black gui=NONE guifg=NONE guibg=#151719
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ██████  ██      ██    ██  ██████  ██ ███    ██ ███████ 
" ██   ██ ██      ██    ██ ██       ██ ████   ██ ██      
" ██████  ██      ██    ██ ██   ███ ██ ██ ██  ██ ███████ 
" ██      ██      ██    ██ ██    ██ ██ ██  ██ ██      ██ 
" ██      ███████  ██████   ██████  ██ ██   ████ ███████ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
  Plug 'easymotion/vim-easymotion'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ██   ██ ███████ ██    ██ ███    ███  █████  ██████  ███████ 
" ██  ██  ██       ██  ██  ████  ████ ██   ██ ██   ██ ██      
" █████   █████     ████   ██ ████ ██ ███████ ██████  ███████ 
" ██  ██  ██         ██    ██  ██  ██ ██   ██ ██           ██ 
" ██   ██ ███████    ██    ██      ██ ██   ██ ██      ███████ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置 leader 键为空格
let g:mapleader = "\<Space>"
nnoremap <Space> <Leader>
" $ 不会包括换行符
noremap $ $h

" p 仅粘贴, 而不是粘贴并复制
nnoremap p "+p
vnoremap p "_c<C-r><C-o>+<ESC>

" x 仅删除, 而不是剪切
nnoremap x "_x

" 打开文件目录树
nnoremap <C-e> <CMD>Explor<CR> 

" 滚动时,始终保持光标在屏幕中间
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" 调整窗口大小
nnoremap <C-Up>    <CMD>resize +2<CR>
nnoremap <C-Down>  <CMD>resize -2<CR>
nnoremap <C-Left>  <CMD>vertical resize -2<CR>
nnoremap <C-Right> <CMD>vertical resize +2<CR>

" 高亮当前光标下的单词
nnoremap gw *N
vnoremap gw *N

" 取消高亮显示
nnoremap <ESC> <CMD>nohl<CR><ESC>

" 缩进
vnoremap < <gv
vnoremap > >gv

" 退出
nnoremap <C-q> <CMD>quitall<CR>

"########################################################################
" https://github.com/easymotion/vim-easymotion
"########################################################################
let g:EasyMotion_keys_is_bind = 0
function! BindEasyMotionKeys()
  if exists('g:EasyMotion_loaded') && g:EasyMotion_keys_is_bind == 0
    let g:EasyMotion_keys_is_bind = 1
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_startofline = 0
    let g:EasyMotion_use_smartsign_us = 1
    nnoremap s <Plug>(easymotion-s)
    nnoremap S <Plug>(easymotion-overwin-f)
    nnoremap t <Plug>(easymotion-t)
    nnoremap <Leader>j <Plug>(easymotion-j)
    nnoremap <Leader>k <Plug>(easymotion-k)
  endif
endfunction
autocmd BufRead * call BindEasyMotionKeys()

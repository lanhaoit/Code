" 设置通用缩进策略
set shiftwidth=4
set tabstop=4

" 对部分语言设置单独的缩进
au FileType groovy,scala,clojure,racket,lisp,lua,ruby,eruby,slim,elixir,dart,coffee,jade,sh set shiftwidth=2
au FileType groovy,scala,clojure,racket,lisp,lua,ruby,eruby,slim,elixir,dart,coffee,jade,sh set tabstop=2

" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h    setlocal ft=c
au BufRead,BufNewFile *.di   setlocal ft=d
au BufRead,BufNewFile *.cl   setlocal ft=lisp
au BufRead,BufNewFile *.phpt setlocal ft=php
au BufRead,BufNewFile *.sql  setlocal ft=mysql
au BufRead,BufNewFile *.tpl  setlocal ft=smarty
au BufRead,BufNewFile *.txt  setlocal ft=txt

" 设置着色模式和字体
        colorscheme molokai "black background
"       colorscheme tango2  "gray background
        set guifont=Monaco\ 11

set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
"set relativenumber           " 开启相对行号
set nu!                      " 显示行号
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set writebackup              " 设置无备份文件
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
set list                     " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set showmatch               " 显示括号配对情况
"set nowrap                  " 设置不自动换行

syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全


" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac

" ======= 引号 && 括号自动匹配 ======= "

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


" 加载pathogen插件管理器
execute pathogen#infect()

" 开启部分语法高亮的非默认特性
let python_highlight_all = 1                   " 打开全部Python高亮


" BufExplorer         文件缓冲浏览器
let g:bufExplorerSortBy = 'name'               " 按文件名排序


" Tlist               调用TagList
let Tlist_Show_One_File        = 1             " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow      = 1             " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window     = 1             " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close = 1             " 自动折叠

" NERD_commenter      注释处理插件
let NERDSpaceDelims = 1                        " 自动添加前置空格

" AuthorInfoDetect    自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
let g:vimrc_author   = 'lanhao'                " 昵称
let g:vimrc_email    = 'lanhaoit@aliyun.com'         " 邮箱
let g:vimrc_homepage = 'lanhaoit.github.com' " 个人主页

" Indent_guides       显示对齐线
let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸

" AirLine             彩色状态栏
let g:airline_theme = 'badwolf'                " 设置主题

" Syntastic           语法检查
let g:syntastic_check_on_open = 1              " 默认开启
let g:syntastic_mode_map      = {'mode': 'active',
            \'active_filetypes':  [],
            \'passive_filetypes': ['html', 'css', 'xhtml', 'groovy', 'scala', 'clojure', 'racket', 'eruby', 'slim', 'jade', 'scss', 'less']
            \}                                 " 指定不需要检查的语言 [主要是因为开启这些语言的语法检查会妨碍到正常的工作]
" 自定义编译器和编译参数
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_c_compiler_options = '-std=c11'
let g:syntastic_cpp_compiler_options = '-std=c++11'


" ======= 自定义快捷键 ======= "

imap <c-u> <Home>
imap <c-i> <End>
"Alt  + H            光标左移一格
imap <c-h> <Left>

" Alt  + J            光标下移一格
imap <c-j> <Down>

" Alt  + K            光标上移一格
imap <c-k> <Up>

" Alt  + L            光标右移一格
imap <c-l> <Right>


" \nt                 打开NERDTree窗口，在左侧栏显示
nmap <leader>nt :NERDTree<CR>

" \tl                 打开Taglist/TxtBrowser窗口，在右侧栏显示
nmap <leader>tl :Tlist<CR><c-w><c-l>

" \ff                 打开文件搜索窗口，在状态栏显示 [ctrlp.vim插件]
nmap <leader>ff :CtrlP<CR>

" \ud                 打开编辑历史窗口，在左侧栏显示 [Undotree插件]
nmap <leader>ud :UndotreeToggle<CR>

" \fe                 打开文件编码窗口，在右侧栏显示 [FencView插件]
nmap <leader>fe :FencView<CR>

" \16                 十六进制格式查看
nmap <leader>16 <ESC>:%!xxd<ESC>

" \r16                返回普通格式
nmap <leader>r16 <ESC>:%!xxd -r<ESC>

" \rb                 一键去除所有尾部空白
imap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <leader>rb <ESC>:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" \rt                 一键替换全部Tab为空格
func! RemoveTabs()
    if &shiftwidth == 2
        exec "%s/	/  /g"
    elseif &shiftwidth == 4
        exec "%s/	/    /g"
    elseif &shiftwidth == 6
        exec "%s/	/      /g"
    elseif &shiftwidth == 8
        exec "%s/	/        /g"
    else
        exec "%s/	/ /g"
    end
endfunc

imap <leader>rt <ESC>:call RemoveTabs()<CR>
nmap <leader>rt :call RemoveTabs()<CR>
vmap <leader>rt <ESC>:call RemoveTabs()<CR>

" \ev                 编辑当前所使用的Vim配置文件
nmap <leader>ev <ESC>:e $MYVIMRC<CR>

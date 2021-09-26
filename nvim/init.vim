" Configurações básicas {{{


set background=dark
set shellcmdflag=-ic
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone
set wildmenu
set wildmode=longest:full,full
set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0 " timeoutlen é usado para atrasos de mapeamento e ttimeoutlen é usado para atrasos de código-chave.
set magic
set clipboard=unnamedplus
set mouse=a
set guifont=Fira\ Code:h12
set showcmd " Configurando a exibição de comando.
set path+=**  " Incluindo subpastas nos caminhos dos arquivos.
set showmode " Configurando a exibição de modo.
set tabstop=4 " Configurando o tamanho da tabulação.
set shiftwidth=4 " Configurando a quantidade de espaços de uma tabulação.
set expandtab
set copyindent
set smartindent
set autoindent
set incsearch " Permite visualizar o cursor à medida que se digita.
set scrolloff=99999 " Tenda manter o cursor no meio da tela.
" Configurando parágrafos e quebras de linha.
set textwidth=0
set wrapmargin=0
set aw " Configurando o salvamento automático do arquivo ao trocar de .buffer
set ignorecase " Configurando maiúsculas ao fazer uma busca.
set hlsearch " Destaca com cores os termos procurados.
set cursorline " Destaca a linha atual do cursor.
set smartcase " Configurando ativação de case sentitive em caso de uma busca com maiúsculas.
" set ve=all " Permite mover o cursor para áreas onde não há texto.
set mousemodel=popup " Exibe o conteúdo de folders e sugestões spell
set number " Enumera as linhas do arquivo.
set relativenumber " Enumera as linhas do arquivo em posição relativa ao cursor.
set nolist " Desligando explicitamente a visualização de caracteres invisíveis.
set wrap " O editor quebra as linhas longas.
set linebreak " O editor quebra as linhas em espaços e não entre palavras.
set nobackup " Desativa o backup automátioco.
set nojoinspaces " Evita adicionar dois espaços após o '.' ao juntar frases.
set formatoptions-=l
" set spell " Destaca erros de digitação.
set equalalways " Deixa todas a janelas com o mesmo tamanho.
" set cursorbind " O cursor se movimenta junto com outras janelas vinculadas.
set title " Mostra informação do título da janela.
" Configuração de destaque de comandos em nova janela, ajuda muito com ER.
set hidden    " Não descarrega o buffer quando não está aparecendo.
set inccommand=split
set switchbuf=uselast,useopen,vsplit
set autoread  " update file when externally modified.
" persistent undo.
set undolevels=1000 " changes to be remembered.
set undofile
set undodir=~/.config/nvim/undo
set undoreload=1000
" multiple combinations for backups, see ':h backup-table'.
"set nobackup      " won't leave additional files after vim is closed.
set nowritebackup " keeps backup file while editing, deleted after.
"set noswapfile    " keeps everything in memory.
set directory=~/.config/nvim/swap// " '//' directs swap file name to reference complete file path.
set foldmethod=marker
set foldlevel=1
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" }}}
" Plugins {{{

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Plugins de busca difuza (que se espalha para todos os lados).
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Escrita livre de distrações.
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Plugin de tema.
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

" Plugins para mapeamento de Markdow.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Ver prévia de arquivos markdown.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Plugin de ajustes de janelas. Plug 'simeji/winresizer'

" Track the engine.
Plug 'SirVer/ultisnips'

""e Vim para escrita em prosa.
"Plug 'reedes/vim-pencil'

" Plugin de tradução.
Plug 'voldikss/vim-translator' 

"Plugin de movimentação por pulos.
"Plug 'easymotion/vim-easymotion'

" Plugin de integração com github.
Plug 'tpope/vim-fugitive'

" Plugin de manutenção de sessões no vim.
Plug 'tpope/vim-obsession'

" Plugin de navegação de arquivos.
Plug 'tpope/vim-vinegar'

" Melhorando o undo.
Plug 'mbbill/undotree'

" Dashboard no neovim.
Plug 'glepnir/dashboard-nvim'

" Plugin de terminal flutuante.
Plug 'voldikss/vim-floaterm'

" Coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'karb94/neoscroll.nvim'

" Initialize plugin system
call plug#end()

" }}}
" Configurações dos Plugins{{{
" Configuração de tema {{{
syntax on " Ativando o realse de sintaxe visual.
colorscheme onedark " Selecionando o tema baixado no plugin.

"}}}
" Configuração Neoscroll {{{
lua require('neoscroll').setup()

" }}}
" Configuração para FloaTerm {{{

let g:floaterm_autoclose = 1
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

let g:floaterm_keymap_new    = '<F1>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_toggle = '<M-space>'

" }}}
" Configuração de Dashboard {{{

" Default value is clap 
let g:dashboard_default_executive ='fzf'

let g:dashboard_custom_header =[ 
    \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗', 
    \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║', 
    \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║', 
    \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║', 
    \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║', 
    \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝', 
    \]

" eg : SPC mean the leaderkey
let g:dashboard_custom_section={ 
            \ 'buffer_list': { 
                \ 'description': ['Caixa de entrada               SPC n i', 'Busca em anotações e artigos   SPC f f'],
                \ 'command':"\" \"ni"},
            \ }

nmap <leader>çç :<C-u>SessionSave<CR> 
nmap <leader>çl :<C-u>SessionLoad<CR><CR>

nnoremap <silent> <leader>fh :History<CR> 
nnoremap <silent> <leader>tc :DashboardChangeColorscheme<CR> 
nnoremap <silent> <leader>fa :DashboardFindWord<CR> 
nnoremap <silent> <leader>fm :DashboardJumpMark<CR> 
nnoremap <silent> <leader>cn :DashboardNewFile<CR>

" }}} 
" Configuração de UndoTree {{{

nnoremap <F5> :UndotreeToggle<CR>

" }}}
" Configuração translator {{{

let g:translator_target_lang='pt'
let g:translator_default_engines=['bing', 'google']
let g:translator_window_type='popup'

nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(1) : "\<M-f>"
nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(0) : "\<M-b>"

""" Configuration example
" Echo translation in the cmdline
nmap <silent> <Leader>tt <Plug>Translate
nmap <silent> <Leader>ta vip<Plug>TranslateV
vmap <silent> <Leader>tt <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>ty <Plug>TranslateX

" }}}
" Configuração prévia de markdown {{{

" Atalhos de controle de prévia de markdown.

nmap <leader>ep <Plug>MarkdownPreview
nmap <leader>es <Plug>MarkdownPreviewStop
nmap <leader>et <Plug>MarkdownPreviewToggle

" }}}
" Configuração FZF-vim {{{

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" }}}
" Configuração Vim-airline {{{

let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'


" }}}
" Configuração Vim-pencil {{{

"let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
"let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
"let g:airline_section_x = '%{PencilMode()}'

"" force top correction on most recent misspelling
"nnoremap <buffer> <c-=> [s1z=<c-o>
"inoremap <buffer> <c-=> <c-g>u<Esc>[s1z=`]A<c-g>u

"" replace common punctuation
"iabbrev <buffer> -- –
"iabbrev <buffer> --- —
"iabbrev <buffer> << «
"iabbrev <buffer> >> »

" }}}
" Configuração UltiSnips {{{

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsSnippetsDir='/home/silva/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<C-space>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Atalho para abrir a edição de snippets.
nnoremap <leader>us :UltiSnipsEdit<CR>

" }}}
" Configuração do tema Onedark {{{

let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" }}}
" Configuração vim-markdown {{{

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'vsplit'

" Ativador da tabela de seções Markdown.
nnoremap <leader>tc :Toc<CR>
nnoremap <CR> $hhgf

" }}}
" Configuração da extenção Coc-nvim {{{

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"}}}
" Configuração do coc-Markmap, extenção Coc-nvim {{{

" Create a preview markmap from the whole file
nmap <leader>mk :silent :CocCommand markmap.create -w<CR>

"command! -range=% Markmap CocCommand markmap.create <line1> <line2>
"" Create markmap from the whole file
"nmap <leader>m :Markmap<CR>
"" Create markmap from the selected lines
"vmap <leader>m :Markmap<CR>

" }}}
" Configuração Goyo {{{

" Atalho para ativar  e desativar o modo de escrita livre de distrações.
nnoremap <leader>zen :Goyo<CR>
nnoremap <leader>zx :Goyo!<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" }}}}}}
" Configuração essêncial para edição e movimentação {{{

" buffer management.
" Configurando leader key.
let mapleader="\<space>"

" Troca entre buffers mais confortáveis.
nnoremap <TAB> :b#<CR>

" Configurando atalhos para arquivo de configuração do init.vim em nova janela.
nnoremap <leader>ee :e $MYVIMRC<CR>
nnoremap <leader>eh :split $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Definindo atalho para o modo de comando e bash.
nnoremap <leader>q :bd<CR>

" Deixando a atalhos confortáveis de movimentação entre frames.
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>

" Atalho mais confortável para abrir e fechar pastas.

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Use alt + \ ou - para dividir janelas.
nnoremap <M-v> :vsplit<CR>
nnoremap <M-s> :split<CR>

" Alterando entre maiúsculas e miniúsculas.
inoremap <c-c> <ESC>viwUi
nnoremap <c-c> viwU<Esc>

" Referências.
"guu                             : lowercase line
"gUU                             : uppercase line
"Vu                              : lowercase line
"VU                              : uppercase line
"g~~                             : flip case line
"vEU                             : Upper Case Word
"vE~                             : Flip Case Word
"ggguG                           : lowercase entire file

" Executa um script em shell. 
nnoremap <leader>x :FloatermSend bash %<CR>:FloatermToggle<CR>

" Configruando atalho paraslvar e sair do arquivo rápido.
nnoremap <leader>w :w!<CR>
nnoremap <BS><BS> :q!<CR> " Sai do arquivo e no nvim se for o ultimo buffer.
nnoremap <leader>zz :wq<CR>
nnoremap <leader>wll <ESC>:wall<CR>
nnoremap <leader>qll <ESC>:qall<CR>
nnoremap <leader>xll <ESC>:wqall<CR>

" Configurando atalho para instalação de plugins
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

" Configurando atalhos para movimentação entre janelas.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w> <C-w>w
nnoremap <C-c> <C-w>o

" Configurando saídas alternativas do insert mode.
inoremap jk <ESC>
inoremap kj <ESC>
vnoremap jk <ESC>
vnoremap kj <ESC>
cnoremap jk <ESC>
cnoremap kj <ESC>

" Movimentando de texto.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" Gerando Undo break points.
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap : :<c-g>u
inoremap ; ;<c-g>u
inoremap <CR> <CR><c-g>u

" Em adição os mapeamentos abaixo irão permitir que o cursor se movimente por linhas que foram quebradas apenas visualmente.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


" Fazendo o Y se comportar como as outras keys em maiúscula.
" Obs: Para copiar a linha inteira, basta teclar yy. Não perdemos nenhuma fucionalidade com esse remapeamento, apenas ganhamos.
nmap Y y$

" Melhorando o conforto para acessar o modo viasual-bloco.
nmap <leader>v <S-v>

" Melhorando a acessibilidade dos comandos de movimento para início e fim de linha.
nmap B ^
nmap E $

" Melhorando a acessibilidade de abrir e fechar pastas.
nnoremap ç za

"" Trocando ponto e vírgula por dois pontos, por comodidade.
"nnoremap ; :
"nnoremap : ;

" Configurando o H e L com novas funcionalidades
" Obs: remapeei as teclas H e L para g^ e g$. Como utilizo parágrafos compostos por uma longa linha quebrada visualmente isso me permite ter acesso ao inínio e fim das linhas virtuais com H e L sem perder a funcionalidade do ^ e $. As funcionalidades padrões do H e L não foram redirecionadas, estão inativas.
nnoremap H g^
nnoremap L g$
vnoremap H g^
vnoremap L g$

" Substituição de multiplas ocorrências de uma palavra no arquivo.
" Obs: coloque o cursor em cima de uma palavra que você deseja alterar, pressione cn ou cN e Digite a nova palavra pela qual deseja substituí-la; tecle ponto '.' várias vezes para alterar todas as outras ocorrências da palavra. É mais rápido do que pesquisar ou substituir. É pura magia.
nnoremap cn *``cgn
nnoremap cN *``cgN

" Configurando atalhos para adicionar linhas acima e abaixo da linha atual
nnoremap <leader>o o<ESC>k
nnoremap <leader>O O<ESC>j

" Adicionando marcadores a lista de saltos do cursor(Jumplist).
" Obs: estes marcadores de salto estão configurados para corresponder a quebra de linhas virtuais, pois configurei meu vim para esse formato de quebra de linhas. Caso não utilize as quebras de linha virtual altere os gk e gj para k e j, respectivamente.
nnorema <expr> gk (v:count > 5 ? "m'" . v:count : "") . 'gk'
nnorema <expr> gj (v:count > 5 ? "m'" . v:count : "") . 'gj'

" Adicionado caracteres em torno de uma seleção visual.
" obs: experimente selecionar toda a frase com 'vis', ou todo o parágrafo com 'vip'.
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>c <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>n <esc>`>a**<esc>`<i**<esc>
vnoremap <leader>i <esc>`>a*<esc>`<i*<esc>


" Definindo uma função para preservar  a posição do cursor ao executar alguns comandos.
function! PreservePosition(command)
    " save last search, and cursor position
    let l:search = @/
    let l:line = line(".")
    let l:column = col(".")

    execute a:command
    " restore previous search history, and cursor position
    let @/ = l:search
    call cursor(l:line, l:column)
endfunction

" Configurando atalhos para movimentação entre parágrafos.
nnoremap <M-.> }
nnoremap <M-,> {

" Define a limpesa do buffer de busca. mnemónico: cs = clear search.
nno <leader>cs <ESC>:let @/=""<CR>

" Atalho para chamar o leitor de ebooks.
nnoremap <leader>ok :FloatermToggle<CR> cd ~/documentos/livros && okular<CR>

" }}}
" Abreviações - C-v impede a execução automática. {{{

abclear
iab sns santosandsilva@gamil.com
iab ddc DELETE<ESC>
iab <expr> dataf strftime("%c")
iab <expr> ppp getreg('+')
iab tkg ghp_qz7oooqpkhifeuktyw9trzvukyj7is0asnf0
cab cmm !git commit -m "
cab add !git add .
cab sts !git status
cab psh git push -q https://ghp_qz7oooqpkhifeuktyw9trzvukyj7is0asnf0@github.com/ciberaprendiz/zettelkasten.git main
iab iii <!--{{{-->
iab fff <!--}}}-->

" }}}
" Configurações pessoais de anotações {{{


" Definido a localização do nosso repositório de notas.
let g:zettelkasten = "/home/silva/zettelkasten/"

let g:fzf_tags_command = 'ctags -R'

let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-h': 'split',
  \ 'alt-v': 'vsplit', 
  \'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Criando atalhos para utilizar o FZF
" Mnemónico para 'Fuzzy Find'.
nnoremap <leader>ff :cd ~/zettelkasten<CR>:Rg<CR>

" Mnemónico para  'Find Regex'.
nnoremap <leader>fr :RG<CR>
   
" Lista dos 100 ultimos arquivos abertos pelo vim.
nnoremap <leader>bo :ol<CR>

" Configurando atalhos para transitar entre buffers
"" Buffer files utilizando o FZF
nnoremap <silent><leader><TAB> :Buffers<CR>

" remap omni-complete to ctrl+space
inoremap <S-space> <C-x><C-o>
cnoremap <S-space> <C-x><C-o>

" Criando comando para criar uma nota com nome = Carimbo de tempo.
command! -nargs=0 NewZettel :execute ":e" zettelkasten . "·".strftime("%Y%m%d%H%M%S") . ".md"

" Criando atalho para criação de notas rápidas.
nmap <leader>nn :NewZettel<CR>

" Atalho que copia uma seleção visual para outro zettel. @todo transformar esse mapeamento em função.
vnoremap <leader>nn d:NewZettel<CR>i# · <ESC>o<ESC>p:b#<CR>i[](<ESC>"#pA)<ESC>o<ESC>ka

"vnoremap <leader>nt d:NewZettel<CR>i# · <ESC>o<ESC>p:b#<CR><M-9>
" command "[" . expand('#:t') . "]" . "(./" . expand('#:t') . ")"<cr><esc>

function! s:markdown_backlinks()
    call fzf#vim#grep(
                \ "rg --column --line-number --no-heading --color=always --smart-case ".expand('%'), 1,
                \ fzf#vim#with_preview('right:50%:hidden', '?'), 0)
endfunction
command! Backlinks call s:markdown_backlinks()

" returned string: [Title](YYYYMMDDHH.md)
function! s:make_note_link(l)
    let line = split(a:l[0], ':')
        " fzf#vim#complete returns a list with all info in index 0
        let ztk_id = l:line[0]
    try
        let ztk_title = substitute(l:line[2], '\#\+\s\+', '', 'g')
catch

        let ztk_title = substitute(l:line[1], '\#\+\s\+', '', 'g')
endtry
        let mdlink = "[" . ztk_title ."](". ztk_id .")"
        return mdlink
endfunction

" Definindo mapeamento para chamar a função make_note_link para criar um link com a referencia a outro zettel.
inoremap <expr> <M-z> fzf#vim#complete({
  \ 'source':  'rg --no-heading --smart-case  .',
  \ 'reducer': function('<sid>make_note_link'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'up':    5})


" Atalho para criar um link para outro artivo no modo de inserção.
imap [[ <M-z>

" Atalho mnemônico para selecionar "todo o texto".
nnoremap <leader>sa ggVG

" Find backlinks to current file and open quickfix list with the results
command! -nargs=0 Ngrepl :execute "grep -F '" . " ]( " . expand("%:t") . " )" .  "'" | :copen 1 nnoremap <leader>nb :Ngrepl<CR><CR>

" O mapeamento abaixo remove junta palavras quebradas entre o fim da linha e o início da próxima. Isso pode ocorrer quando colamos texto de algum PDF.
nnoremap <leader>cl :call PreservePosition(":%s/\\>- //g")<CR>

" O mapeamento abaixo permite colar texto do clipboard como uma longa linha de texto. Mnemónico: Paste from Clipboard
nnoremap s "+pv}Jo<ESC>
nnoremap S o<ESC>"+pv}


" Atalho para comentar e descomentar linhas.
nnoremap gc vip<c-v>I"<ESC>
nnoremap dc vip<c-v>x<ESC>

" Adicionado atalho para tab.
vnoremap > >gv
vnoremap < <gv


" Go to inbox of notes and set working directory to my notes
nnoremap <leader>ni :e ~/zettelkasten/inbox.md<CR>:cd ~/zettelkasten<CR>

" Generate ctags
" Após a geração de tags, você pode pesquisá-las utilizando o comando :ts nome-da-tag. Outro recurso muito bom é que você pode pesquisar a tag que está atualmente sob o seu cursor (ou um lugar à direita). Você faz isso com o <Ctrl>-]comando.
nnoremap <leader>tg :cd ~/zettelkasten<CR> :silent :!ctags -R . <CR> :redraw!<CR>

" Atalho para  para busca de tags
" Busca por tags no diretório atual.
nnoremap <leader>ts :Tags<CR>

" Busca por tags no buffer atual.
nnoremap <leader>tb :BTags<CR>

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

" Liga e desligar o dicionário em pt-BR.
nnoremap <leader>d :setlocal spell!<CR>

" Shortcuts using <leader> map <leader>sj ]s map <leader>sk [s map <leader>sa zg map <leader>sd z=
" Cria um buffers Markdown para rascunho.
map <leader>' :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Liga e desliga a sincronia de cursor entre janelas.
nnoremap <leader>cb :set cursorbind!<CR>

" Atalho para melhorar o conforto da entrada no modo de comando.
nnoremap <leader><leader> :

" Atalhos para alias do bashrc que ativam o plugin obsidian_to_anki
nnoremap <silent><leader>ak :silent :!obsidian2anki<CR><CR>
nnoremap <silent><leader>au :silent :!upobsidian2anki<CR><CR>
nnoremap <silent><leader>ae :silent :e /home/silva/zettelkasten/Obsidian_to_Anki/obsidian_to_anki_config.ini<CR><CR>

augroup DICIO
    autocmd!
    autocmd Filetype markdown setl spell spl=pt
    "autocmd Filetype markdown,mkd call pencil#init({'wrap':'soft'})
    "autocmd Filetype text call pencil#init()
    autocmd BufReadPre,BufWritePre *.md :%s/\s\+$//e
augroup END

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" }}}

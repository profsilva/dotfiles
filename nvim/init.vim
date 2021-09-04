"======================================================================
"======================================================================
" Configurações básicas
"======================================================================
"======================================================================

set timeoutlen=1000 ttimeoutlen=0 " timeoutlen é usado para atrasos de mapeamento e ttimeoutlen é usado para atrasos de código-chave.

let g:vimtex_matchparen_enabled = 0

set showcmd " Configurando a exibição de comando.
set path+=** " Incluindo subpastas nos caminhos dos arquivos.
set showmode " Configurando a exibição de modo.
set tabstop=4 " Configurando o tamanho da tabulação.
set shiftwidth=4 " Configurando a quantidade de espaços de uma tabulação.
set expandtab
set smartindent
set copyindent
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
set ttyfast " Envia mais caracteres ao terminal, melhorando o redraw de janelas.
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
set inccommand=split
set hidden    " Não descarrega o buffer quando não está aparecendo.
set switchbuf=uselast,useopen,vsplit
set autoread  " update file when externally modified.

" persistent undo.
set undolevels=1000 " changes to be remembered.
set undofile
set undodir=~/.config/nvim/undo
set undoreload=1000


" Backup / swap.
" multiple combinations for backups, see ':h backup-table'.
"set nobackup      " won't leave additional files after vim is closed.
set nowritebackup " keeps backup file while editing, deleted after.
"set noswapfile    " keeps everything in memory.
set directory=~/.config/nvim/swap// " '//' directs swap file name to reference complete file path.



"======================================================================
"======================================================================
" Configurações de Plugins
"======================================================================
"======================================================================

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Plugins de busca difuza (que se espalha para todos os lados).
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plugin de tema.
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'

" Plugins para mapeamento de Markdow.
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Plugin de modo janena.
Plug 'simeji/winresizer'

" Track the engine.
Plug 'SirVer/ultisnips'

" Vim para escrita em prosa.
Plug 'reedes/vim-pencil'

" Plugin que destaca a janela utilizada
Plug 'TaDaa/vimade'

" Plugin de movimentação vertical por pulos.
Plug 'justinmk/vim-sneak'

" Plugin de integração com github.
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()


"======================================================================
"======================================================================
" Configuração Vim-airline
"======================================================================
"======================================================================

let g:airline_powerline_fonts = 1

"======================================================================
"======================================================================
" Configuração WinResizer
"======================================================================
"======================================================================

let g:winresizer_start_key = 'çç'

"======================================================================
"======================================================================
" Configuração Vim-pencil
"======================================================================
"======================================================================

let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
let g:airline_section_x = '%{PencilMode()}'

" force top correction on most recent misspelling
nnoremap <buffer> <c-s> [s1z=<c-o>
inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

" replace common punctuation
iabbrev <buffer> -- –
iabbrev <buffer> --- —
iabbrev <buffer> << «
iabbrev <buffer> >> »

"======================================================================
"======================================================================
" Configuração UltiSnips
"======================================================================
"======================================================================

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsSnippetsDir='/home/silva/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"======================================================================
"======================================================================
" Configuração do tema Onedark
"======================================================================
"======================================================================

syntax on " Ativando o realse de sintaxe visual.
colorscheme onedark " Selecionando o tema baixado no plugin.


"======================================================================
"======================================================================
" Configuração vim-markdown
"======================================================================
"======================================================================

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'vsplit'

"======================================================================
"======================================================================
" Configuração essêncial para edição e movimentação.
"======================================================================
"======================================================================

" buffer management.
" Configurando leader key.
let mapleader="\<space>"

" Configurando atalhos para arquivo de configuração do init.vim em nova janela.
nnoremap <leader>eh :split $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Definindo atalho para o modo de comando e bash.
nnoremap <leader><leader> :
nnoremap <leader>b :!

"Cnfigurando atalho para recarregar as modificações feitas no arquivo na memória.
nnoremap <leader>r :w<CR> :source ~/.config/nvim/init.vim<CR> :echo "init.vim foi Salvo e Carregado em Memória!"<CR>

" Configruando atalho paraslvar e sair do arquivo rápido.
nnoremap <leader>w :w<CR>h
nnoremap <leader>fw :w!<CR>h
nnoremap <leader>q :q<CR>
nnoremap <leader>fq :q!<CR>
nnoremap <F8> :wq<CR>
nnoremap <leader>wll <ESC>:wall<CR>h
nnoremap <leader>qll <ESC>:qall<CR>
nnoremap <leader>xll <ESC>:wqall<CR>

" Configurando atalho para instalação de plugins
nnoremap <leader>ip :PlugInstall<CR>
nnoremap <leader>cp :PlugClean<CR>

" Configurando atalho para terminal
nnoremap <leader>t :terminal<CR>a

" Configurando atalhos para movimentação entre janelas.
nnoremap çh <C-w>h
nnoremap çj <C-w>j
nnoremap çk <C-w>k
nnoremap çl <C-w>l
nnoremap çw <C-w>w
nnoremap ço <C-w>o

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
inoremap . .<c-g>u
inoremap ! !<c-g>u
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
nnoremap Y y$

" Modificando o U para corresponder ao Redo.
nnoremap U <C-r>

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

" adicionado caracteres em torno de uma seleção visual.
" obs: experimente selecionar toda a frase com 'vis', ou todo o parágrafo com 'vip'.
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
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

" Configurando atalhos para movimentação entre páginas
nnoremap <M-h> <C-b> zz " movimenta para cima e centraliza o cursor.
nnoremap <M-l> <C-f> zz " Movimenta para baixo e centraliza o cursor.
nnoremap <M-o> <C-o>
nnoremap <M-i> <C-i>
nnoremap <leader>l }
nnoremap <leader>h {

" Define a limpesa do buffer de busca. mnemónico: cs = clear search.
nno <leader>cs <ESC>:let @/=""<CR>

"=========================================================================
"=========================================================================
" Configurações de anotações
"=========================================================================
"=========================================================================

" Definido a localização do nosso repositório de notas.
let g:zettelkasten = "/home/silva/zettelkasten/"

let g:fzf_tags_command = 'ctags -R'

let g:fzf_action = {
  \ 'alt-t': 'tab split',
  \ 'alt-h': 'split',
  \ 'alt-v': 'vsplit' }

" Criando atalhos para utilizar o FZF
" Mnemónico para 'Find Deep'.
nnoremap <leader>fd :Rg<CR>

" Mnemónico para 'Find Name'.
nnoremap <leader>ff :Rg ^# <CR>

" Configurando atalhos para transitar entre buffers
"" Buffer files utilizando o FZF
nnoremap <silent><leader><TAB> :Buffers<CR>

" Definindo atalho para troca do buffer atual e anterior.
nnoremap <leader>ç :b#<CR>

" Criando comando para criar uma nota com nome = Carimbo de tempo.
command! -nargs=0 NewZettel :execute ":e" zettelkasten . "·".strftime("%Y%m%d%H%M%S") . ".md"

" Criando atalho para criação de notas rápidas.
nnoremap <leader>nn :NewZettel<CR>

" make_note_link: List -> Str
" returned string: [Title](YYYYMMDDHH.md)
function! s:make_note_link(l)
        " fzf#vim#complete returns a list with all info in index 0
        let line = split(a:l[0], ':')
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
inoremap <expr> → fzf#vim#complete({
  \ 'source':  'rg --no-heading --smart-case  .',
  \ 'reducer': function('<sid>make_note_link'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'up':    5})

" Define um comando automático de remapeamento de entrada de links em arquivos em formato Markdown.
nnoremap <CR> f(gf

" Find backlinks to current file and open quickfix list with the results
command! -nargs=0 Ngrepl :execute "grep -F '" . " ]( " . expand("%:t") . " )" .  "'" | :copen 1 nnoremap <leader>nb :Ngrepl<CR><CR>

" O mapeamento abaixo remove junta palavras quebradas entre o fim da linha e o início da próxima. Isso pode ocorrer quando colamos texto de algum PDF.
nnoremap <leader>cl :call PreservePosition(":%s/\\>- //g")<CR>

" O mapeamento abaixo permite colar texto do clipboard como uma longa linha de texto. Mnemónico: Paste from Clipboard
nnoremap <leader>pc o<ESC>"+pv}Jo<ESC>

" Go to inbox of notes and set working directory to my notes
nnoremap <leader>ni :e $NOTES_DIR/inbox.md<CR>:cd $NOTES_DIR<CR>

" Generate ctags
" Após a geração de tags, você pode pesquisá-las utilizando o comando :ts nome-da-tag. Outro recurso muito bom é que você pode pesquisar a tag que está atualmente sob o seu cursor (ou um lugar à direita). Você faz isso com o <Ctrl>-]comando.
nnoremap <leader>tg :cd $NOTES_DIR<CR> :!ctags -R . <CR>

" Atalho para  para busca de tags
" Busca por tags no diretório atual.
nnoremap <leader>ts :Tags<CR>

" Busca por tags no buffer atual.
nnoremap <leader>tb :BTags<CR>

" Change directory to directory of current file
nnoremap <leader>cd :cd %:h<CR>

" Desligar o dicionário em pt-BR.
nnoremap <leader>d :set spell!<CR>

augroup DICIO
    autocmd!
    autocmd Filetype markdown setl spell spl=pt
    autocmd BufRead,BufNewFile *.md, setl spell spl=pt
    autocmd Filetype markdown,mkd call pencil#init({'wrap':'soft'})
    autocmd Filetype text call pencil#init()
    autocmd BufReadPre,BufWritePre *.md :%s/\s\+$//e
augroup END

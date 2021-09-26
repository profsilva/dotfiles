#!/usr/bin/env bash

##### Criando Alias.

shopt -s expand_aliases

alias ff="cd $NOTES_DIR && rg '^# ' | fzf"
alias fd="cd $NOTES_DIR && rg -n -F -i -U"
alias go="cd $NOTES_DIR && nvim inbox.md"
alias configv="vim $HOME/.config/nvim/init.vim"
alias configb="vim $HOME/.bashrc"
alias bib="cd $HOME/documentos/livros"
alias mubib='cd $HOME/documentos/livros && mupdf $(fzf)'
alias repo="cd $NOTES_DIR"
alias home="cd $HOME"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias telav="xrandr -o left"
alias tela="xrandr -o normal"
alias cl=clear
alias obsidian2anki="python3 $HOME/zettelkasten/Obsidian_to_Anki/obsidian_to_anki.py ~/zettelkasten"
alias upobsidian2anki="python3 $HOME/zettelkasten/Obsidian_to_Anki/obsidian_to_anki.py -u"
alias configo2a="nvim $HOME/zettelkasten/Obsidian_to_Anki/obsidian_to_anki_config.ini"
alias colar="xclip -0 | devir"

export PATH="$PATH:$HOME/scripts/bin"

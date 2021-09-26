#!/usr/bin/env bash

# _____________________________________________________________
# Programa   : mkscript.sh
# Linguagem  : Shell Script
# Descrição  : cria um script a partir de um template definido.
# Versão     : 1.0
# Autor      : André dos Santos Silva 
# Mantenedor : André dos Santos Silva
# Contato    : santosandsilva@gmail.com
# Data       : 22/09/2021
# Licença    : GNU/GPL v3.0
# TODO       : Nenhum no momento
# FIXME      : Desconhecido
# ! WARNING !: Nenhum
# _____________________________________________________________
# Instalação: Execute o comando abaixo, no diretório em que o arquivo desse script se encontra:
#
#   sudo chmod +x mkscript.sh && mv mkscript.sh $HOME/.local/bin/
#
# Uso: Após o procedimento de instalação, basta executar o comando mkscript.sh seguido do nome que deseja dar ao script que você quer criar.
# Não utilize mais de um argumento, sugiro que se precisar utilize " _ " para substituir espaços entre palavras.
# _____________________________________________________________


# Opções:

## Variável de definição do seu editor.
editor="nvim"

## Variáveis de mensagens.
msg_erro_arg="Por favor, utilize apenas um argumento para nomear o novo script."
msg_erro_arq="Já existe um arquivo com esse nome, abortando processo."

## Variável de definição de data da criação do programa.
dia_de_hoje="$(date +'%d/%m/%Y')"

## Variável de definição do template de cabeçalho do programa.
header="#!/usr/bin/env bash
# _____________________________________________________________
# Programa   : $1 
# Linguagem  : Shel Script
# Descrição  : 
# Versão     : 0.1
# Autor      : André dos Santos Silva 
# Mantenedor : André dos Santos Silva
# Contato    : santosandsilva@gmail.com
# Data       : $dia_de_hoje
# Licença    : GNU/GPL v3.0
# TODO       : Nenhum no momento
# FIXME      : Desconhecido
# ! WARNING !: 
# _____________________________________________________________
# Instalação: Execute o comando abaixo, no diretório em que o arquivo desse script se encontra:
#
#   sudo chmod +x $1 && mv $1 \$HOME/.local/bin/
#
# Uso: Após o procedimento de instalação, basta executar o comando $1 seguido do nome que deseja dar ao script que você quer criar.
# _____________________________________________________________
"

# Testes

## Testa se o usuário passou apenas 1 argumento.
[[ $# -ne 1 ]] && echo "$msg_erro_arg" && exit 1

## Testa se o arquivo já existe.
[[ -f $1 ]] && echo "$msg_erro_arq" && exit 1

# Comandos

## Criando um novo arquivo com o nome passado pelo usuário e adicionando o cabeçalho.
echo "$header" > $1

## Modificando a permissão do arquivo, adicionando privilégio de execução.
chmod +x $1

## Abrindo o arquivo recem criado com o editor configurado na variável acima.
$editor $1

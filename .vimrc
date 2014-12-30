" set tabs to spaces "
:set shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" use smartindent for nicely indented code - should find out what autoindent does"
set smartindent

"highlight trailing whitespace as error"
highlight ExtraWhitespace ctermbg=1 guibg=red
:match ExtraWhitespace /\s\+$/

"stop vim creating backup files"
set nobackup
set nowritebackup

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Remap jj to <Esc> in insert mode
:imap jj <Esc>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" % matches {}, [], () by default add <> "
set matchpairs+=<:>

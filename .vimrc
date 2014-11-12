" set tabs to spaces "
:set shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" use smartindent for nicely indented code - should find out what autoindent does"
set smartindent"

"highlight trailing whitespace as error"
:match Error /\s\+$/

"stop vim creating backup files"
set nobackup
set nowritebackup

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" % matches {}, [], () by default add <> "
set matchpairs+=<:>

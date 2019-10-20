" lobster.vim: Vim syntax file for Lobster.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword    lobsterTodo            contained TODO FIXME XXX BUG
syn cluster    lobsterCommentGroup    contains=lobsterTodo
syn region     lobsterComment         start="//" end="$" contains=lobsterGenerate,@lobsterCommentGroup,@Spell
syn region     lobsterComment         start="/\*" end="\*/" contains=@lobsterCommentGroup,@Spell fold
syn match      lobsterComment         "\v(^\s*//.*\n)+" contains=lobsterGenerate,@lobsterCommentGroup,@Spell fold
hi def link    lobsterComment         Comment
hi def link    lobsterTodo            Todo

" TODO better match def name(params):
" syn match lobsterDeclaration /\<def\>/ nextgroup=lobsterFunction,lobsterParams
" syn match lobsterFunction    / *\w\+/

" TODO better matching of struct/class decl

syn keyword    lobsterDeclaration    def struct class
hi def link    lobsterDeclaration    Keyword

syn keyword    lobsterStatement    return import namespace pakfile
hi def link    lobsterStatement    Statement

" TODO any reason to differentiate these?
syn keyword    lobsterKeyword    from program private coroutine typeof enum enum_flags var let
hi def link    lobsterKeyword    Keyword

" control
syn keyword    lobsterConditional    if else switch
syn keyword    lobsterRepeat         for while collectwhile filter exists map
syn keyword    lobsterLabel          case default
hi def link    lobsterConditional    Conditional
hi def link    lobsterRepeat         Repeat
hi def link    lobsterLabel          Label

" types and identifiers
syn keyword    lobsterType          int float string vector coroutine bool void resource
syn keyword    lobsterBoolean       true false 
syn keyword    lobsterIdentifier    nil
hi def link    lobsterType          Type
hi def link    lobsterBoolean       Boolean
hi def link    lobsterIdentifier    lobsterBoolean    

" Operators

" the wordy ones
syn match lobsterOperator /is\|not\|and\|or/

" match single-char operators:          - + * % < > ! =
" and corresponding two-char operators: -= += %= <= >= != &= |= ^= *= ==
syn match lobsterOperator /[-+*%<>!=]=\?/

" match single-char operators: & | ^
syn match lobsterOperator /[&|^]/

" match / and /=
syn match lobsterOperator /\/\%(=\|\ze[^/*]\)/

" match two-char operators << >> && || ++ --
syn match lobsterOperator /<<\|>>\|&&\|||\|++\|--/

hi def link    lobsterOperator    Operator

" Integers
syn match      lobsterDecimalInt        "\<-\=\d\+\%([Ee][-+]\=\d\+\)\=\>"
syn match      lobsterHexadecimalInt    "\<-\=0[xX]\x\+\>"
hi def link    lobsterDecimalInt        Integer
hi def link    lobsterHexadecimalInt    Integer
hi def link    Integer                  Number

" Floating point
syn match      lobsterFloat    "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match      lobsterFloat    "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"
hi def link    lobsterFloat    Float

" Strings
syn match      lobsterEscapeC        display contained +\\[nrt\\'"]+
syn match      lobsterEscapeX        display contained "\\x\x\{2}"
syn cluster    lobsterStringGroup    contains=lobsterEscapeC,lobsterEscapeX
syn region     lobsterString         start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@lobsterStringGroup,@Spell
hi def link    lobsterString         String

" Characters
syn cluster    lobsterCharacterGroup    contains=lobsterEscapeC,lobsterEscapeX
syn region     lobsterCharacter         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@lobsterCharacterGroup

hi def link    lobsterEscapeC          Special
hi def link    lobsterEscapeX          Special
hi def link    lobsterSpecialString    Special
hi def link    lobsterEscapeError      Error
hi def link    lobsterCharacter        Character

" TODO coverage of builtin functions

let b:current_syntax = "lobster"

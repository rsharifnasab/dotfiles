" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

syntax keyword rep always sfg
syntax keyword cond if else then
syntax keyword struct record 
syntax keyword todoo TODO 
syntax keyword bool false true False True 1 0
syntax keyword func dp fsm $display system S
syntax keyword kw in out use hardwired 
syntax keyword typee tc ns reg  sig wire state initial

syntax match operat "\v#"
syntax match operat "\v\="
syntax match operat "\v\=\="
syntax match operat "\v\+"
syntax match operat "\v\-"
syntax match operat "\v\*"
syntax match operat "\v\/"
syntax match operat "\v\?"
syntax match operat "\v\:"
syntax match operat "\v\@"
syntax match operat "\v\<"
syntax match operat "\v\>"
syntax match operat "\v\<\="
syntax match operat "\v\>\="

syntax region coment start="//" end="\n"
syntax region str start="\"" end="\""
syntax region chr start="\'" end="\'"

syn match id '[A-Za-z0-9_]\+'

syn match celNumber '\d\+'
syn match celNumber '[-+]\d\+'
syn match celNumber '[-+]\d\+\.\d*'
syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'


highlight link cond Conditional
highlight link rep Repeat
highlight link str String
highlight link chr Character
highlight link struct Structure
highlight link todoo TODO 
highlight link bool Boolean 
highlight link operat Operator
highlight link func Include
highlight link celNumber Number
highlight link coment Comment
highlight link kw Keyword
highlight link typee Type
highlight link id Identifier

let b:current_syntax = 'simple'

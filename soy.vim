" Vim syntax file
" Language:	Closure Templates (.soy)
" Maintainer:	SASAKI Hiroshi <sasaki@linet.gr.jp>
" Latest Revision: $Date$

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim

syn match soyError "[{}]"

syn region htmlString contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,soyTag
syn region htmlString contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,soyTag
syn region htmlTag start=+<[^/]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,soyTag
syn region htmlComment start=+<!--+ end=+--\s*>+

syn region soyComment start=+/\*+ end=+\*/+
syn region soyComment start=+//+ end=+$+
"syn region soyComment start=+//+ skip="\\$" end=+$+

" soy tag definitions
syn region soyEndTag start=+{/+  end=+}+  contains=soyCommand
syn region soyEndTag start=+{{/+ end=+}}+ contains=soyCommand
syn region soyTag start=+{[^/]+  end=+}+  contains=soyCommand,soySpecialChar,soyVariable,soyArg,htmlString,soyDirective,soyOperator
syn region soyTag start=+{{[^/]+ end=+}}+ contains=soyCommand,soySpecialChar,soyVariable,soyArg,htmlString,soyDirective,soyOperator
syn match  soyTagError contained "[^}]{"ms=s+1

syn match soyVariable contained "\$[A-Za-z0-9]\+"
syn match soyVariable contained "[A-Z]\+"

syn keyword soyArg contained private autoescape
syn keyword soyArg contained desc meaning
syn keyword soyArg contained data

syn keyword soyDirective contained noAutoescape id escapeHtml escapeUri escapeJs insertWordBreaks

syn match soyOperator contained "=="
syn match soyOperator contained "==="
syn match soyOperator contained "!="
syn match soyOperator contained "!=="
syn match soyOperator contained ">="
syn match soyOperator contained "<="
syn match soyOperator contained "<"
syn match soyOperator contained ">"
syn match soyOperator contained "&&"
syn match soyOperator contained "||"
syn match soyOperator contained "+"
syn match soyOperator contained "-"
syn match soyOperator contained "*"
syn match soyOperator contained "/"
syn match soyOperator contained "%"
syn match soyOperator contained "+="
syn match soyOperator contained "-="
syn match soyOperator contained "*="
syn match soyOperator contained "/="
syn match soyOperator contained "%="
syn match soyOperator contained "++"
syn match soyOperator contained "--"

syn match soySpecialTag contained +{sp}+
syn match soySpecialChar contained "sp"
syn match soySpecialChar contained "\\r"
syn match soySpecialChar contained "\\n"
syn match soySpecialChar contained "\\t"

syn keyword soyCommand contained template
syn keyword soyCommand contained literal
syn keyword soyCommand contained print
syn keyword soyCommand contained msg
syn keyword soyCommand contained if elseif else
syn keyword soyCommand contained switch case default
syn keyword soyCommand contained foreach ifempty
syn keyword soyCommand contained for
syn keyword soyCommand contained call param
syn keyword soyCommand contained css

" highlight
hi default link soyError Error
hi default link soyTagError soyError

hi default link soyComment Comment

hi default link soyTag Function
hi default link soyEndTag Function

hi default link soyCommand Statement
hi default link soySpecialChar Statement
hi default link soyVariable Identifier
hi default link soyArg Type
hi default link soyDirective Type
hi default link soyOperator Operator

hi default soySpecialTag ctermfg=DarkBlue

let b:current_syntax = "soy"

" vim: ts=2

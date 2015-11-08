" Vim syntax file
" Language: Stylus
" Maintainer: Marc Harter
" Filenames: *.styl, *.stylus
" Based On: Tim Pope (sass.vim)

if exists("b:current_syntax")
  finish
endif

" Load css syntax
runtime! syntax/css.vim
runtime! after/syntax/css.vim

syn case ignore

syn match stylusImport "@\%(import\|require\)" nextgroup=stylusImportList
syn match stylusImportList "[^;]\+" contained contains=cssString.*,cssMediaType,cssURL

" Everything after this can be contained in cssDefinition

syn match stylusVariable "$[[:alnum:]_-]\+"             containedin=cssDefinition
syn keyword stylusVariable null true false arguments    containedin=cssDefinition
syn match stylusVariableAssignment "\%([[:alnum:]_-]\+\s*\)\@<==" nextgroup=stylusCssAttribute,stylusVariable skipwhite containedin=cssDefinition

" Define css clusters for inclusion in stylus syntax groups
syn cluster stylusCssSelectors  contains=cssTagName,cssSelector,cssPseudo
syn cluster stylusCssValues     contains=cssValue.*
syn cluster stylusCssProperties contains=css.*Prop

syn match stylusProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:"                     contains=@stylusCssProperties,@stylusCssSelectors skipwhite nextgroup=stylusCssAttribute contained containedin=cssDefinition
syn match stylusProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+[ :]\|:[[:alnum:]-]\+\)"hs=s+1 contains=@stylusCssProperties,@stylusCssSelectors skipwhite nextgroup=stylusCssAttribute containedin=cssDefinition
syn match stylusProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1                               contains=@stylusCssProperties,@stylusCssSelectors skipwhite nextgroup=stylusCssAttribute containedin=cssDefinition

syn match stylusInterpolation %{[[:alnum:]_-]\+}% containedin=cssDefinition

syn match stylusFunction "\<\%(red\|green\|blue\|alpha\|dark\|light\)\>(\@="                                   contained containedin=cssDefinition
syn match stylusFunction "\<\%(hue\|saturation\|lightness\|push\|unshift\|typeof\|unit\|match\)\>(\@="         contained containedin=cssDefinition
syn match stylusFunction "\<\%(hsla\|hsl\|rgba\|rgb\|lighten\|darken\)\>(\@="                                  contained containedin=cssDefinition
syn match stylusFunction "\<\%(abs\|ceil\|floor\|round\|min\|max\|even\|odd\|sum\|avg\|sin\|cos\|join\)\>(\@=" contained containedin=cssDefinition
syn match stylusFunction "\<\%(desaturate\|saturate\|invert\|unquote\|quote\|s\)\>(\@="                        contained containedin=cssDefinition
syn match stylusFunction "\<\%(operate\|length\|warn\|error\|last\|p\|\)\>(\@="                                contained containedin=cssDefinition
syn match stylusFunction "\<\%(opposite-position\|image-size\|add-property\)\>(\@="                            contained containedin=cssDefinition

syn keyword stylusControl if else unless for in return containedin=cssDefinition

syn match stylusFuncCall  "+\?[[:alnum:]_-]\+(.*)" containedin=cssDefinition
syn match stylusAmpersand "&"                      containedin=cssDefinition
syn match stylusClass     "\.[[:alnum:]_-]\+"      containedin=cssDefinition
syn match stylusEscape    "^\s*\zs\\"              containedin=cssDefinition
syn match stylusId        "#[[:alnum:]_-]\+"       containedin=cssDefinition

syn region stylusComment  start="//" end="$"       containedin=cssDefinition

hi def link stylusComment               cssComment
hi def link stylusVariable              Special
hi def link stylusFuncCall              Include
hi def link stylusControl               Statement
hi def link stylusFunction              Keyword
hi def link stylusInterpolation         Delimiter

hi def link stylusAmpersand             Character
hi def link stylusClass                 cssClassName
hi def link stylusEscape                Special
hi def link stylusId                    cssIdentifier

hi def link stylusProperty              cssProperty

let b:current_syntax = "stylus"

" vim:set sw=2:

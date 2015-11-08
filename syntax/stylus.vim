" Vim syntax file
" Language: Stylus
" Maintainer: Marc Harter
" Filenames: *.styl, *.stylus
" Based On: Tim Pope (sass.vim)

" Load css syntax
runtime! syntax/css.vim
unlet b:current_syntax

syn case ignore

syn cluster stylusCssSelectors contains=cssTagName,cssSelector,cssPseudo
syn cluster stylusCssValues contains=cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency,cssColorVal,cssCommonVal,cssFontVal,cssListVal,cssTextVal,cssVisualVal,cssBorderVal,cssBackgroundVal,cssFuncVal,cssAdvancedVal
syn cluster stylusCssProperties contains=cssBackgroundProp,cssTableProp,cssBorderProp,cssFontProp,cssColorProp,cssBoxProp,cssTextProp,cssListProp,cssVisualProp,cssAdvancedProp,cssCommonProp,cssSpecialProp

syn match stylusVariable "$\?[[:alnum:]_-]\+"
syn match stylusVariableAssignment "\%([[:alnum:]_-]\+\s*\)\@<==" nextgroup=stylusCssAttribute,stylusVariable skipwhite

syn match stylusProperty "\%([{};]\s*\|^\)\@<=\%([[:alnum:]-]\|#{[^{}]*}\)\+:" contains=@stylusCssProperties,@stylusCssSelectors skipwhite nextgroup=stylusCssAttribute contained containedin=cssDefineBlock
syn match stylusProperty "^\s*\zs\s\%(\%([[:alnum:]-]\|#{[^{}]*}\)\+[ :]\|:[[:alnum:]-]\+\)"hs=s+1 contains=@stylusCssProperties,@stylusCssSelectors skipwhite nextgroup=stylusCssAttribute
syn match stylusProperty "^\s*\zs\s\%(:\=[[:alnum:]-]\+\s*=\)"hs=s+1 contains=@stylusCssProperties,@stylusCssSelectors skipwhite nextgroup=stylusCssAttribute

syn match stylusCssAttribute +\%("\%([^"]\|\\"\)*"\|'\%([^']\|\\'\)*'\|#{[^{}]*}\|[^{};]\)*+ contained contains=@stylusCssValues,cssImportant,stylusFunction,stylusVariable,stylusControl,stylusUserFunction,stylusInterpolation,cssString,stylusComment,cssComment

syn match stylusInterpolation %{[[:alnum:]_-]\+}%

syn match stylusFunction "\<\%(red\|green\|blue\|alpha\|dark\|light\)\>(\@=" contained
syn match stylusFunction "\<\%(hue\|saturation\|lightness\|push\|unshift\|typeof\|unit\|match\)\>(\@=" contained
syn match stylusFunction "\<\%(hsla\|hsl\|rgba\|rgb\|lighten\|darken\)\>(\@=" contained
syn match stylusFunction "\<\%(abs\|ceil\|floor\|round\|min\|max\|even\|odd\|sum\|avg\|sin\|cos\|join\)\>(\@=" contained
syn match stylusFunction "\<\%(desaturate\|saturate\|invert\|unquote\|quote\|s\)\>(\@=" contained
syn match stylusFunction "\<\%(operate\|length\|warn\|error\|last\|p\|\)\>(\@=" contained
syn match stylusFunction "\<\%(opposite-position\|image-size\|add-property\)\>(\@=" contained

syn keyword stylusVariable null true false arguments
syn keyword stylusControl  if else unless for in return

syn match stylusImport "@\%(import\|require\)" nextgroup=stylusImportList
syn match stylusImportList "[^;]\+" contained contains=cssString.*,cssMediaType,cssURL

syn match stylusAmpersand  "&"
syn match stylusClass      "[[:alnum:]_-]\+" contained
syn match stylusClassChar  "\.[[:alnum:]_-]\@=" nextgroup=stylusClass
syn match stylusEscape     "^\s*\zs\\"
syn match stylusId         "[[:alnum:]_-]\+" contained
syn match stylusIdChar     "#[[:alnum:]_-]\@=" nextgroup=stylusId

syn region stylusComment    start="//" end="$" contains=cssTodo,@Spell fold

hi def link stylusComment               cssComment
hi def link stylusVariable              Identifier
hi def link stylusControl               PreProc
hi def link stylusFunction              Function
hi def link stylusInterpolation         Delimiter

hi def link stylusAmpersand             Character
hi def link stylusClass                 cssClassName
hi def link stylusClassChar             cssClassNameDot
hi def link stylusEscape                Special
hi def link stylusId                    cssIdentifier
hi def link stylusIdChar                cssIdentifier

hi def link stylusProperty              cssProperty

let b:current_syntax = "stylus"

" vim:set sw=2:

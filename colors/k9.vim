vim9script
# VIM colour scheme based on Badwolf which is made by Steve Losh.
# Available at http://stevelosh.com/projects/badwolf/
# K9 has minor fixes for the background colour and terminal status bar colour


set background=dark

if exists("syntax_on")
    syntax reset
endif

g:colors_name = "k9"

if !exists("g:badwolf_html_link_underline")
    g:badwolf_html_link_underline = 1
endif

if !exists("g:badwolf_css_props_highlight")
    g:badwolf_css_props_highlight = 0
endif

# }}}
# Palette {{{

g:bwc = {}

# The most basic of all our colors is a slightly tweaked version of the Molokai
# Normal text.
g:bwc.plain = ['f8f6f2', 15]

# Pure and simple.
g:bwc.snow = ['ffffff', 15]
g:bwc.coal = ['000000', 16]

# All of the Gravel colors are based on a brown from Clouds Midnight.
g:bwc.brightgravel   = ['d9cec3', 252]
g:bwc.lightgravel    = ['998f84', 245]
#g:bwc.gravel         = ['857f78', 243]
g:bwc.gravel         = ['857f78', 247]
g:bwc.mediumgravel   = ['666462', 241]
#g:bwc.deepergravel   = ['35322d', 236]
g:bwc.deepgravel     = ['45413b', 247]
g:bwc.deepergravel   = ['35322d', 236]
g:bwc.darkgravel     = ['242321', 235]
#g:bwc.blackgravel    = ['1c1b1a', 233]
g:bwc.blackgravel    = ['1c1b1a', 234]
g:bwc.blackestgravel = ['141413', 232]

# A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
# my desk.
g:bwc.dalespale = ['fade3e', 221]

# A beautiful tan from Tomorrow Night.
g:bwc.dirtyblonde = ['f4cf86', 222]

# Delicious, chewy red from Made of Code for the poppiest highlights.
g:bwc.taffy = ['ff2c4b', 196]

# Another chewy accent, but use sparingly!
g:bwc.saltwatertaffy = ['8cffba', 121]

# The star of the show comes straight from Made of Code.
#
# You should almost never use this.  It should be used for things that denote
# 'where the user is', which basically consists of:
#
# * The cursor
# * A REPL prompt
g:bwc.tardis = ['0a9dff', 39]

# This one's from Mustang, not Florida!
g:bwc.orange = ['ffa724', 214]

# A limier green from Getafe.
g:bwc.lime = ['aeee00', 154]

# Rose's dress in The Idiot's Lantern.
g:bwc.dress = ['ff9eb8', 211]

# Another play on the brown from Clouds Midnight.  I love that color.
g:bwc.toffee = ['b88853', 137]

# Also based on that Clouds Midnight brown.
g:bwc.coffee    = ['c7915b', 173]
g:bwc.darkroast = ['88633f', 95]

# }}}
# Highlighting Function {{{
def HL(group: string, fg: string, ...vargs: list<string>): void
    var histring = 'hi ' .. group .. ' '

    if len(fg) > 0
        if fg == 'fg'
            histring = histring .. 'guifg=fg ctermfg=fg '
        else
            var c = get(g:bwc, fg)
            histring = histring .. 'guifg=#' .. c[0] .. ' ctermfg=' .. c[1] .. ' '
        endif
    endif

    if len(vargs) > 0
        if vargs[0] == 'bg'
            histring = histring .. 'guibg=bg ctermbg=bg '
        else
            if vargs[0] != ''
                var c = get(g:bwc, vargs[0])
                histring = histring .. 'guibg=#' .. c[0] .. ' ctermbg=' .. c[1] .. ' '
            endif
        endif
    endif

    if len(vargs) > 1
        if vargs[1] != ''
            histring = histring .. 'gui=' .. vargs[1] .. ' cterm=' .. vargs[1] .. ' '
        endif
    endif

    if len(vargs) > 2
        if vargs[2] != ''
            var c = get(g:bwc, vargs[2])
            histring = histring .. 'guisp=#' .. c[0] .. ' '
        endif
    endif

    execute histring
enddef
# }}}
# Configuration Options {{{

if exists('g:badwolf_darkgutter') && g:badwolf_darkgutter
    g:gutter = 'blackestgravel'
else
    g:gutter = 'blackgravel'
endif

if exists('g:badwolf_tabline')
    if g:badwolf_tabline == 0
        g:tabline = 'blackestgravel'
    elseif  g:badwolf_tabline == 1
        g:tabline = 'blackgravel'
    elseif  g:badwolf_tabline == 2
        g:tabline = 'darkgravel'
    elseif  g:badwolf_tabline == 3
        g:tabline = 'deepgravel'
    else
        g:tabline = 'blackestgravel'
    endif
else
    g:tabline = 'blackgravel'
endif

# }}}

# Actual colorscheme ----------------------------------------------------------
# Vanilla Vim {{{

# General/UI {{{

call HL('Normal', 'plain', 'blackgravel')

call HL('Folded', 'mediumgravel', 'bg', 'none')

call HL('VertSplit', 'lightgravel', 'bg', 'none')

call HL('CursorLine',   '', 'deepergravel', 'none')
call HL('CursorColumn', '', 'darkgravel')
call HL('ColorColumn',  '', 'darkgravel')

call HL('TabLine', 'plain', g:tabline, 'none')
call HL('TabLineFill', 'plain', g:tabline, 'none')
call HL('TabLineSel', 'coal', 'tardis', 'none')

call HL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call HL('NonText',    'deepgravel', 'bg')
call HL('SpecialKey', 'deepgravel', 'bg')

call HL('Visual',    '',  'deepgravel')
call HL('VisualNOS', '',  'deepgravel')

call HL('Search',    'coal', 'dalespale', 'bold')
call HL('IncSearch', 'coal', 'tardis',    'bold')

call HL('Underlined', 'fg', '', 'underline')

call HL('StatusLine',   'coal', 'tardis',     'bold')
call HL('StatusLineNC', 'snow', 'deepgravel', 'bold')
call HL('StatusLineTerm',   'coal', 'tardis',     'bold')
call HL('StatusLineTermNC', 'snow', 'deepgravel', 'bold')

call HL('Directory', 'dirtyblonde', '', 'bold')

call HL('Title', 'lime')

call HL('ErrorMsg',   'taffy',       'bg', 'bold')
call HL('MoreMsg',    'dalespale',   '',   'bold')
call HL('ModeMsg',    'dirtyblonde', '',   'bold')
call HL('Question',   'dirtyblonde', '',   'bold')
call HL('WarningMsg', 'dress',       '',   'bold')

# This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call HL('Tag', '', '', 'bold')

# hi IndentGuides                  guibg=#373737
# hi WildMenu        guifg=#66D9EF guibg=#000000

# }}}
# Gutter {{{

call HL('LineNr',     'mediumgravel', g:gutter)
call HL('SignColumn', '',             g:gutter)
call HL('FoldColumn', 'mediumgravel', g:gutter)

# }}}
# Cursor {{{

call HL('Cursor',  'coal', 'tardis', 'bold')
call HL('vCursor', 'coal', 'tardis', 'bold')
call HL('iCursor', 'coal', 'tardis', 'none')

# }}}
# Syntax highlighting {{{

# Start with a simple base.
call HL('Special', 'plain')

# Comments are slightly brighter than folds, to make 'headers' easier to see.
call HL('Comment',        'gravel')
call HL('Todo',           'snow', 'bg', 'bold')
call HL('SpecialComment', 'snow', 'bg', 'bold')

# Strings are a nice, pale straw color.  Nothing too fancy.
call HL('String', 'dirtyblonde')

# Control flow stuff is taffy.
call HL('Statement',   'taffy', '', 'bold')
call HL('Keyword',     'taffy', '', 'bold')
call HL('Conditional', 'taffy', '', 'bold')
call HL('Operator',    'taffy', '', 'none')
call HL('Label',       'taffy', '', 'none')
call HL('Repeat',      'taffy', '', 'none')

# Functions and variable declarations are orange, because plain looks weird.
call HL('Identifier', 'orange', '', 'none')
call HL('Function',   'orange', '', 'none')

# Preprocessor stuff is lime, to make it pop.
#
# This includes imports in any given language, because they should usually be
# grouped together at the beginning of a file.  If they're in the middle of some
# other code they should stand out, because something tricky is
# probably going on.
call HL('PreProc',   'lime', '', 'none')
call HL('Macro',     'lime', '', 'none')
call HL('Define',    'lime', '', 'none')
call HL('PreCondit', 'lime', '', 'bold')

# Constants of all kinds are colored together.
# I'm not really happy with the color yet...
call HL('Constant',  'toffee', '', 'bold')
call HL('Character', 'toffee', '', 'bold')
call HL('Boolean',   'toffee', '', 'bold')

call HL('Number', 'toffee', '', 'bold')
call HL('Float',  'toffee', '', 'bold')

# Not sure what 'special character in a constant' means, but let's make it pop.
call HL('SpecialChar', 'dress', '', 'bold')

call HL('Type', 'dress', '', 'none')
call HL('StorageClass', 'taffy', '', 'none')
call HL('Structure', 'taffy', '', 'none')
call HL('Typedef', 'taffy', '', 'bold')

# Make try/catch blocks stand out.
call HL('Exception', 'lime', '', 'bold')

# Misc
call HL('Error',  'snow',   'taffy', 'bold')
call HL('Debug',  'snow',   '',      'bold')
call HL('Ignore', 'gravel', '',      '')

# }}}
# Completion Menu {{{

call HL('Pmenu', 'plain', 'deepergravel')
call HL('PmenuSel', 'coal', 'tardis', 'bold')
call HL('PmenuSbar', '', 'deepergravel')
call HL('PmenuThumb', 'brightgravel')

# }}}
# Diffs {{{

call HL('DiffDelete', 'coal', 'coal')
call HL('DiffAdd',    '',     'deepergravel')
call HL('DiffChange', '',     'darkgravel')
call HL('DiffText',   'snow', 'deepergravel', 'bold')

# }}}
# Spelling {{{

if has("spell")
    call HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call HL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call HL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call HL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

# }}}

# }}}
# Plugins {{{

# CtrlP {{{

   
    call HL('CtrlPNoEntries', 'snow', 'taffy', 'bold')

   
    call HL('CtrlPMatch', 'orange', 'bg', 'none')

   
    call HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

   
    call HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

   
    call HL('CtrlPPrtText', 'plain', 'bg', 'none')

   
    call HL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')

   
    call HL('CtrlPMode1', 'coal', 'tardis', 'bold')

   
    call HL('CtrlPMode2', 'coal', 'tardis', 'bold')

   
    call HL('CtrlPStats', 'coal', 'tardis', 'bold')

   
   
   
   
   
   

# }}}
# EasyMotion {{{

call HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
call HL('EasyMotionShade',  'deepgravel', 'bg')

# }}}
# Interesting Words {{{

# These are only used if you're me or have copied the <leader>hNUM mappings
# from my Vimrc.
call HL('InterestingWord1', 'coal', 'orange')
call HL('InterestingWord2', 'coal', 'lime')
call HL('InterestingWord3', 'coal', 'saltwatertaffy')
call HL('InterestingWord4', 'coal', 'toffee')
call HL('InterestingWord5', 'coal', 'dress')
call HL('InterestingWord6', 'coal', 'taffy')


# }}}
# Makegreen {{{

# hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=coal guibg=#9edf1c
# hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

# }}}
# Rainbow Parentheses {{{

call HL('level16c', 'mediumgravel',   '', 'bold')
call HL('level15c', 'dalespale',      '', '')
call HL('level14c', 'dress',          '', '')
call HL('level13c', 'orange',         '', '')
call HL('level12c', 'tardis',         '', '')
call HL('level11c', 'lime',           '', '')
call HL('level10c', 'toffee',         '', '')
call HL('level9c',  'saltwatertaffy', '', '')
call HL('level8c',  'coffee',         '', '')
call HL('level7c',  'dalespale',      '', '')
call HL('level6c',  'dress',          '', '')
call HL('level5c',  'orange',         '', '')
call HL('level4c',  'tardis',         '', '')
call HL('level3c',  'lime',           '', '')
call HL('level2c',  'toffee',         '', '')
call HL('level1c',  'saltwatertaffy', '', '')

# }}}
# ShowMarks {{{

call HL('ShowMarksHLl', 'tardis', 'blackgravel')
call HL('ShowMarksHLu', 'tardis', 'blackgravel')
call HL('ShowMarksHLo', 'tardis', 'blackgravel')
call HL('ShowMarksHLm', 'tardis', 'blackgravel')

# }}}

# }}}
# Filetype-specific {{{

# Clojure {{{

call HL('clojureSpecial',  'taffy', '', '')
call HL('clojureDefn',     'taffy', '', '')
call HL('clojureDefMacro', 'taffy', '', '')
call HL('clojureDefine',   'taffy', '', '')
call HL('clojureMacro',    'taffy', '', '')
call HL('clojureCond',     'taffy', '', '')

call HL('clojureKeyword', 'orange', '', 'none')

call HL('clojureFunc',   'dress', '', 'none')
call HL('clojureRepeat', 'dress', '', 'none')

call HL('clojureParen0', 'lightgravel', '', 'none')

call HL('clojureAnonArg', 'snow', '', 'bold')

# }}}
# Common Lisp {{{

call HL('lispFunc',           'lime', '', 'none')
call HL('lispVar',            'orange', '', 'bold')
call HL('lispEscapeSpecial',  'orange', '', 'none')

# }}}
# CSS {{{

if g:badwolf_css_props_highlight
    call HL('cssColorProp', 'taffy', '', 'none')
    call HL('cssBoxProp', 'taffy', '', 'none')
    call HL('cssTextProp', 'taffy', '', 'none')
    call HL('cssRenderProp', 'taffy', '', 'none')
    call HL('cssGeneratedContentProp', 'taffy', '', 'none')
else
    call HL('cssColorProp', 'fg', '', 'none')
    call HL('cssBoxProp', 'fg', '', 'none')
    call HL('cssTextProp', 'fg', '', 'none')
    call HL('cssRenderProp', 'fg', '', 'none')
    call HL('cssGeneratedContentProp', 'fg', '', 'none')
end

call HL('cssValueLength', 'toffee', '', 'bold')
call HL('cssColor', 'toffee', '', 'bold')
call HL('cssBraces', 'lightgravel', '', 'none')
call HL('cssIdentifier', 'orange', '', 'bold')
call HL('cssClassName', 'orange', '', 'none')

# }}}
# Diff {{{

call HL('gitDiff', 'lightgravel', '')

call HL('diffRemoved', 'dress', '')
call HL('diffAdded', 'lime', '')
call HL('diffFile', 'coal', 'taffy', 'bold')
call HL('diffNewFile', 'coal', 'taffy', 'bold')

call HL('diffLine', 'coal', 'orange', 'bold')
call HL('diffSubname', 'orange', '', 'none')

# }}}
# Django Templates {{{

call HL('djangoArgument', 'dirtyblonde', '')
call HL('djangoTagBlock', 'orange', '')
call HL('djangoVarBlock', 'orange', '')
# hi djangoStatement guifg=#ff3853 gui=bold
# hi djangoVarBlock guifg=#f4cf86

# }}}
# HTML {{{

# Punctuation
call HL('htmlTag',    'darkroast', 'bg', 'none')
call HL('htmlEndTag', 'darkroast', 'bg', 'none')

# Tag names
call HL('htmlTagName',        'coffee', '', 'bold')
call HL('htmlSpecialTagName', 'coffee', '', 'bold')
call HL('htmlSpecialChar',    'lime',   '', 'none')

# Attributes
call HL('htmlArg', 'coffee', '', 'none')

# Stuff inside an <a> tag

if g:badwolf_html_link_underline
    call HL('htmlLink', 'lightgravel', '', 'underline')
else
    call HL('htmlLink', 'lightgravel', '', 'none')
endif

# }}}
# Java {{{

call HL('javaClassDecl', 'taffy', '', 'bold')
call HL('javaScopeDecl', 'taffy', '', 'bold')
call HL('javaCommentTitle', 'gravel', '')
call HL('javaDocTags', 'snow', '', 'none')
call HL('javaDocParam', 'dalespale', '', '')

# }}}
# LaTeX {{{

call HL('texStatement', 'tardis', '', 'none')
call HL('texMathZoneX', 'orange', '', 'none')
call HL('texMathZoneA', 'orange', '', 'none')
call HL('texMathZoneB', 'orange', '', 'none')
call HL('texMathZoneC', 'orange', '', 'none')
call HL('texMathZoneD', 'orange', '', 'none')
call HL('texMathZoneE', 'orange', '', 'none')
call HL('texMathZoneV', 'orange', '', 'none')
call HL('texMathZoneX', 'orange', '', 'none')
call HL('texMath', 'orange', '', 'none')
call HL('texMathMatcher', 'orange', '', 'none')
call HL('texRefLabel', 'dirtyblonde', '', 'none')
call HL('texRefZone', 'lime', '', 'none')
call HL('texComment', 'darkroast', '', 'none')
call HL('texDelimiter', 'orange', '', 'none')
call HL('texZone', 'brightgravel', '', 'none')

augroup badwolf_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

# }}}
# LessCSS {{{

call HL('lessVariable', 'lime', '', 'none')

# }}}
# Lispyscript {{{

call HL('lispyscriptDefMacro', 'lime', '', '')
call HL('lispyscriptRepeat', 'dress', '', 'none')

# }}}
# REPLs {{{
# This isn't a specific plugin, but just useful highlight classes for anything
# that might want to use them.

call HL('replPrompt', 'tardis', '', 'bold')

# }}}
# Mail {{{

call HL('mailSubject', 'orange', '', 'bold')
call HL('mailHeader', 'lightgravel', '', '')
call HL('mailHeaderKey', 'lightgravel', '', '')
call HL('mailHeaderEmail', 'snow', '', '')
call HL('mailURL', 'toffee', '', 'underline')
call HL('mailSignature', 'gravel', '', 'none')

call HL('mailQuoted1', 'gravel', '', 'none')
call HL('mailQuoted2', 'dress', '', 'none')
call HL('mailQuoted3', 'dirtyblonde', '', 'none')
call HL('mailQuoted4', 'orange', '', 'none')
call HL('mailQuoted5', 'lime', '', 'none')

# }}}
# Markdown {{{

call HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call HL('markdownListMarker', 'lightgravel', '', 'bold')
call HL('markdownItalic', 'snow', '', 'bold')
call HL('markdownBold', 'snow', '', 'bold')
call HL('markdownH1', 'orange', '', 'bold')
call HL('markdownH2', 'lime', '', 'bold')
call HL('markdownH3', 'lime', '', 'none')
call HL('markdownH4', 'lime', '', 'none')
call HL('markdownH5', 'lime', '', 'none')
call HL('markdownH6', 'lime', '', 'none')
call HL('markdownLinkText', 'toffee', '', 'underline')
call HL('markdownIdDeclaration', 'toffee')
call HL('markdownAutomaticLink', 'toffee', '', 'bold')
call HL('markdownUrl', 'toffee', '', 'bold')
call HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call HL('markdownCode', 'dirtyblonde', '', 'none')
call HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

# }}}
# MySQL {{{

call HL('mysqlSpecial', 'dress', '', 'bold')

# }}}
# Python {{{

hi def link pythonOperator Operator
call HL('pythonBuiltin',     'dress')
call HL('pythonBuiltinObj',  'dress')
call HL('pythonBuiltinFunc', 'dress')
call HL('pythonEscape',      'dress')
call HL('pythonException',   'lime', '', 'bold')
call HL('pythonExceptions',  'lime', '', 'none')
call HL('pythonPrecondit',   'lime', '', 'none')
call HL('pythonDecorator',   'taffy', '', 'none')
call HL('pythonRun',         'gravel', '', 'bold')
call HL('pythonCoding',      'gravel', '', 'bold')

# }}}
# SLIMV {{{

# Rainbow parentheses
call HL('hlLevel0', 'gravel')
call HL('hlLevel1', 'orange')
call HL('hlLevel2', 'saltwatertaffy')
call HL('hlLevel3', 'dress')
call HL('hlLevel4', 'coffee')
call HL('hlLevel5', 'dirtyblonde')
call HL('hlLevel6', 'orange')
call HL('hlLevel7', 'saltwatertaffy')
call HL('hlLevel8', 'dress')
call HL('hlLevel9', 'coffee')

# }}}
# Vim {{{

call HL('VimCommentTitle', 'lightgravel', '', 'bold')

call HL('VimMapMod',    'dress', '', 'none')
call HL('VimMapModKey', 'dress', '', 'none')
call HL('VimNotation', 'dress', '', 'none')
call HL('VimBracket', 'dress', '', 'none')

# }}}

# }}}


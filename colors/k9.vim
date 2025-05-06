vim9script
# VIM colour scheme based on Badwolf which is made by Steve Losh.
# Available at http://stevelosh.com/projects/badwolf/
# K9 has minor fixes for the background colour and terminal status bar colour

highlight clear

if exists("syntax_on")
    syntax reset
endif

# }}}
# Palette {{{

var g_bwc = {}

# Added normal colours without funky naming from badwolf
g_bwc.beige = ['#ffffd7', 230]
g_bwc.red = ['#d70000', 160]
g_bwc.darkred = ['#ac0000', 52]
g_bwc.darkgreen = ['#005f00', 22]
g_bwc.darkblue = ['#005fd7', 26]
g_bwc.yellow = ['#af8700', 136]
g_bwc.cyan = ['#6cbfa3', 51]
g_bwc.darkcyan = ['#66cdaa', 51]
g_bwc.purple = ['#943487', 176]
# Pure and simple.
g_bwc.snow = ['#ffffff', 231]
g_bwc.coal = ['#000000', 16]
# All of the Gravel colors are based on a brown from Clouds Midnight.
g_bwc.brightgravel   = ['#d9cec3', 252]
#g_bwc.lightgravel    = ['#998f84', 245]
g_bwc.lightgravel    = ['#6b645c', 245]
#g_bwc.gravel         = ['#857f78', 243]
g_bwc.gravel         = ['#9e9e9e', 247]
g_bwc.mediumgravel   = ['#666462', 241]
g_bwc.deepgravel     = ['#45413b', 238]
g_bwc.deepergravel   = ['#35322d', 236]
#g_bwc.darkgravel     = ['#242321', 235]
g_bwc.darkgravel     = ['#121212', 235]
g_bwc.blackgravel    = ['#1c1b1a', 233]
g_bwc.blackestgravel = ['#141413', 232]
# A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
# my desk.
g_bwc.dalespale = ['#fade3e', 221]
# Another chewy accent, but use sparingly!
g_bwc.saltwatertaffy = ['#8cffba', 121]
#g_bwc.tardis = ['#0071bd', 39]
#g_bwc.darktardis = ['#26a8ff', 39]
# Another play on the brown from Clouds Midnight.  I love that color.
g_bwc.toffee = ['#b88853', 137]
# Also based on that Clouds Midnight brown.
g_bwc.coffee    = ['#c7915b', 173]
g_bwc.darkroast = ['#88633f', 95]
# Delicious, chewy red from Made of Code for the poppiest highlights.
#g_bwc.taffy = ['#ff2c4b', 196]
g_bwc.taffy = ['#ff2c4b', 197]
g_bwc.darktaffy = ['#df0021', 197]
# This one's from Mustang, not Florida!
g_bwc.orange = ['#ffa724', 214]
g_bwc.tardis = ['#0a9dff', 39]
g_bwc.darktardis = ['#0071bd', 39]
g_bwc.lighttardis = ['#26a8ff', 39]
# A beautiful tan from Tomorrow Night.
g_bwc.dirtyblonde = ['#f4cf86', 222]
g_bwc.darkdirtyblonde = ['#eeb340', 222]
# A limier green from Getafe.
g_bwc.lime = ['#aeee00', 154]
g_bwc.darklime = ['#8bbe00', 154]
# Rose's dress in The Idiot's Lantern.
g_bwc.dress = ['#ff87af', 211]
g_bwc.darkpink = ['#ff5990', 211]
# The most basic of all our colors is a slightly tweaked version of the Molokai
# Normal text.
g_bwc.plain = ['#f8f6f2', 15]

g_bwc.normal_bg = g_bwc.blackgravel
g_bwc.visual_bg = g_bwc.deepgravel
g_bwc.cursor_line_bg =  g_bwc.deepergravel
g_bwc.sign_column_bg = g_bwc.blackgravel
g_bwc.tab_line_bg = g_bwc.blackgravel
g_bwc.menu_text = g_bwc.coal
g_bwc.menu_sel_text = g_bwc.coal
g_bwc.pmenu_bg = g_bwc.lightgravel
g_bwc.pmenu_sel_bg = g_bwc.tardis
g_bwc.status_line_text = g_bwc.coal
g_bwc.status_line_nc_text = g_bwc.gravel
g_bwc.status_line_nc_bg = g_bwc.deepgravel
g_bwc.quick_fix_line_text = g_bwc.snow
g_bwc.tab_line_text = g_bwc.plain
g_bwc.tab_line_fill_text = g_bwc.plain
g_bwc.tab_line_sel_text = g_bwc.coal
g_bwc.special_key_text = g_bwc.deepgravel
g_bwc.todo_text = g_bwc.snow
g_bwc.comment_text = g_bwc.gravel
g_bwc.java_doc_tags_text = g_bwc.snow
g_bwc.java_doc_param_text = g_bwc.dalespale
g_bwc.question_text = g_bwc.snow
g_bwc.vert_split_text = g_bwc.lightgravel
g_bwc.vert_split_bg  = g_bwc.deepergravel
g_bwc.status_line_term_text = g_bwc.coal
g_bwc.ctrlp_match_text = g_bwc.snow
g_bwc.ctrlp_match_bg = g_bwc.purple
g_bwc.visual_text = g_bwc.snow

if &background != "dark"
    g_bwc.lightgravel = ['#6b645c', 242]
    g_bwc.deepgravel     = g_bwc.brightgravel
    g_bwc.purple = ['#afafff', 147]
    g_bwc.taffy = ['#800114', 124]
    g_bwc.tardis = ['#005faf', 25]
    g_bwc.dirtyblonde = ['#6d6200', 58]
    g_bwc.orange = ['#cd5a00', 166]
    g_bwc.lime = ['#5f8700', 64]
    g_bwc.dress = ['#c6426a', 132]
    g_bwc.normal_bg = g_bwc.snow
    g_bwc.sign_column_bg = g_bwc.snow
    g_bwc.tab_line_bg = g_bwc.snow
    g_bwc.ctrlp_match_text = g_bwc.coal
    g_bwc.ctrlp_match_bg = g_bwc.purple
    g_bwc.tab_line_sel_text = g_bwc.snow
    g_bwc.plain = g_bwc.coal
    g_bwc.visual_text = g_bwc.coal
    g_bwc.visual_bg = g_bwc.beige
    g_bwc.cursor_line_bg =  g_bwc.beige
    g_bwc.menu_text = g_bwc.coal
    g_bwc.menu_sel_text = g_bwc.snow
    g_bwc.pmenu_bg = g_bwc.brightgravel
    g_bwc.pmenu_sel_bg = g_bwc.tardis
    g_bwc.status_line_text = g_bwc.snow
    g_bwc.status_line_nc_text = g_bwc.snow
    g_bwc.status_line_nc_bg = g_bwc.gravel
    g_bwc.quick_fix_line_text = g_bwc.darkgravel
    g_bwc.tab_line_text = g_bwc.coal
    g_bwc.tab_line_fill_text = g_bwc.snow
    g_bwc.special_key_text = g_bwc.brightgravel
    g_bwc.todo_text = g_bwc.lightgravel
    g_bwc.comment_text = g_bwc.lightgravel
    g_bwc.java_doc_tags_text = g_bwc.lightgravel
    g_bwc.java_doc_param_text = g_bwc.lightgravel
    g_bwc.question_text = g_bwc.orange
    g_bwc.vert_split_text = g_bwc.tardis
    g_bwc.vert_split_bg  = g_bwc.brightgravel
    g_bwc.status_line_term_text = g_bwc.snow
endif

def Html_colour(name: string): string
    return g_bwc[name][0]
enddef

# 0    black
# 1    dark red
# 2    dark green
# 3    dark yellow
# 4    dark blue
# 5    dark magenta
# 6    dark cyan
# 7    light grey
# 8    dark grey
# 9    red
# 10   green
# 11   yellow
# 12   blue
# 13   magenta
# 14   cyan
# 15   white
if &termguicolors
    g:terminal_ansi_colors = [
        g_bwc["coal"][0],
        g_bwc["taffy"][0],
        g_bwc["darklime"][0],
        g_bwc["darkdirtyblonde"][0],
        g_bwc["tardis"][0],
        g_bwc["darkpink"][0],
        g_bwc["darkcyan"][0],
        g_bwc["brightgravel"][0],
        g_bwc["lightgravel"][0],
        g_bwc["darktaffy"][0],
        g_bwc["lime"][0],
        g_bwc["dirtyblonde"][0],
        g_bwc["lighttardis"][0],
        g_bwc["dress"][0],
        g_bwc["cyan"][0],
        g_bwc["snow"][0]
    ]
endif

def HL(group: string, fg: string, ...vargs: list<string>): void
    var histring = 'hi ' .. group .. ' '

    if len(fg) > 0
        if fg == 'fg'
            histring = histring .. 'guifg=fg ctermfg=fg '
        else
            var c = get(g_bwc, fg)
            histring = histring .. 'guifg=' .. c[0] .. ' ctermfg=' .. c[1] .. ' '
        endif
    endif

    if len(vargs) > 0
        if vargs[0] == 'bg'
            histring = histring .. 'guibg=bg ctermbg=bg '
        else
            if vargs[0] != ''
                var c = get(g_bwc, vargs[0])
                histring = histring .. 'guibg=' .. c[0] .. ' ctermbg=' .. c[1] .. ' '
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
            var c = get(g_bwc, vargs[2])
            histring = histring .. 'guisp=' .. c[0] .. ' '
        endif
    endif

    execute histring
enddef

HL('Normal', 'plain', 'normal_bg')

HL('Folded', 'mediumgravel', 'bg', 'none')

#HL('VertSplit', 'lightgravel', 'bg', 'none')
HL('VertSplit', 'vert_split_text', 'vert_split_bg', 'none')

HL('CursorLine',   '', 'cursor_line_bg', 'none')
HL('CursorColumn', '', 'cursor_line_bg')
HL('ColorColumn',  '', 'cursor_line_bg')

HL('TabLine', 'tab_line_text', 'tab_line_bg', 'bold')
HL('TabLineFill', 'tab_line_fill_text', 'tab_line_bg', 'bold')
HL('TabLineSel', 'tab_line_sel_text', 'tardis', 'bold')

HL('MatchParen', 'dalespale', 'darkgravel', 'bold')
HL('QuickFixLine', 'quick_fix_line_text', 'bg', 'none')
HL('qfLineNr', 'snow', 'bg', 'none')
HL('qfFileName', 'snow', 'bg', 'none')

HL('NonText',    'deepgravel', 'bg')
HL('SpecialKey', 'special_key_text', 'bg')

HL('Visual',    'visual_text',  'visual_bg')
HL('VisualNOS', 'visual_text',  'visual_bg')

HL('Search',    'coal', 'dalespale', 'bold')
HL('IncSearch', 'coal', 'tardis',    'bold')

HL('Underlined', 'fg', '', 'underline')

#HL('StatusLine',   'coal', 'blackgravel',     'bold')
#HL('StatusLineNC', 'snow', 'deepgravel', 'bold')
HL('StatusLine',   'status_line_text', 'tardis',     'bold')
HL('StatusLineNC', 'status_line_nc_text', 'status_line_nc_bg', 'bold')
HL('StatusLineTerm',   'status_line_term_text', 'tardis',     'bold')
HL('StatusLineTermNC', 'snow', 'deepgravel', 'bold')

HL('Directory', 'dirtyblonde', '', 'bold')

HL('Title', 'lime')

#HL('ErrorMsg',   'taffy',       'bg', 'bold')
HL('MoreMsg',    'dalespale',   '',   'bold')
HL('ModeMsg',    'dirtyblonde', '',   'bold')
#HL('Question',   'dirtyblonde', '',   'bold')
#HL('WarningMsg', 'dress',       '',   'bold')
HL('Question',   'question_text', '',   'bold')
HL('WarningMsg', 'orange',       '',   'bold')
HL('ErrorMsg',   'red',       'bg', 'underline')

# This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
HL('Tag', '', '', 'bold')

# hi IndentGuides                  guibg=#373737
# hi WildMenu        guifg=#66D9EF guibg=#000000

# }}}
# Gutter {{{

HL('LineNr',     'mediumgravel', 'sign_column_bg')
HL('SignColumn', '',             'sign_column_bg')
HL('FoldColumn', 'mediumgravel', 'sign_column_bg')

# }}}
# Cursor {{{

HL('Cursor',  'coal', 'tardis', 'bold')
HL('vCursor', 'coal', 'tardis', 'bold')
HL('iCursor', 'coal', 'tardis', 'none')

# }}}
# Syntax highlighting {{{

# Start with a simple base.
HL('Special', 'plain')

# Comments are slightly brighter than folds, to make 'headers' easier to see.
HL('Comment',        'comment_text')
HL('Todo',           'todo_text', 'bg', 'bold')
HL('SpecialComment', 'todo_text', 'bg', 'bold')

# Strings are a nice, pale straw color.  Nothing too fancy.
HL('String', 'dirtyblonde')

# Control flow stuff is taffy.
HL('Statement',   'taffy', '', 'bold')
HL('Keyword',     'taffy', '', 'bold')
HL('Conditional', 'taffy', '', 'bold')
HL('Operator',    'taffy', '', 'none')
HL('Label',       'taffy', '', 'none')
HL('Repeat',      'taffy', '', 'none')

# Functions and variable declarations are orange, because plain looks weird.
HL('Identifier', 'orange', '', 'none')
HL('Function',   'orange', '', 'none')

# Preprocessor stuff is lime, to make it pop.
#
# This includes imports in any given language, because they should usually be
# grouped together at the beginning of a file.  If they're in the middle of some
# other code they should stand out, because something tricky is
# probably going on.
HL('PreProc',   'lime', '', 'none')
HL('Macro',     'lime', '', 'none')
HL('Define',    'lime', '', 'none')
HL('PreCondit', 'lime', '', 'bold')

# Constants of all kinds are colored together.
# I'm not really happy with the color yet...
HL('Constant',  'toffee', '', 'bold')
HL('Character', 'toffee', '', 'bold')
HL('Boolean',   'toffee', '', 'bold')

HL('Number', 'toffee', '', 'bold')
HL('Float',  'toffee', '', 'bold')

# Not sure what 'special character in a constant' means, but let's make it pop.
HL('SpecialChar', 'dress', '', 'bold')

HL('Type', 'dress', '', 'none')
HL('StorageClass', 'taffy', '', 'none')
HL('Structure', 'taffy', '', 'none')
HL('Typedef', 'taffy', '', 'bold')

# Make try/catch blocks stand out.
HL('Exception', 'lime', '', 'bold')

# Misc
HL('Error',  'snow',   'red', 'bold')
HL('Debug',  'snow',   '',      'bold')
HL('Ignore', 'gravel', '',      '')

# }}}
# Completion Menu {{{

HL('Pmenu', 'menu_text', 'pmenu_bg')
HL('PmenuSel', 'menu_sel_text', 'pmenu_sel_bg', 'bold')
#HL('PmenuSel', 'plain', 'deepgravel', 'bold')
HL('PmenuSbar', '', 'deepergravel')
HL('PmenuThumb', 'brightgravel')

# }}}
# Diffs {{{

#HL('DiffDelete', 'coal', 'coal')
#HL('DiffAdd',    '',     'deepergravel')
#HL('DiffChange', '',     'darkgravel')
#HL('DiffText',   'snow', 'deepergravel', 'bold')
HL('DiffDelete', 'snow', 'darkred')
HL('DiffAdd',    'snow',     'darkgreen')
HL('DiffChange', 'snow',     'darkblue')
HL('DiffText',   'snow', 'yellow', 'bold')

# }}}
# Spelling {{{

#if has("spell")
#    HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
#    HL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
#    HL('SpellLocal', '', '', 'undercurl', 'dalespale')
#    HL('SpellRare', '', '', 'undercurl', 'dalespale')
#endif

hi SpellBad   guisp=red    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellCap   guisp=yellow gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellRare  guisp=blue   gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
hi SpellLocal guisp=orange gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline

# }}}

# }}}
# Plugins {{{

# CtrlP {{{
HL('CtrlPNoEntries', 'snow', 'taffy', 'bold')


#HL('CtrlPMatch', 'orange', 'bg', 'none')
HL('CtrlPMatch', 'ctrlp_match_text', 'ctrlp_match_bg', 'bold')


HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')


HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')


HL('CtrlPPrtText', 'plain', 'bg', 'none')


HL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')


HL('CtrlPMode1', 'coal', 'tardis', 'bold')


HL('CtrlPMode2', 'coal', 'tardis', 'bold')


HL('CtrlPStats', 'coal', 'tardis', 'bold')
# }}}

# EasyMotion {{{

HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
HL('EasyMotionShade',  'deepgravel', 'bg')

# }}}
# Interesting Words {{{

# These are only used if you're me or have copied the <leader>hNUM mappings
# from my Vimrc.
HL('InterestingWord1', 'coal', 'orange')
HL('InterestingWord2', 'coal', 'lime')
HL('InterestingWord3', 'coal', 'saltwatertaffy')
HL('InterestingWord4', 'coal', 'toffee')
HL('InterestingWord5', 'coal', 'dress')
HL('InterestingWord6', 'coal', 'taffy')

# }}}
# Makegreen {{{

# hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=coal guibg=#9edf1c
# hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

# }}}
# Rainbow Parentheses {{{

HL('level16c', 'mediumgravel',   '', 'bold')
HL('level15c', 'dalespale',      '', '')
HL('level14c', 'dress',          '', '')
HL('level13c', 'orange',         '', '')
HL('level12c', 'tardis',         '', '')
HL('level11c', 'lime',           '', '')
HL('level10c', 'toffee',         '', '')
HL('level9c',  'saltwatertaffy', '', '')
HL('level8c',  'coffee',         '', '')
HL('level7c',  'dalespale',      '', '')
HL('level6c',  'dress',          '', '')
HL('level5c',  'orange',         '', '')
HL('level4c',  'tardis',         '', '')
HL('level3c',  'lime',           '', '')
HL('level2c',  'toffee',         '', '')
HL('level1c',  'saltwatertaffy', '', '')

# }}}
# ShowMarks {{{

HL('ShowMarksHLl', 'tardis', 'blackgravel')
HL('ShowMarksHLu', 'tardis', 'blackgravel')
HL('ShowMarksHLo', 'tardis', 'blackgravel')
HL('ShowMarksHLm', 'tardis', 'blackgravel')

# }}}

# }}}
# Filetype-specific {{{

# Clojure {{{

HL('clojureSpecial',  'taffy', '', '')
HL('clojureDefn',     'taffy', '', '')
HL('clojureDefMacro', 'taffy', '', '')
HL('clojureDefine',   'taffy', '', '')
HL('clojureMacro',    'taffy', '', '')
HL('clojureCond',     'taffy', '', '')

HL('clojureKeyword', 'orange', '', 'none')

HL('clojureFunc',   'dress', '', 'none')
HL('clojureRepeat', 'dress', '', 'none')

HL('clojureParen0', 'lightgravel', '', 'none')

HL('clojureAnonArg', 'snow', '', 'bold')

# }}}
# Common Lisp {{{

HL('lispFunc',           'lime', '', 'none')
HL('lispVar',            'orange', '', 'bold')
HL('lispEscapeSpecial',  'orange', '', 'none')

# }}}
# CSS {{{

HL('cssColorProp', 'taffy', '', 'none')
HL('cssBoxProp', 'taffy', '', 'none')
HL('cssTextProp', 'taffy', '', 'none')
HL('cssRenderProp', 'taffy', '', 'none')
HL('cssGeneratedContentProp', 'taffy', '', 'none')

HL('cssValueLength', 'toffee', '', 'bold')
HL('cssColor', 'toffee', '', 'bold')
HL('cssBraces', 'lightgravel', '', 'none')
HL('cssIdentifier', 'orange', '', 'bold')
HL('cssClassName', 'orange', '', 'none')

# }}}
# Diff {{{

HL('gitDiff', 'lightgravel', '')

HL('diffRemoved', 'dress', '')
HL('diffAdded', 'lime', '')
HL('diffFile', 'snow', 'darkgravel', 'bold')
HL('diffNewFile', 'snow', 'darkgravel', 'bold')

HL('diffLine', 'coal', 'orange', 'bold')
HL('diffSubname', 'orange', '', 'none')

# }}}
# Django Templates {{{

HL('djangoArgument', 'dirtyblonde', '')
HL('djangoTagBlock', 'orange', '')
HL('djangoVarBlock', 'orange', '')
# hi djangoStatement guifg=#ff3853 gui=bold
# hi djangoVarBlock guifg=#f4cf86

# }}}
# HTML {{{

# Punctuation
HL('htmlTag',    'darkroast', 'bg', 'none')
HL('htmlEndTag', 'darkroast', 'bg', 'none')

# Tag names
HL('htmlTagName',        'coffee', '', 'bold')
HL('htmlSpecialTagName', 'coffee', '', 'bold')
HL('htmlSpecialChar',    'lime',   '', 'none')

# Attributes
HL('htmlArg', 'coffee', '', 'none')

# Stuff inside an <a> tag

HL('htmlLink', 'lightgravel', '', 'underline')

# }}}
# Java {{{

HL('javaClassDecl', 'taffy', '', 'bold')
HL('javaScopeDecl', 'taffy', '', 'bold')
HL('javaCommentTitle', 'gravel', '')
HL('javaDocTags', 'java_doc_tags_text', '', 'none')
HL('javaDocParam', 'java_doc_param_text', '', '')

# }}}
# LaTeX {{{

HL('texStatement', 'tardis', '', 'none')
HL('texMathZoneX', 'orange', '', 'none')
HL('texMathZoneA', 'orange', '', 'none')
HL('texMathZoneB', 'orange', '', 'none')
HL('texMathZoneC', 'orange', '', 'none')
HL('texMathZoneD', 'orange', '', 'none')
HL('texMathZoneE', 'orange', '', 'none')
HL('texMathZoneV', 'orange', '', 'none')
HL('texMathZoneX', 'orange', '', 'none')
HL('texMath', 'orange', '', 'none')
HL('texMathMatcher', 'orange', '', 'none')
HL('texRefLabel', 'dirtyblonde', '', 'none')
HL('texRefZone', 'lime', '', 'none')
HL('texComment', 'darkroast', '', 'none')
HL('texDelimiter', 'orange', '', 'none')
HL('texZone', 'brightgravel', '', 'none')

augroup badwolf_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

# }}}
# LessCSS {{{

HL('lessVariable', 'lime', '', 'none')

# }}}
# Lispyscript {{{

HL('lispyscriptDefMacro', 'lime', '', '')
HL('lispyscriptRepeat', 'dress', '', 'none')

# }}}
# REPLs {{{
# This isn't a specific plugin, but just useful highlight classes for anything
# that might want to use them.

HL('replPrompt', 'tardis', '', 'bold')

# }}}
# Mail {{{

HL('mailSubject', 'orange', '', 'bold')
HL('mailHeader', 'lightgravel', '', '')
HL('mailHeaderKey', 'lightgravel', '', '')
HL('mailHeaderEmail', 'snow', '', '')
HL('mailURL', 'toffee', '', 'underline')
HL('mailSignature', 'gravel', '', 'none')

HL('mailQuoted1', 'gravel', '', 'none')
HL('mailQuoted2', 'dress', '', 'none')
HL('mailQuoted3', 'dirtyblonde', '', 'none')
HL('mailQuoted4', 'orange', '', 'none')
HL('mailQuoted5', 'lime', '', 'none')

# }}}
# Markdown {{{

HL('markdownHeadingRule', 'lightgravel', '', 'bold')
HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
HL('markdownListMarker', 'lightgravel', '', 'bold')
HL('markdownItalic', 'snow', '', 'bold')
HL('markdownBold', 'snow', '', 'bold')
HL('markdownH1', 'orange', '', 'bold')
HL('markdownH2', 'lime', '', 'bold')
HL('markdownH3', 'lime', '', 'none')
HL('markdownH4', 'lime', '', 'none')
HL('markdownH5', 'lime', '', 'none')
HL('markdownH6', 'lime', '', 'none')
HL('markdownLinkText', 'toffee', '', 'underline')
HL('markdownIdDeclaration', 'toffee')
HL('markdownAutomaticLink', 'toffee', '', 'bold')
HL('markdownUrl', 'toffee', '', 'bold')
HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
HL('markdownCode', 'dirtyblonde', '', 'none')
HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

# }}}
# MySQL {{{

HL('mysqlSpecial', 'dress', '', 'bold')

# }}}
# Python {{{

hi def link pythonOperator Operator
HL('pythonBuiltin',     'dress')
HL('pythonBuiltinObj',  'dress')
HL('pythonBuiltinFunc', 'dress')
HL('pythonEscape',      'dress')
HL('pythonException',   'lime', '', 'bold')
HL('pythonExceptions',  'lime', '', 'none')
HL('pythonPrecondit',   'lime', '', 'none')
HL('pythonDecorator',   'taffy', '', 'none')
HL('pythonRun',         'gravel', '', 'bold')
HL('pythonCoding',      'gravel', '', 'bold')

# }}}
# SLIMV {{{

# Rainbow parentheses
HL('hlLevel0', 'gravel')
HL('hlLevel1', 'orange')
HL('hlLevel2', 'saltwatertaffy')
HL('hlLevel3', 'dress')
HL('hlLevel4', 'coffee')
HL('hlLevel5', 'dirtyblonde')
HL('hlLevel6', 'orange')
HL('hlLevel7', 'saltwatertaffy')
HL('hlLevel8', 'dress')
HL('hlLevel9', 'coffee')

# }}}
# Vim {{{

HL('VimCommentTitle', 'lightgravel', '', 'bold')

HL('VimMapMod',    'dress', '', 'none')
HL('VimMapModKey', 'dress', '', 'none')
HL('VimNotation', 'dress', '', 'none')
HL('VimBracket', 'dress', '', 'none')

# }}}

# }}}
HL('User1', 'snow', 'darktardis', 'none')

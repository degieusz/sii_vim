if exists("b:current_syntax")
  finish
endif

syn match k3txtFunctionEnter "Function Enter.*" contains=k3txtParamName
syn match k3txtFunctionLeave "Function Leave.*"  contains=k3txtParamName
syn match k3txtParamName "\w*:=" nextgroup=k3txtParamValue
"syn match k3txtParamValue ":=[a-zA-Z0-9_\*\?-\'\" /\.\-\+]*" contains=k3txtString
syn match k3txtAnyPort "ANY PORT.receive"
syn match k3txtSackMsg "\<SACK\.\w*\(Req\|Resp\|Ind\)[a-zA-Z0-9_]*\>"
syn match k3txtLomMsg "\<LOM\.\w*\(Req\|Resp\|Ind\)[a-zA-Z0-9_]*\>"
syn match k3txtLomTracingMsg "\<LOM_Messages\.\w*\(Req\|Resp\|Ind\)[a-zA-Z0-9_]*\>"
syn match k3txtTrash "^[0-9T\.]* " contains=k3txtTime
syn match k3txtTime "T[0-9]\{6\}"
syn keyword k3txtMismatch MISMATCH
syn match k3NewVerdict "New verdict.*"
syn match k3FinalVerdict "Final Verdict:.*"
syn match k3txtFilename "\S*\.ttcn3"
syn match k3txtComponent "\(Fsp-[0-9]\|Fcm\|Btsom\|MTC\|k3r\)"
syn match k3txtMessageQueued " Message Queued "
syn match k3txtReceived " Received:* "
syn match k3txtLineNumber "\(:\|#\)[0-9]\+"
syn region k3txtBrace  start="{" end="}" contains=ALL
syn region k3txtString start=/"/ skip=/\\"/ end=/"/ oneline
syn match k3FinalVerdict "/// Message NOT consumed"

hi k3txtFunctionEnter           guifg=YellowGreen       guibg=NONE      gui=BOLD      ctermbg=NONE      ctermfg=green      cterm=BOLD
hi k3txtFunctionLeave           guifg=Plum              guibg=NONE      gui=BOLD      ctermbg=NONE      ctermfg=gray       cterm=NONE
hi k3txtParamName               guifg=Khaki             guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=yellow     cterm=NONE
"hi k3txtParamValue              guifg=LightSteelBlue    guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=blue       cterm=NONE
hi k3txtTrash                   guifg=darkgray          guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=darkgray   cterm=NONE
hi k3txtTime                    guifg=Gold              guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=darkgray   cterm=NONE
hi k3txtLineNumber              guifg=MistyRose         guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=darkgray   cterm=NONE
hi k3txtBrace                   guifg=LightSteelBlue    guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=blue       cterm=NONE
hi k3txtString                  guifg=LightCoral        guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=blue       cterm=NONE

hi k3txtReceived                guifg=orange1           guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3txtMessageQueued           guifg=tan3              guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3txtSackMsg                 guifg=Gold              guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3txtLomMsg                  guifg=magenta           guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3txtLomTracingMsg           guifg=green             guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3FinalVerdict               guifg=red               guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=red        cterm=BOLD
hi k3NewVerdict                 guifg=yellow            guibg=NONE      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3txtFilename                guifg=bisque1           guibg=NONE      gui=NONE      ctermbg=NONE      ctermfg=gray       cterm=BOLD

let b:current_syntax = "nsn-k3txt"


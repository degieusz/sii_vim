
if exists("b:current_syntax")
  finish
endif

syn match syslogNumber "\<\d*\>"

" cplane components
syn keyword dummy1 RROMexe
syn keyword dummy2 CELLCexe
syn keyword dummy3 ENBCexe
syn keyword dummy4 UECexe
syn keyword dummy5 TUPcexe
syn keyword dummy6 BTSOMex

" headers
syn match syslogDbg "DBG/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match syslogInf "INF/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match syslogErr "ERR/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match syslogWrn "WRN/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match Error "ERR/CCS/AaError"

syn match syslogLineNumber "\(#\|:\)[0-9]\+"

" time
syn match syslogType "<[0-9\.: ]*>" contains=syslogTime
syn match syslogTime "\d\d:\d\d:\d\d"
syn match syslogTimer "\(\(start\|stop\)Timer\| timer \)"
syn match syslogExpired "\(expired\|timeout\)"
syn match syslogUknown "\(u\|U\)nknown"
syn match syslogHexNumber "0x[0-9a-zA-Z]\+"
syn match syslogId "\s\(id\|Id\|ID\)"
syn match syslogEvent "\s\(event\|Event\|EVENT\)[a-zA-Z]*"
syn match syslogMsg   "\s\(message\|Message\|msg\|Msg\|MSG\)[a-zA-Z]*"
syn match syslogMessages "[0-9a-zA-Z_]\+\(Resp\|Req\|Ind\) "

" HW
syn match Constant "\(FSP\|FCT\)-[0-9A-F]*"
syn match syslogTrash "^[0-9 \.:\[\]a-fX]*"

hi dummy1                      guifg=IndianRed      guibg=NONE      gui=BOLD      ctermbg=brown     ctermfg=white     cterm=BOLD
hi dummy2                      guifg=cyan           guibg=NONE      gui=bold      ctermbg=cyan      ctermfg=white     cterm=BOLD
hi dummy3                      guifg=YellowGreen    guibg=NONE      gui=bold      ctermbg=magenta   ctermfg=white     cterm=BOLD
hi dummy4                      guifg=SteelBlue1     guibg=NONE      gui=bold      ctermbg=blue      ctermfg=white     cterm=BOLD
hi dummy5                      guifg=MediumOrchid   guibg=NONE      gui=bold      ctermbg=green     ctermfg=white     cterm=BOLD
hi dummy6                      guifg=orange         guibg=NONE      gui=bold      ctermbg=yellow    ctermfg=white     cterm=BOLD

hi syslogType                  guifg=DarkKhaki      guibg=NONE      gui=none      ctermfg=darkgray   ctermbg=NONE     cterm=BOLD
hi syslogTime                  guifg=Khaki          guibg=NONE      gui=none      ctermfg=yellow     ctermbg=NONE     cterm=BOLD
hi syslogTimer                 guifg=violet         guibg=NONE      gui=bold      ctermfg=yellow     ctermbg=NONE     cterm=BOLD
hi syslogUknown                guifg=Yellow         guibg=NONE      gui=bold      ctermfg=yellow     ctermbg=NONE     cterm=BOLD
hi syslogExpired               guifg=Yellow         guibg=NONE      gui=bold      ctermfg=yellow     ctermbg=NONE     cterm=BOLD
hi syslogHexNumber                                  guibg=NONE      gui=bold                         ctermbg=NONE     cterm=BOLD
hi syslogId                                         guibg=NONE      gui=bold                         ctermbg=NONE     cterm=BOLD
hi syslogEvent                 guifg=khaki3         guibg=NONE      gui=bold                         ctermbg=NONE     cterm=BOLD
hi syslogMsg                   guifg=khaki         guibg=NONE      gui=bold                         ctermbg=NONE     cterm=BOLD
hi syslogMessages              guifg=cornsilk       guibg=NONE      gui=bold                         ctermbg=NONE     cterm=BOLD

hi syslogErr                   guifg=white          guibg=red       gui=bold      ctermfg=darkgray   ctermbg=NONE     cterm=BOLD
hi syslogDbg                   guifg=LightSteelBlue guibg=NONE      gui=bold      ctermfg=darkgray   ctermbg=NONE     cterm=BOLD
hi syslogInf                   guifg=MediumSeaGreen guibg=NONE      gui=bold      ctermfg=darkgreen  ctermbg=NONE     cterm=BOLD
hi syslogWrn                   guifg=gold           guibg=NONE      gui=bold      ctermfg=darkyellow ctermbg=NONE     cterm=BOLD

hi syslogLineNumber            guifg=MistyRose      guibg=NONE      gui=NONE      ctermbg=NONE       ctermfg=darkgray cterm=NONE
hi syslogTrash                 guifg=darkgray       guibg=NONE      gui=NONE      ctermfg=darkgray   ctermbg=NONE     cterm=NONE
hi syslogNumber                cterm=BOLD


let b:current_syntax = "nsn-syslog"

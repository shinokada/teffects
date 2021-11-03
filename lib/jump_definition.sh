parser_definition_jump() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} jump [options] [arguments]" ''

    msg -- 'Creates animated glowing texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="aquamarine" -- "$VAR_BCOLOR Default: aquamarine"
    param COLOR -c --color init:="#de38c8" -- "$VAR_COLOR Default: #de38c8"
    param LPADDING -l --letterpadding init:="0 7px" -- "$VAR_LPADDING"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE Default: 6vw."
    param TEXT -t --text init:="TEFFECTS JUMP" -- "$VAR_TEXT"
    disp :usage -h --help
}

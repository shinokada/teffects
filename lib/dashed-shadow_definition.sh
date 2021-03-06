DASHED_TYPES='h | s | i | d'

parser_definition_dashed-shadow() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} dashed-shadow [options] [arguments]" ''

    msg -- 'Creates animated dashed-shadow effects.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#e8e3c7" -- "$VAR_BCOLOR Default: #e8e3c7"
    param COLOR -c --color init:="#ba9186" -- "$VAR_COLOR Default: #ba9186"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --title-size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param STYLE -y --style init:=h pattern:"$DASHED_TYPES" -- "Select from ${DASHED_TYPES}."
    param TEXT -t --text init:="Teffects Transmission" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

parser_definition_sticker() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} sticker [options] [arguments]" ''

    msg -- 'Creates sticker texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#eee" -- "$VAR_BCOLOR Default: #eee"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param LSIZE -l --lsize init:=14 -- "Top text font-size. Default: 14vw"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param SUB_TEXT -u --subtext init:="Text Effect" -- "Subtext. $VAR_TEXT"
    param TEXT -t --text init:="STICKER" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

# shade animation
parser_definition_shade() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} shade [options] [arguments]" ''

    msg -- 'Creates animated shade-style texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:=" #d0d0d0" -- "$VAR_BCOLOR Default: #d0d0d0"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE  Default: 10vw."
    param TEXT -t --text init:="SHADE" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

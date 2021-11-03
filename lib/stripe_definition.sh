parser_definition_stripe() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} stripe [options] [arguments]" ''

    msg -- 'Creates animaged stripe-texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#ffed94" -- "$VAR_BCOLOR Default: #ffed94"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw"
    param TEXT -t --text init:="STRIPE" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

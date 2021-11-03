parser_definition_popart() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} popart [options] [arguments]" ''

    msg -- 'Creates pop art texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#faff04" -- "$VAR_BCOLOR Default: #faff04"
    param COLOR -c --color init:="#ff1f8f" -- "$VAR_COLOR Default: #ff1f8f"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -t --text init:="Teffects" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"

    disp :usage -h --help
}

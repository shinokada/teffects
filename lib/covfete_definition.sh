parser_definition_covfete() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} covfete [options] [arguments]" ''

    msg -- 'Covfete texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#ab3428" -- "$VAR_BCOLOR Default: #ab3428"
    param COLOR -c --color init:="#f49e4c" -- "$VAR_COLOR Default: #f49e4c"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=15 validate:number -- "$VAR_SIZE Default: 15vw."
    param TEXT -t --text init:="Teffects" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH."
    disp :usage -h --help
}

parser_definition_retro() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} retro [options] [arguments]" ''

    msg -- 'Creates retro texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param SUB_TEXT -s --subtext init:="Text Effect" -- "Subtext. $VAR_TEXT"
    param TEXT -t --text init:="RETRO" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

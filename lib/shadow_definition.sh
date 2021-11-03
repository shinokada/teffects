parser_definition_shadow() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} shadow [options] [arguments]" ''

    msg -- 'Creates shadow styling texts. Limited to max 3-4 words. Width and height are fixed to 1200x400.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag LOWER_CASE -l --lower -- "text-transform:lowercase"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#ebe7e0" -- "$VAR_BCOLOR Default: #ebe7e0"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE Default: 10vw"
    param TEXT -t --text init:="TEFFECTS SHADOW" -- "$VAR_TEXT Default: Teffects SVG"
    disp :usage -h --help
}

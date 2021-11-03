parser_definition_strokeshadow() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} strokeshadow [options] [arguments]" ''

    msg -- 'Creates stroke-shadow texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BEHIND --behind -- "Set the color behind the text."
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#fef3c7" -- "$VAR_BCOLOR Default: #fef3c7"
    param SCOLOR -c --color init:="#db2777" -- "Shadow color"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -t --text init:="Stroke & shadow" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

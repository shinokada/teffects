parser_definition_clip() {
    setup REST plus:true help:usage abbr:true -- \
        "Usage: ${2##*/} clip [options...] [arguments...]" ''

    msg -- 'Creates cliped texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param WEIGHT -b --bold validate:font_type pattern:"$FONT_WEIGHT" -- "Font weight. Choose from 500|700|900."
    param FONT_NAME -f --font init:="Luckiest Guy" -- "Font name. Default: Luckiest Guy."
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param BKIMG -i --image init:="${script_dir}/images/flower.jpg" -- "Background image. Use an absolute path. Default flower.jpg"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=120 validate:number -- "$VAR_SIZE Default: 120px."
    param TEXT -t --text init:="It's Friday." -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

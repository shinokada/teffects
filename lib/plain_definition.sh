parser_definition_plain() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} popart [options] [arguments]" ''

    msg -- 'Creates pop art texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#ffffff" -- "$VAR_BCOLOR Default: #ffffff"
    param BIMG -m --back-img init:="https://source.unsplash.com/7PqRZK6rbaE" -- "$VAR_BIMG Default: https://source.unsplash.com/7PqRZK6rbaE"
    param COLOR -c --color init:="#666666" -- "$VAR_COLOR Default: #666666"
    param FONT_FAMILY -f --font init:='Oleo Script' -- "$VAR_FONT_FAMILY"
    param FONT_WEIGHT -g --weight init:='normal' -- "$VAR_FONT_WEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"

    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -t --text init:="Teffects Plain" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=1.0 -- "$VAR_BOPACITY Default:1.0"
    disp :usage -h --help
}

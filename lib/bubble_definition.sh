parser_definition_bubble() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} bubble [options] [arguments]" ''

    msg -- 'Creates animated bubble effect.'
    msg -- 'All parameters accepts --param value and --param=value form.'

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#3498db" -- "$VAR_BCOLOR Default: #3498db"
    param COLOR -c --color init:="#fff" -- "$VAR_COLOR Default: #fff"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param BIMG -m --back-img init:="https://source.unsplash.com/G8Fy93Jwfl8" -- "$VAR_BIMG Default: https://source.unsplash.com/G8Fy93Jwfl8"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param SIZE -s --size init:=8 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -t --text init:="BUBBLE EFFECT" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.75 -- "$VAR_BOPACITY Default:0.75"
    disp :usage -h --help
}

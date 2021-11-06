parser_definition_arcade() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} arcade [options] [arguments]" ''

    msg -- 'Creates arcade texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#eee" -- "$VAR_BCOLOR Default: #eee"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param BIMG -m --back-img init:="https://source.unsplash.com/m3hn2Kn5Bns" -- "$VAR_BIMG Default: https://source.unsplash.com/m3hn2Kn5Bns"
    param TEXT -t --text init:="arcade" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.2 -- "$VAR_BOPACITY Default:0.2"
    disp :usage -h --help
}

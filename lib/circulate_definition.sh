append_array() {
    eval "$1+=(\"\$OPTARG\")"
}

parser_definition_circulate() {
    array() { param ":append_array $@"; }
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} circulate [options] [arguments]" ''

    msg -- 'Creates circulating texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    array COLORS --colors init:'COLORS=()' var:VALUE
    param BCOLOR -b --bcolor init:="#111" -- "$VAR_BCOLOR Default: #111"
    param COLOR -c --color init:="#fff" -- "$VAR_COLOR Default: #fff"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param BIMG -m --back-img init:="https://source.unsplash.com/3l3RwQdHRHg" -- "$VAR_BIMG Default: https://source.unsplash.com/3l3RwQdHRHg"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=8 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -t --text init:="Circulating Text" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=1 -- "$VAR_BOPACITY Default:1."
    disp :usage -h --help
}

# new-neon animation
parser_definition_new-neon() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} new-neon [options] [arguments]" ''

    msg -- 'Creates an image with animated neon style text. This opens the default browser.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#090000" -- "$VAR_BCOLOR Default: #090000"
    param BIMG -m --back-img init:="https://source.unsplash.com/7PqRZK6rbaE" -- "$VAR_BIMG Default: https://source.unsplash.com/7PqRZK6rbaE"
    param NEON -n --neon init:=1 validate:number -- "Neon style from 1 to 9. Default: 1."
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE  Default: 6vw."
    param TEXT -t --text init:="Teffects" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.75 -- "$VAR_BOPACITY Default:0.75"

    disp :usage -h --help
}

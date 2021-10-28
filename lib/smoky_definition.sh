# smoky animation
parser_definition_smoky() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} smoky [options] [arguments]" ''

    msg -- 'Creates animated smoky texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''
    msg -- 'Example: teffects rotate -t "I" "speak English" "can not fly" "like programming"' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#000" -- "$VAR_BCOLOR Default: #000"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param BIMG -m --back-img init:="https://source.unsplash.com/1L71sPT5XKc" -- "$VAR_BIMG Default: https://source.unsplash.com/1L71sPT5XKc"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE Default: 6vw."
    param TEXT -t --text init:="Teffects smoky" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.75 -- "$VAR_BOPACITY Default:0.75"
    disp :usage -h --help
}

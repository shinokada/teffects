# squiggle animation
parser_definition_squiggle() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} squiggle [options] [arguments]" ''

    msg -- 'Creates squiggley texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#111" -- "$VAR_BCOLOR Default: #111"
    param COLOR -c --color init:="#fff" -- "$VAR_COLOR Default: #fff"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param BIMG -m --back-img init:="https://source.unsplash.com/rydQVdwcgUQ" -- "$VAR_BIMG Default: https://source.unsplash.com/rydQVdwcgUQ"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -t --text init:="Squiggley text" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.75 -- "$VAR_BOPACITY Default:0.75"
    disp :usage -h --help
}

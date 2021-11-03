ANIM_TYPES='red | blue | purple'
parser_definition_clip-animate() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} clip-animate [options] [arguments]" ''

    msg -- 'Creates animated clip texts.'
    msg -- 'All parameters accepts --param value and --param=value form.'

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param ANIM_IMG --animate-image --pattern validate:anim_type pattern:"$ANIM_TYPES" init:="red" -- "Animated background select from red, blue, or purple. Default: red"
    param BCOLOR -b --bcolor init:="#090d00" -- "$VAR_BCOLOR Default: #090d00"
    param COLOR -c --color init:="#fff" -- "$VAR_COLOR Default: #fff"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param BIMG -m --back-img init:="https://source.unsplash.com/JgOeRuGD_Y4" -- "$VAR_BIMG Default: https://source.unsplash.com/JgOeRuGD_Y4"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param TSIZE -r --top-size init:=3 validate:number -- "$VAR_SIZE Default: 4vw."
    param SIZE -s --size init:=8 validate:number -- "$VAR_SIZE Default: 8vw."
    param TEXTTOP -t --texttop init:="TEXT TOP" -- "$VAR_TEXT"
    param TEXT -u --text init:="ANIMATED TEXT" -- "$VAR_TEXT"
    param TEXTUNDER -v --textunder init:="TEXT UNDER" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=0.25 -- "$VAR_BOPACITY Default:0.25"
    disp :usage -h --help
}

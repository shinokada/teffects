SHADOW_TYPES='elegant | deep | inset | retro | long'

parser_definition_shadow2() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} shadow [options] [arguments]" ''

    msg -- 'Creates shadow styling texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag LOWER_CASE -l --lower -- "text-transform:lowercase"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@no -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@on -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#ebe7e0" -- "$VAR_BCOLOR Default: #ebe7e0"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param OUTPUT_DIR -d --dir init:="${OUTPUT_DIR}" -- "$VAR_OUTPUT_DIR"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE Default: 6vw"
    param SHADOW_TYPE -y --style init:="elegant" pattern:"$SHADOW_TYPES" -- "Shadow types: $SHADOW_TYPES."
    param TEXT -t --text init:="TEFFECTS SHADOW" -- "$VAR_TEXT Default: Teffects SVG"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

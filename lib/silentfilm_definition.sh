# silentfilm animation
parser_definition_silentfilm() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} silentfilm [options] [arguments]" ''

    msg -- 'Silent movie text effect animation.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''
    msg -- 'Example: teffects rotate -t "I" "speak English" "can not fly" "like programming"' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param ALIGN -a --align init=:"center" pattern:"$ALIGN_TYPES" -- "$VAR_ALIGN"
    param BCOLOR -b --bcolor init:="#fff" -- "$VAR_BCOLOR Default: #fff"
    param CONTWIDTH -c --cont-width init:="500" -- "$VAR_CONTWIDTH Default: 500"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=4 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT -u --text init:="Bertie Van Alystyne, Esquire, his father's hope and pride, breakfasts early &#8213; in the afternoon." -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

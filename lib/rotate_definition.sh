# rotate animation
parser_definition_rotate() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} rotate [options] [arguments]" ''

    msg -- 'Creates animated rotating texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''
    msg -- 'Example: teffects rotate -t "I" "speak English" "can not fly" "like programming"' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#eee" -- "$VAR_BCOLOR Default: #eee"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE Default: 6vw."
    param TEXT -t --text init:="Teffects can" -- "$VAR_TEXT"
    disp :usage -h --help
}

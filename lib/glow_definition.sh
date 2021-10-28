# glow animation
parser_definition_glow() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} glow [options] [arguments]" ''

    msg -- 'Creates animated glowing texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''
    msg -- 'Example: teffects glow -t "Teffects Glow Effects" -l "2px" -p 150px -g "#ff3299"' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#111" -- "$VAR_BCOLOR Default: #111"
    param GCOLOR -g --gcolor init:="#00c2ba" -- "$VAR_GCOLOR Default: #00c2ba"
    param LPADDING -l --letterpadding init:="0 5px" -- "$VAR_LPADDING"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=6 validate:number -- "$VAR_SIZE Default: 6vw."
    param TEXT -t --text init:="Teffects glow" -- "$VAR_TEXT"
    disp :usage -h --help
}

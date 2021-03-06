parser_definition_transmission() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} transmission [options] [arguments]" ''

    msg -- 'Creates type-writer style animation.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    # flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#111" -- "$VAR_BCOLOR Default: #111"
    param COLOR -c --color init:="#fff" -- "$VAR_COLOR Default: #fff"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param BIMG -m --back-img init:="https://source.unsplash.com/5YM26lUicfU" -- "$VAR_BIMG Default: https://source.unsplash.com/5YM26lUicfU"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param TSIZE -s --title-size init:=4 validate:number -- "$VAR_SIZE Default: 6vw."
    param SSIZE -z --sub-size init:=2 validate:number -- "$VAR_SIZE Default: 2vw."
    param TTEXT -t --title-text init:="Teffects transmission" -- "$VAR_TTEXT"
    param STEXT -x --sub-text init:="Lorem ipsum dolor sit amet, 
consectetur adipiscing elit. 
Maecenas at nunc eu urna volutpat rhoncus. 
Vivamus molestie, turpis eu lobortis consectetur." -- "$VAR_STEXT"
    param BOPACITY -y --back-opacity init:=1 -- "$VAR_BOPACITY Default:1"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    disp :usage -h --help
}

parser_definition_reveal() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} reveal [options] [arguments]" ''

    msg -- 'Creates animaged revealing texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''
    msg -- 'Example: teffects rotate -t "I" "speak English" "can not fly" "like programming"' ''

    msg label:"OPTIONS" -- "DESCRIPTION"
    flag BROWSER -o +o --{no-}open on:1 no:0 init:@on -- "$VAR_BROWSER"
    flag IMAGE -i +i --{no-}image on:1 no:0 init:@no -- "$VAR_IMAGE"
    param BCOLOR -b --bcolor init:="#fff" -- "$VAR_BCOLOR Default: #fff"
    param BIMG -m --back-img init:="https://source.unsplash.com/gOq27RHoL3s" -- "$VAR_BIMG Default: https://source.unsplash.com/gOq27RHoL3s"
    param COLOR -c --color init:="#67CEC2" -- "$VAR_COLOR Default: #67CEC2"
    param TCOVER -f --first-cover init:="#DF4041" -- "First cover color. Default: #DF4041"
    param BCOVER -g --second-cover init:="#F6D242" -- "Second cover color. Default #F6D242"
    param HEIGHT -e --height init:=1200 validate:number -- "$VAR_HEIGHT"
    param PADDING -p --padding init:="100px" -- "$VAR_PADDING"
    param SIZE -s --size init:=10 validate:number -- "$VAR_SIZE Default: 10vw."
    param TEXT1 -u --text init:="Teffects" -- "$VAR_TEXT"
    param TEXT2 -d --text init:="Reveal" -- "$VAR_TEXT"
    param WIDTH -w --width init:=1600 validate:number -- "$VAR_WIDTH"
    param BOPACITY -y --back-opacity init:=1 -- "$VAR_BOPACITY Default:1"
    disp :usage -h --help
}

parser_definition_puppeteer() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} retro [options] [arguments]" ''

    msg -- 'Creates retro texts.'
    msg -- 'All parameters accepts --param value and --param=value form.' ''

    msg label:"OPTIONS" -- "DESCRIPTION"

    disp :usage -h --help
}

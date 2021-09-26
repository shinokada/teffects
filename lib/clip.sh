readlinkf() {
    [ "${1:-}" ] || return 1
    max_symlinks=40
    CDPATH='' # to avoid changing to an unexpected directory

    target=$1
    [ -e "${target%/}" ] || target=${1%"${1##*[!/]}"} # trim trailing slashes
    [ -d "${target:-/}" ] && target="$target/"

    cd -P . 2>/dev/null || return 1
    while [ "$max_symlinks" -ge 0 ] && max_symlinks=$((max_symlinks - 1)); do
        if [ ! "$target" = "${target%/*}" ]; then
            case $target in
            /*) cd -P "${target%/*}/" 2>/dev/null || break ;;
            *) cd -P "./${target%/*}" 2>/dev/null || break ;;
            esac
            target=${target##*/}
        fi

        if [ ! -L "$target" ]; then
            target="${PWD%/}${target:+/}${target}"
            printf '%s\n' "${target:-/}"
            return 0
        fi
        link=$(ls -dl -- "$target" 2>/dev/null) || break
        target=${link#*" $target -> "}
    done
    return 1
}

self=$(readlinkf "$0")
script_dir=${self%/*}

FONT_ATT=''
FONT_WEIGHT='500 | 700 | 900'

# shellcheck disable=SC1083,SC2016,SC2145
parser_definition_clip() {
    setup REST plus:true width:35 help:usage abbr:true -- \
        "Usage: ${2##*/} [options...] [arguments...]" ''
    msg -- 'Clext clips an image to texts.' ''
    msg label:"OPTIONS" -- "DESCRIPTION"
    param TEXT -t --text init:="It's Friday!" -- "-t 'Your Text to print'"
    param FONT -f --font init:="Luckiest Guy" -- "-f 'Font Name'"
    param SIZE -s --size init:=240 -- "-s 120 will set CSS font-size: 120px"
    param BKIMG -i --image init:="${script_dir}/assets/flower.jpg" -- "-i background-image.jpg"
    param OUTPUT -o --output init:="myimg" -- "-o output-file-name"
    param WIDTH -w --width init:=1920 -- "-w 1240. The default width is 1920px."
    param HEIGHT -h --height init:=1080 -- "-h 800. The default height is 1080px."
    param WEIGHT -b --bold validate:font_type pattern:"$FONT_WEIGHT" -- "-b 900. This sets the font weight. Choose from 500|700|900."
    disp :usage -h --help
    disp VERSION --version
}

font_type() {
    case $OPTARG in
    500) FONT_ATT=":wght@500" ;;
    700) FONT_ATT=":wght@700" ;;
    900) FONT_ATT=":wght@900" ;;
    esac
}

eval "$(getoptions parser_definition_clip parse "$0") exit 1"
parse "$@"
eval "set -- $REST"

# echo "font_weight: $FONT_WEIGHT"
# echo "font_att: $FONT_ATT"
# echo "weight: $WEIGHT"
# echo "TEXT: $TEXT"
# echo "BKIMG: $BKIMG"
# echo "FONT: $FONT"
# echo "SIZE: $SIZE"
# echo "OUTPUT: $OUTPUT"
echo "WIDTH: $WIDTH"
echo "HEIGHT: $HEIGHT"
# # echo "ITALIC: $ITALIC"
# echo "WEIGHT: $WEIGHT"
# echo "SCRIPT_NAME: $SCRIPT_NAME"
echo "$HEIGHT"
# BROWSER_HEIGHT=$(($HEIGHT - 200))

# echo "$BROWSER_HEIGHT"
GFONT="${FONT// /+}"
GF="https://fonts.googleapis.com/css2?family=${GFONT}${FONT_ATT}&display=swap"

cat <<EOF >index.html
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
    @import url("$GF");
html {
    position: relative;
    height: 100%;
}

body {
  padding:0;
  margin:0;
  font-family: "$FONT";
}

/* wkhtmltoimage doesn't support flex. */
/*.center{
  display: flex;
  justify-content: center;
  align-items: center;
  height:${HEIGHT}px;
}*/

h1 {
  font-size: ${SIZE}px;
  background-image: url($BKIMG);
  background-size: cover;
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
  padding: 0 50px;
  text-align:center;
}
</style>
</head>
<body>
<h1 class="center">$TEXT</h1>
</body>
</html>
EOF

fn_clip() {
    wkhtmltoimage --width "$WIDTH" --height "$HEIGHT" --enable-local-file-access ./index.html "$OUTPUT".jpg >/dev/null 2>&1 || exit
    echo "Done! Open $OUTPUT.jpg."
}

MODULE="plain"
TITLE=${MODULE^^}

LHEIGHT=$(echo "$SIZE*1.1" | bc)
LINE_HEIGHT="${LHEIGHT%%.*}"

fn_plain() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css?family=${FONT_FAMILY// /+}&display=swap');
html, body {
  width: 100%;
  height: 100%;
  
}

body{
    background:${BCOLOR};
	font-family: '${FONT_FAMILY}', sans-serif;
    font-size:${SIZE}vw;
    line-height: ${LINE_HEIGHT}vw;
    letter-spacing:0.1em;
    color: ${COLOR};
    font-weight: bold;
}
.container{
    padding:${PADDING};
  background-image: url('${BIMG}/${WIDTH}x${HEIGHT}');
  background-size: cover;
  position: absolute;
  top: 0px;
  right: 0px;
  bottom: 0px;
  left: 0px;
  opacity: ${BOPACITY};
  display: flex;
  justify-content: center;
  align-items: center;
  text-align:${ALIGN};
}
</style>
</head>
<body>
<div class="container">${TEXT}</div>
</body>
</html>
EOF

    # check if $RETRO_OUTPUT exist
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/${MODULE}.png" "file:///${OUTPUT_DIR}/${MODULE}.html" --window-size="${WIDTH},${HEIGHT}" >/dev/null 2>&1 || {
        echo "Something went wrong."
        exit
    }

    if [ "$IMAGE" = 1 ]; then
        echo "Opening $OUTPUT_DIR/${MODULE}.png ..."
        # open browser
        if [[ $(uname) == "Linux" ]]; then
            xdg-open "$OUTPUT_DIR/${MODULE}.png" >/dev/null 2>&1
        elif [[ $(uname) == "Darwin" ]]; then
            open "$OUTPUT_DIR/${MODULE}.png" >/dev/null 2>&1
        fi
        echo "The image location is $OUTPUT_DIR/${MODULE}.png."
    fi

    if [ "$BROWSER" = 1 ]; then
        # open browser
        if [[ $(uname) == "Linux" ]]; then
            xdg-open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
        elif [[ $(uname) == "Darwin" ]]; then
            open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
        fi
        echo "${MODULE} image is on a browser."
    fi
}

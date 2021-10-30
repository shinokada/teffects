MODULE="type"
TITLE=${MODULE^^}

fn_type() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url(https://fonts.googleapis.com/css?family=Montserrat:700);
html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
    text-align:${ALIGN};
}

.container {
padding:${PADDING};
}

.container::before{
    content: "";
	background-image: url('${BIMG}/${WIDTH}x${HEIGHT}');
	background-size: cover;
	position: absolute;
	top: 0px;
	right: 0px;
	bottom: 0px;
	left: 0px;
	opacity: ${BOPACITY};
}

 body {
	 display: flex;
	 height: 100%;
	 background-color: #55a4e9;
}
 .word {
	 margin: auto;
	 color: white;
	 font: 700 normal 2.6666666667em 'Montserrat', sans-serif;
	 text-shadow: 1px 2px #288ce3, 2px 4px #288ce3, 3px 6px #288ce3, 4px 8px #288ce3, 5px 10px #288ce3, 6px 12px #288ce3, 7px 14px #288ce3, 8px 16px #288ce3, 9px 18px #288ce3, 10px 20px #288ce3;
}
 
</style>
</head>
<body>
<div class="container">
<div class="word"></div>
</div>
<script>
words = ['Teffects can ','Type','Shade', 'jump', 'and animate']
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js
"></script>
<script type="text/javascript" src="${script_dir}/assets/js/type.js"></script>
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

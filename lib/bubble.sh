MODULE="bubble"
TITLE=${MODULE^^}

fn_bubble() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url(https://fonts.googleapis.com/css?family=Luckiest+Guy);

html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
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
	opacity: 0.75;
}

.center-outer {
display: table;
width: 100%;
height: 100%;
}

.center-inner {
display: table-cell;
vertical-align: middle;
text-align: center;
}

/* Essential CSS - Makes the effect work */

body {
background-color: ${BCOLOR};
}

.bubbles {
display: inline-block;
font-family: arial;
position: relative;
}

.bubbles h1 {
position: relative;
margin: 1em 0 0;
font-family: 'Luckiest Guy', cursive;
color: ${COLOR};
z-index: 2;
  font-size:${SIZE}vw;
}

.individual-bubble {
position: absolute;
border-radius: 100%;
bottom: 10px;
background-color: #fff;
z-index: 1;
}
</style>
</head>
<body>
<div class="container">
<div class="center-outer">
<div class="center-inner">

<div class="bubbles">
<h1>${TEXT}</h1>
</div>

</div>
</div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script type="text/javascript" src="${script_dir}/assets/js/bubble.js"></script>
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

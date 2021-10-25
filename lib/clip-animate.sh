MODULE="clip-animate"
TITLE=${MODULE^^}

fn_clip-animate() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Neuton|Oswald');
html, body {
width: 100%;
height: 100%;
display: flex;
justify-content: center;
align-items: center;
font-family: "Monoton", Helvetica, sans-serif;
background: ${BCOLOR};
letter-spacing: 5px;
text-align:center;
}

body {
    font: 400 ${TSIZE}vw/1.5 "Neuton";
    background: ${BCOLOR};
    color: ${COLOR};
    text-align: center;
    margin: 0;
}

.container {
padding:${PADDING}px;
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

 p {
	 text-transform: uppercase;
	 letter-spacing: 0.5em;
	 display: inline-block;
	 border: 4px double rgba(255, 255, 255, .75);
	 border-width: 4px 0;
	 padding: 1.5em 0em;
}
 p span {
	 font: 700 ${SIZE}vw "Oswald", sans-serif;
	 letter-spacing: 0;
	 padding: 0.25em 1em 0.325em;
	 display: block;
	 margin: 0 auto;
	 text-shadow: 0 0 80px rgba(255, 255, 255, .5);
	/* Clip Background Image */
	 background: url(${script_dir}/assets/img/animated-text-fill-${ANIM_IMG}.png) repeat-y;
	 -webkit-background-clip: text;
	 background-clip: text;
	/* Animate Background Image */
	 -webkit-text-fill-color: transparent;
	 -webkit-animation: aitf 80s linear infinite;
	/* Activate hardware acceleration for smoother animations */
	 -webkit-transform: translate3d(0, 0, 0);
	 -webkit-backface-visibility: hidden;
}
/* Animate Background Image */
 @-webkit-keyframes aitf {
	 0% {
		 background-position: 0% 50%;
	}
	 100% {
		 background-position: 100% 50%;
	}
}
 
</style>
</head>
<body>
<div class="container">
<p>
  ${TEXTTOP}
  <span>
    ${TEXT}
  </span>
  ${TEXTUNDER}
</p>
</div>
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

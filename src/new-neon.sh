MODULE="new-neon"
TITLE=${MODULE^^}

fn_new-neon() {
  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=League+Script' rel='stylesheet' type='text/css'>
<style>
@import url(https://fonts.googleapis.com/css?family=Bad+Script|Gruppo|Kumar+One+Outline|League+Script|Londrina+Outline|Monoton|Sriracha|Yellowtail&amp;text=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789?+);
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

html {
  background: ${BCOLOR};
  font-size: ${SIZE}vw;
  line-height: 1.1;
}

x-sign {
  --interval: 1s;
  display: block;
  text-shadow: 
    0 0 10px var(--color1),
    0 0 20px var(--color2),
    0 0 40px var(--color3),
    0 0 80px var(--color4);
  will-change: filter, color;
  filter: saturate(60%);
  animation: flicker steps(100) var(--interval) 1s infinite;
}

.neon-1 {
  color: yellow;
  --color1: goldenrod;
  --color2: orangered;
  --color3: mediumblue;
  --color4: purple;
  font-family: Gruppo;
}

.neon-2 {
  color: lightpink;
  --color1: pink;
  --color2: orangered;
  --color3: red;
  --color4: magenta;
  font-family: Bad Script;
}

.neon-3 {
  color: lightyellow;
  --color1: yellow;
  --color2: lime;
  --color3: green;
  --color4: mediumblue;
  font-family: Kumar One Outline;
}

.neon-4 {
  color: lightyellow;
  --color1: gold;
  --color2: firebrick;
  --color3: pink;
  --color4: red;
  font-family: Londrina Outline;
}


.neon-5 {
  color: azure;
  --color1: azure;
  --color2: aqua;
  --color3: dodgerblue;
  --color4: blue;
  font-family: Sriracha;
}

.neon-6 {
  color: tomato;
  --color1: orangered;
  --color2: firebrick;
  --color3: maroon;
  --color4: darkred;
  font-family: Yellowtail;
}

.neon-7 {
  color: lightyellow;
  --color1: yellow;
  --color2: orange;
  --color3: brown;
  --color4: purple;
  font-family: Bad Script;
}

.neon-8 {
  color: yellow;
  --color1: yellow;
  --color2: lime;
  --color3: green;
  --color4: darkgreen;
  font-family: Monoton;
}

.neon-9 {
  color: lightyellow;
  --color1: yellow;
  --color2: gold;
  --color3: orange;
  --color4: darkred;
  font-family: Sriracha;
}

@keyframes flicker {
  50% {
    color: white;
    filter: saturate(200%) hue-rotate(20deg);
  }
}
</style>
</head>
<body>
<div class="container">
<x-sign class="neon-${NEON}">
${TEXT}
</x-sign>
</div>
<script type="text/javascript" src="${script_dir}/assets/js/new-neon.js"></script>
</body>
</html>
EOF

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

set +e

MODULE="circulate"
TITLE=${MODULE^^}

DCOLORS=(4D163D 840037 FFFFFF BD0034 FDB731)
COL_NUM=${#DCOLORS[@]}
spaces() {
    echo "$1" | grep -o " " | wc -l | tr -d '[:space:]'
}

fn_trim() {
    echo -e "$1" | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//'
}

NARR=$(fn_trim "$COLORS")
read -ra user_input <<<"$NARR"
SPACES=$(spaces "${NARR[@]}")
MIN=$((SPACES < COL_NUM ? SPACES : COL_NUM))
i=0
while [ $i -lt "$MIN" ]; do
    val=${user_input[$i]}
    DCOLORS[$i]=$val
    ((i++))
done

fn_circulate() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
	<title>${TITLE}</title>
	<meta charset="UTF-8">
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:800);
html, body {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  vertical-align: middle;
  font-weight: 800;
}

body{
  background: ${BCOLOR};
  font-family: Arial;
  font: ${SIZE}vw Open Sans, Impact;
}

.container {
	padding:${PADDING};
}
@import url(https://fonts.googleapis.com/css?family=Montserrat);

svg {
    display: block;
    font: ${SIZE}vw 'Montserrat';
    font: ${SIZE}vw Open Sans, Impact;
    width: ${WIDTH}px;
    height: ${HEIGHT}px;
    margin: 0 auto;
}

.text-copy {
    fill: none;
    stroke: white;
    stroke-dasharray: 6% 29%;
    stroke-width: 5px;
    stroke-dashoffset: 0%;
    animation: stroke-offset 5.5s infinite linear;
}

.text-copy:nth-child(1){
	stroke: #${DCOLORS[0]};
	animation-delay: -1;
}

.text-copy:nth-child(2){
	stroke: #${DCOLORS[1]};
	animation-delay: -2s;
}

.text-copy:nth-child(3){
	stroke: #${DCOLORS[2]};
	animation-delay: -3s;
}

.text-copy:nth-child(4){
	stroke: #${DCOLORS[3]};
	animation-delay: -4s;
}

.text-copy:nth-child(5){
	stroke: #${DCOLORS[4]};
	animation-delay: -5s;
}

@keyframes stroke-offset{
	100% {stroke-dashoffset: -35%;}
}
</style>
</head>
<body>
<div class="container">
	<svg>
	<symbol id="s-text">
		<text text-anchor="middle" x="50%" y="50%">${TEXT}</text>
	</symbol>

	<g class="g-ants">
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
	</g>
</svg>
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
    fi

    echo "The image location is $OUTPUT_DIR/${MODULE}.png."

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

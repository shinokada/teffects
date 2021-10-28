MODULE="split"
TITLE=${MODULE^^}

fn_split() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
	<title>${TITLE}</title>
	<meta charset="UTF-8">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<style>
*,
*:after,
*:before {
	box-sizing: border-box;
}

html, body {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

body {
	font-family: "Inter", sans-serif;
	background-color: ${BOCOLOR};
	width:${WIDTH}px;
	height:${HEIGHT}px;
	text-align:center;
}

.text-box {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
}

h1 {
	font-size: ${SIZE}vw;
	font-weight: 900;
	background-color: ${BCOLOR};
	color: ${COLOR};
	display: block;
	padding: .5em;
}

h1:nth-child(2) {
	position: absolute;
	background-color: ${COLOR};
	color: ${BCOLOR};
	clip-path: inset(-1% -1% 50% -1%); // Added the negative values to prevent icky "bleed" in Chrome
}

p {
	font-size: 2vw;
	font-weight: 900;
	margin-top: 1em;
	text-align: center;
	span {
		display: block;
		transform: rotate(90deg);
		margin-top: .25em;
	}
}

.container {
	padding:${PADDING};
}
</style>
</head>
<body>
<div class="container">
	<div class="text-box">
		<h1>${TEXT}</h1>
		<h1>${TEXT}</h1>
	</div>
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

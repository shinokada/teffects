MODULE="sticker"
TITLE=${MODULE^^}

fn_sticker() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
	<title>${TITLE}</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC:ital,wght@1,900&display=swap" rel="stylesheet">
<style>
* {
	 box-sizing: border-box;
}
body {
	min-height: 100vh;
	min-height: -webkit-fill-available;
	display: grid;
	place-content: center;
	font-family: sans-serif;
	background-color: #d1dbe8;
	line-height: 1;
	color: var(--c5);
}
.container {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding:${PADDING};
}

.sticker {
	--c1: #ef548f;
	--c2: #ef8b6d;
	--c3: #cfef6b;
	--c4: #3bf0c1;
	--c5: #bb4af0;
	--shine-angle: 15deg;
	display: inline-grid;
	grid-template-areas: "text";
	place-items: center;
	font-family: "Alegreya Sans SC", sans-serif;
	font-weight: 900;
	font-style: italic;
	/*font-size: clamp(3rem, 15vw, 10rem);*/
	font-size: ${SIZE}vw;
	text-transform: uppercase;
	color: var(--c5);
}
.sticker-lg {
	/*font-size: clamp(6rem, 30vw, 20rem);*/
	font-size: ${LSIZE}vw;
}
.sticker span {
	background: linear-gradient(var(--shine-angle), rgba(255, 0, 0, 0) 0%, rgba(255, 0, 0, 0) 35%, rgba(255, 255, 255, 0.98) 49.95%, rgba(255, 255, 255, 0.98) 50.15%, rgba(255, 0, 0, 0) 65%, rgba(255, 0, 0, 0)), linear-gradient(to right, var(--c1), var(--c2), var(--c3), var(--c4), var(--c5));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	-webkit-text-stroke: 0.01em rgba(0, 0, 0, 0.6);
}
.sticker > *, .sticker::before, .sticker::after {
	grid-area: text;
}
.sticker::before, .sticker::after {
	content: attr(data-text);
	color: #fff;
}
.sticker::before {
	-webkit-text-stroke: 0.21em white;
	background: no-repeat linear-gradient(white, white) 15% 50% / 85% 60%;
}
.sticker::after {
	text-shadow: 0.07em 0.08em 0.05em rgba(0, 0, 0, 0.75), -0.07em -0.05em 0.05em rgba(0, 0, 0, 0.75);
	z-index: -2;
}

</style>
</head>
<body>
<div class="container">
<span class="sticker sticker-lg" data-text="${TEXT}"><span>${TEXT}</span></span>

<span class="sticker" data-text="${SUB_TEXT}" style="--shine-angle: 8deg;"><span>${SUB_TEXT}</span></span>
</div>
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

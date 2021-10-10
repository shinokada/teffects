MODULE="stripe"
TITLE=${MODULE^^}

fn_stripe() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
	<title>${TITLE}</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Bungee+Shade" rel="stylesheet">
<style>
html {
	 height: 100%;
}
 body {
	 width: 100%;
	 height: 100%;
	 display: flex;
	 align-items: center;  
	 justify-content: center;  
	 font-family: 'Bungee Shade', cursive;
	 background: ${BCOLOR};
}

.container{
	padding: ${PADDING};
}

 h1 {
	 font-weight: normal;
	 width: 100%;
	 text-align: center;
	 font-size: ${SIZE}vw;
	 background: linear-gradient(-45deg, #4bc0c8 25%, #feac5e 25%, #feac5e 50%, #4bc0c8 50%, #4bc0c8 75%, #feac5e 75%, #feac5e);
	 -webkit-background-clip: text;
	 -webkit-text-fill-color: transparent;
	 background-size: 20px 20px;
	 background-position: 0 0;
	 animation: stripes 1s linear infinite;
}
 @keyframes stripes {
	 100% {
		 background-position: 20px 0, 20px 0, 20px 0;
	}
}

</style>
</head>
<body>
<div class="container">
	<h1>${TEXT}</h1> 
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

	echo "${MODULE} image is done! Open $OUTPUT_DIR/${MODULE}.png."

	if [ "$BROWSER" = 1 ]; then
		# open browser
		if [[ $(uname) == "Linux" ]]; then
			xdg-open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
		elif [[ $(uname) == "Darwin" ]]; then
			open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
		fi
		echo "${MODULE} image is on a browser."
	fi

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
}

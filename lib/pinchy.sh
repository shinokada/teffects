MODULE="pinchy"

# for line-height
if [ "$SIZE" -gt 0 ]; then
	LHEIGHT=$(echo "$SIZE*1.1" | bc)
	LINE_HEIGHT="${LHEIGHT%%.*}"
fi

TEXT=$(echo $TEXT | tr '[:lower:]' '[:upper:]')

fn_pinchy() {
	cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
<style>
@import url(https://fonts.googleapis.com/css?family=Alegreya+Sans:100,100italic,300,300italic);
html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

body {
	background: repeating-linear-gradient(45deg, transparent, transparent 2em, papayawhip 0, papayawhip 4em), repeating-linear-gradient(-45deg, transparent, transparent 2em, seashell 0, seashell 4em), snow;
	background-blend-mode: multiply;
}
.container {
	padding:${PADDING};
}
h1 {
	text-shadow: 1px 1px #1e280a, 2px 2px #1e280a, 3px 3px #1e280a, 4px 4px #1e280a, 5px 5px #1e280a, 6px 6px #1e280a, 7px 7px #1e280a, 8px 8px #1e280a, 9px 9px #1e280a, 10px 10px #1e280a, 11px 11px #1e280a, 12px 12px #1e280a, 13px 13px #1e280a, 14px 14px #1e280a, 15px 15px #1e280a, -1px 1px olivedrab, -2px 2px olivedrab, -3px 3px olivedrab, -4px 4px olivedrab, -5px 5px olivedrab, -6px 6px olivedrab, -7px 7px olivedrab, -8px 8px olivedrab, -9px 9px olivedrab, -10px 10px olivedrab, -11px 11px olivedrab, -12px 12px olivedrab, -13px 13px olivedrab, -14px 14px olivedrab, -15px 15px olivedrab, -1px -1px #aed65a, -2px -2px #aed65a, -3px -3px #aed65a, -4px -4px #aed65a, -5px -5px #aed65a, -6px -6px #aed65a, -7px -7px #aed65a, -8px -8px #aed65a, -9px -9px #aed65a, -10px -10px #aed65a, -11px -11px #aed65a, -12px -12px #aed65a, -13px -13px #aed65a, -14px -14px #aed65a, -15px -15px #aed65a, 1px -1px olivedrab, 2px -2px olivedrab, 3px -3px olivedrab, 4px -4px olivedrab, 5px -5px olivedrab, 6px -6px olivedrab, 7px -7px olivedrab, 8px -8px olivedrab, 9px -9px olivedrab, 10px -10px olivedrab, 11px -11px olivedrab, 12px -12px olivedrab, 13px -13px olivedrab, 14px -14px olivedrab, 15px -15px olivedrab, 0 -1px #000, 0 -2px #000, 0 -3px #000, 0 -4px #000, 0 -5px #000, 0 -6px #000, 0 -7px #000, 0 -8px #000, 0 -9px #000, 0 -10px #000, 0 -11px #000, 0 -12px #000, 0 -13px #000, 0 -14px #000, 0 -15px #000, 0 1px #000, 0 2px #000, 0 3px #000, 0 4px #000, 0 5px #000, 0 6px #000, 0 7px #000, 0 8px #000, 0 9px #000, 0 10px #000, 0 11px #000, 0 12px #000, 0 13px #000, 0 14px #000, 0 15px #000, -1px 0 #aed65a, -2px 0 #aed65a, -3px 0 #aed65a, -4px 0 #aed65a, -5px 0 #aed65a, -6px 0 #aed65a, -7px 0 #aed65a, -8px 0 #aed65a, -9px 0 #aed65a, -10px 0 #aed65a, -11px 0 #aed65a, -12px 0 #aed65a, -13px 0 #aed65a, -14px 0 #aed65a, -15px 0 #aed65a, 1px 0 #000, 2px 0 #000, 3px 0 #000, 4px 0 #000, 5px 0 #000, 6px 0 #000, 7px 0 #000, 8px 0 #000, 9px 0 #000, 10px 0 #000, 11px 0 #000, 12px 0 #000, 13px 0 #000, 14px 0 #000, 15px 0 #000;

	font-size: ${SIZE}vw;
	font-family:Alegreya Sans;
	letter-spacing: 20px;
	text-align: ${ALIGN};
	color: sienna;
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
	eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/${MODULE}.png" "file:///${script_dir}/outputs/${MODULE}.html" --window-size="${WIDTH},${HEIGHT}" >/dev/null 2>&1 || {
		echo "Something went wrong."
		exit
	}

	echo "${MODULE} image is done! Open $OUTPUT_DIR/${MODULE}.png."
}

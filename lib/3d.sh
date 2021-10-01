MODULE="3d"
LINE_HEIGHT=$((SIZE * 1.2)) | bc
LHEIGHT=$(echo "$SIZE*1.2" | bc)
LINE_HEIGHT="${LHEIGHT%%.*}"

fn_3d() {
	cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<style>
*, *:after, *:before {
	 box-sizing: border-box;
}
 body {
	 font-family: "Inter", sans-serif;
	 background-color: ${BCOLOR};
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
}
 h1 {
	 text-align:center;
	 color: ${COLOR};
	 /*font-size: calc(1em + 20vw);*/
	 font-size: ${SIZE}px;
	 line-height:${LINE_HEIGHT}px;
	 font-weight: 900;
	 text-shadow: -0.0075em 0.0075em 0 #fef2f6, 0.005em 0.005em 0 #f6a5c1, 0.01em 0.01em 0 #f7aac4, 0.015em 0.015em #f7aec7, 0.02em 0.02em 0 #f8b3ca, 0.025em 0.025em 0 #f8b7cd, 0.03em 0.03em 0 #f8bcd0, 0.035em 0.035em 0 #f9c0d3;
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

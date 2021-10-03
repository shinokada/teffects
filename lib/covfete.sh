MODULE="covfete"

fn_covfete() {
	cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css?family=Monoton');
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
.container {
	padding:${PADDING};
}
 h1 {
	 display: inline;
	 font-size: ${SIZE}vw;
	 text-transform: uppercase;
	 color: ${COLOR};
}
 @media (min-width: 700px) {
	 h1 {
		 /*font-size: 9vw;*/
	}
}
 @media (min-width: 1400px) {
	 h1 {
		 /*font-size: 150px;*/
	}
}
 @supports (-webkit-background-clip: text) {
	 h1 {
		 color: transparent;
		 background: linear-gradient(7deg, #f5ee9e 50%, ${COLOR} 0);
		 -webkit-background-clip: text;
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
	eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/${MODULE}.png" "file:///${script_dir}/outputs/${MODULE}.html" --window-size="${WIDTH},${HEIGHT}" >/dev/null 2>&1 || {
		echo "Something went wrong."
		exit
	}

	echo "${MODULE} image is done! Open $OUTPUT_DIR/${MODULE}.png."
}

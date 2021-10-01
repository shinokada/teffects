MODULE="strokeshadow"

# for line-height
if [ "$SIZE" -gt 0 ]; then
    LHEIGHT=$(echo "$SIZE*1.2" | bc)
    LINE_HEIGHT="${LHEIGHT%%.*}"
fi

fn_strokeshadow() {
    cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<style>
.stroke {
	 -webkit-text-stroke-width: 2px;
	 -moz-text-stroke-width: 2px;
	 -webkit-text-stroke-color: #111827;
	 -moz-text-stroke-color: #111827;
	 color: transparent;
}
 .shadow {
	 text-shadow: 6px 6px #db2777;
}
 .stroke-shadow {
	 color: #fef3c7;
	 text-shadow: -2px 0 #111827, 0 -2px #111827, 2px 0 #111827, 0 2px #111827, 2px 2px #111827, -2px -2px #111827, -2px 2px #111827, 2px -2px #111827, 6px 6px #db2777;
}
 .halftone {
	 position: relative;
}
 .halftone:after {
	 content: "Hello";
	 background: url("data:image/png;
	base64,iVBORw0KGgoAAAANSUhEUgAAAAMAAAADCAYAAABWKLW/AAAAHElEQVQYV2NUVFT8f//+fUYGBgYGMAEDcA5IBQCKJQVmn76DhAAAAABJRU5ErkJggg==") repeat;
	 font-size: 15vw;
	 letter-spacing: 6px;
	 left: calc(50% + 6px);
	 position: absolute;
	 top: calc(50% + 6px);
	 transform: translate(-50%, -50%);
	 z-index: -1;
	 -webkit-text-stroke-width: 0;
	 -moz-text-stroke-width: 0;
	 -webkit-background-clip: text;
	 -moz-background-clip: text;
	 background-clip: text;
	 -webkit-text-fill-color: transparent;
	 -moz-text-fill-color: transparent;
}
 .halftone-color:after {
	 background-color: #db2777;
}
 body {
	 background-color: #fef3c7;
	 display: grid;
	 height: 100vh;
	 place-content: center;
	 text-align: center;
}
 body p {
	 font-size: 15vw;
	 font-weight: bold;
	 letter-spacing: 5px;
	 margin: 0;
}
 body .grid {
	 display: grid;
	 grid-gap: 5vw;
	 grid-template-columns: 1fr;
}
 @media screen and (min-width: 768px) {
	 body .grid {
		 grid-template-columns: 1fr 1fr;
	}
}
</style>
</head>
<body>
<div class="grid">
    <p class="stroke shadow">Hello</p>
    <p class="stroke-shadow">Hello</p>
    <p class="stroke halftone">Hello</p>
    <p class="stroke halftone halftone-color">Hello</p>
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

MODULE="popart"

# for line-height
if [ "$SIZE" -gt 0 ]; then
    LHEIGHT=$(echo "$SIZE*1.2" | bc)
    LINE_HEIGHT="${LHEIGHT%%.*}"
fi

fn_popart() {
    cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:900i&display=swap');

body{
    background:${BCOLOR};
	font-family: 'Montserrat', sans-serif;
}

.popart{
    text-align:${ALIGN};
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size:${SIZE}px;
    line-height: ${LINE_HEIGHT}px;
    letter-spacing:0.1em;
    -webkit-text-fill-color: transparent;
    -webkit-text-stroke-width: 3px;
    -webkit-text-stroke-color: white;
    text-shadow: 
	8px 8px #ff1f8f,
	20px 20px #000000;
}
</style>
</head>
<body>
<div class="popart">${TEXT}</div>
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

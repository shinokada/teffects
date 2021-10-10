MODULE="popart"
TITLE=$(echo $MODULE | tr "[:lower]" "[:upper:]")

# for line-height
if [ "$SIZE" -gt 0 ]; then
    LHEIGHT=$(echo "$SIZE*1.1" | bc)
    LINE_HEIGHT="${LHEIGHT%%.*}"
fi

fn_popart() {
    cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css?family=Montserrat:900i&display=swap');
html, body {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align:${ALIGN};
}

body{
    background:${BCOLOR};
	font-family: 'Montserrat', sans-serif;
}

.popart{
    
    font-size:${SIZE}vw;
    line-height: ${LINE_HEIGHT}vw;
    letter-spacing:0.1em;
    -webkit-text-fill-color: transparent;
    -webkit-text-stroke-width: 3px;
    -webkit-text-stroke-color: white;
    text-shadow: 
	8px 8px ${COLOR},
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

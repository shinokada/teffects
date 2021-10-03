MODULE="layer"

# for line-height
if [ "$SIZE" -gt 0 ]; then
    LHEIGHT=$(echo "$SIZE*1.2" | bc)
    LINE_HEIGHT="${LHEIGHT%%.*}"
fi

fn_layer() {
    cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=Charmonman|Engagement|Baloo+Bhai|Ubuntu:700|Niconne&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
	font-size: ${SIZE}px;
	text-align: center;
    height:${LINE_HEIGHT}px;
    /*line-height: 90vh;*/
    line-height: ${LINE_HEIGHT}px;
	color: #fcedd8;
	background: ${BCOLOR};
	font-family: 'Niconne', cursive;
	font-weight: 700;
    text-shadow: 5px 5px 0px #eb452b, 
                  10px 10px 0px #efa032, 
                  15px 15px 0px #46b59b, 
                  20px 20px 0px #017e7f, 
                  25px 25px 0px #052939, 
                  30px 30px 0px #c11a2b, 
                  35px 35px 0px #c11a2b, 
                  40px 40px 0px #c11a2b, 
                  45px 45px 0px #c11a2b;
}
.container {
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width:100%;
    padding:100px;
}
</style>
</head>
<body>
<div class="layer container">${TEXT}</div>
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

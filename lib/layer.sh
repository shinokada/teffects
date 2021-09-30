fn_layer() {
    cat <<EOF >"${script_dir}/outputs/layer.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=Charmonman|Engagement|Baloo+Bhai|Ubuntu:700|Niconne&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
	font-size: 15rem;
	text-align: center;
    height:90vh;
    line-height: 90vh;
	color: #fcedd8;
	background: #d52e3f;
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
</style>
</head>
<body>
<div class="layer">${HEADER}</div>
</body>
</html>
EOF

    # check if $RETRO_OUTPUT exist
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/layer.png" "file:///${script_dir}/outputs/layer.html" --window-size="${WIDTH},${HEIGHT}" >/dev/null 2>&1 || {
        echo "Something went wrong."
        exit
    }

    echo "Layer image is done! Open $OUTPUT_DIR/layer.png."
}

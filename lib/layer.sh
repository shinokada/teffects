fn_layer() {
    cat <<EOF >"${script_dir}/outputs/sticker.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans+SC:ital,wght@1,900&display=swap" rel="stylesheet">
<style>

</style>
</head>
<body>
<div>${HEADER}</div>
</body>
</html>
EOF

    # check if $RETRO_OUTPUT exist
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/layer.png" "file:///${script_dir}/outputs/layer.html" >/dev/null 2>&1 || {
        echo "Something went wrong."
        exit
    }

    echo "Sticker image is done! Open $OUTPUT_DIR/layer.png."
}

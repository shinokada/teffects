MODULE="strokeshadow"
TITLE=${MODULE^^}

# for line-height and text-shadow
if [ "$SIZE" -gt 0 ]; then
    TEXT_SHADOW=3
    if [ $SIZE -lt 180 ]; then
        TEXT_SHADOW=5
    else
        TEXT_SHADOW=6
    fi
fi

CLASS="stroke shadow"
if [ "$BEHIND" ]; then
    CLASS="stroke-shadow"
fi

fn_strokeshadow() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<style>
html, body {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: ${BCOLOR};
    text-align: ${ALIGN};
}

.container {
    padding:${PADDING};
}

p {
    font-size: ${SIZE}vw;
    font-weight: bold;
    letter-spacing: 5px;
    margin: 0;
}

.stroke {
    -webkit-text-stroke-width: 2px;
    -moz-text-stroke-width: 2px;
    -webkit-text-stroke-color: #111827;
    -moz-text-stroke-color: #111827;
    color: transparent;
}
.shadow {
    text-shadow: ${TEXT_SHADOW}px ${TEXT_SHADOW}px ${SCOLOR};
}
.stroke-shadow {
    color: ${BCOLOR};
    text-shadow: -2px 0 #111827, 0 -2px #111827, 2px 0 #111827, 0 2px #111827, 2px 2px #111827, -2px -2px #111827, -2px 2px #111827, 2px -2px #111827, 6px 6px ${SCOLOR};
}

</style>
</head>
<body>
<div class="container">
    <p class="${CLASS}">${TEXT}</p>
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
}

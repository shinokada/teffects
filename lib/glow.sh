MODULE="glow"
TITLE=$(echo $MODULE | tr [:lower:] [:upper:])
LEN=${#TEXT}
DELAY_CONST=200
# to round up add (denominator-1) to the numerator
ZOOM_TIME=$(echo "(${LEN}*${DELAY_CONST}+999)/1000" | bc)

i=0
SPAN=""
while [ $i -lt $LEN ]; do
  SPAN+="<span style="--i:$((i + 1))">${TEXT:$i:1}</span>"
  i=$(($i + 1))
done

fn_glow() {
  cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="description" content="Shaded Text, a SVG+CSS3 experiment about animated shadows by RGG">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
<style>
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

.container {
  width: 100%;
  min-height: 100vh;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: ${BCOLOR};
  text-align:center;
  padding:${PADDING};
}

.text span {
  font-size: ${SIZE}vw;
  padding: ${LPADDING};
  text-transform: uppercase;
  color: #fff;
  animation: zoomup ${ZOOM_TIME}s linear infinite;
  animation-delay: calc(${DELAY_CONST}ms * var(--i));
}

@keyframes zoomup {
  0%,
  100% {
    color: #00c2ba;
    filter: blur(1px);
    text-shadow: 0 0 10px #00c2ba, 0 0 20px #00c2ba, 0 0 30px #00c2ba,
      0 0 40px #00c2ba, 0 0 60px #00c2ba, 0 0 80px #00c2ba, 0 0 100px #00c2ba,
      0 0 120px #00c2ba;
  }

  3%,
  97% {
    filter: blur(0);
    color: #fff;
    text-shadow: none;
  }
}
</style>
</head>
<body>
<div class="container">
<div class="text">
    ${SPAN}
  </div>
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

  if [ "$BROWSER" = 1 ]; then
    # open browser
    if [[ $(uname) == "Linux" ]]; then
      xdg-open "file:///${script_dir}/outputs/${MODULE}.html"
    elif [[ $(uname) == "Darwin" ]]; then
      open "file:///${script_dir}/outputs/${MODULE}.html"
    fi
    echo "${MODULE} image is on a browser."
  fi
}

MODULE="jump"
TITLE=${MODULE^^}
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

fn_jump() {
  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
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
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: ${BCOLOR};
}

.text span {
  padding: ${LPADDING};
  font-size: ${SIZE}vw;
  animation: zoomup ${ZOOM_TIME}s ease infinite;
  display: inline-block;
  animation-delay: calc(200ms * var(--i));
  color: ${COLOR};
}

@keyframes zoomup {
  0%,
  100% {
    transform: scale(1);
  }

  50% {
    transform: scale(1.2) translateY(-50px);
    filter: blur(1px);
    opacity: 0;
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

  if [ "$IMAGE" = 1 ]; then
    echo "Opening $OUTPUT_DIR/${MODULE}.png ..."
    # open browser
    if [[ $(uname) == "Linux" ]]; then
      xdg-open "$OUTPUT_DIR/${MODULE}.png" >/dev/null 2>&1
    elif [[ $(uname) == "Darwin" ]]; then
      open "$OUTPUT_DIR/${MODULE}.png" >/dev/null 2>&1
    fi
    echo "The image location is $OUTPUT_DIR/${MODULE}.png."
  fi

  if [ "$BROWSER" = 1 ]; then
    # open browser
    if [[ $(uname) == "Linux" ]]; then
      xdg-open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
    elif [[ $(uname) == "Darwin" ]]; then
      open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
    fi
    echo "${MODULE} image is on a browser."
  fi
}

MODULE="shadow"
TITLE=${MODULE^^}

# for line-height
if [ "$SIZE" -gt 0 ]; then
  LHEIGHT=$(echo "$SIZE*1.2" | bc)
  LINE_HEIGHT="${LHEIGHT%%.*}"
fi

TEXT=$(echo $TEXT | tr '[:lower:]' '[:upper:]')
WIDTH=1200
HEIGHT=400

if [ "$LOWER_CASE" ]; then
  # echo "$TEXT_TRANSFORM"
  CASE="text-transform:lowercase;"
else
  CASE=""
fi

fn_shadow() {
  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <title>${TITLE}</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css?family=Playfair+Display:900');

html {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: ${BCOLOR};
  min-height: 100vh;
  min-width: 600px;
}

text {
  fill: #35322a;
  filter: url('#money');
  font-family: 'Playfair Display', 'Georgia', serif;
  font-size: ${SIZE}vw;
  font-weight: 900;
  ${CASE};
}
</style>
</head>
<body>
<div class="container">
<svg width='${WIDTH}' height='${HEIGHT}'>
  <filter id='money'>
    <feMorphology in='SourceGraphic' operator='dilate' radius='2' result='expand'/>

    <feOffset in='expand' dx='1' dy='1' result='shadow_1'/>
    <feOffset in='expand' dx='2' dy='2' result='shadow_2'/>
    <feOffset in='expand' dx='3' dy='3' result='shadow_3'/>
    <feOffset in='expand' dx='4' dy='4' result='shadow_4'/>
    <feOffset in='expand' dx='5' dy='5' result='shadow_5'/>
    <feOffset in='expand' dx='6' dy='6' result='shadow_6'/>
    <feOffset in='expand' dx='7' dy='7' result='shadow_7'/>

    <feMerge result='shadow'>
      <feMergeNode in='expand'/>
      <feMergeNode in='shadow_1'/>
      <feMergeNode in='shadow_2'/>
      <feMergeNode in='shadow_3'/>
      <feMergeNode in='shadow_4'/>
      <feMergeNode in='shadow_5'/>
      <feMergeNode in='shadow_6'/>
      <feMergeNode in='shadow_7'/>
    </feMerge>

    <feFlood flood-color='#ebe7e0'/>
    <feComposite in2='shadow' operator='in' result='shadow'/>

    <feMorphology in='shadow' operator='dilate' radius='1' result='border'/>
    <feFlood flood-color='#35322a' result='border_color'/>
    <feComposite in2='border' operator='in' result='border'/>

    <feOffset in='border' dx='1' dy='1' result='secondShadow_1'/>
    <feOffset in='border' dx='2' dy='2' result='secondShadow_2'/>
    <feOffset in='border' dx='3' dy='3' result='secondShadow_3'/>
    <feOffset in='border' dx='4' dy='4' result='secondShadow_4'/>
    <feOffset in='border' dx='5' dy='5' result='secondShadow_5'/>
    <feOffset in='border' dx='6' dy='6' result='secondShadow_6'/>
    <feOffset in='border' dx='7' dy='7' result='secondShadow_7'/>
    <feOffset in='border' dx='8' dy='8' result='secondShadow_8'/>
    <feOffset in='border' dx='9' dy='9' result='secondShadow_9'/>
    <feOffset in='border' dx='10' dy='10' result='secondShadow_10'/>
    <feOffset in='border' dx='11' dy='11' result='secondShadow_11'/>

    <feMerge result='secondShadow'>
      <feMergeNode in='border'/>
      <feMergeNode in='secondShadow_1'/>
      <feMergeNode in='secondShadow_2'/>
      <feMergeNode in='secondShadow_3'/>
      <feMergeNode in='secondShadow_4'/>
      <feMergeNode in='secondShadow_5'/>
      <feMergeNode in='secondShadow_6'/>
      <feMergeNode in='secondShadow_7'/>
      <feMergeNode in='secondShadow_8'/>
      <feMergeNode in='secondShadow_9'/>
      <feMergeNode in='secondShadow_10'/>
      <feMergeNode in='secondShadow_11'/>
    </feMerge>

    <feImage x='0' y='0' width='${WIDTH}' height='${HEIGHT}' xlink:href='https://s3-us-west-2.amazonaws.com/s.cdpn.io/78779/stripes.svg'/>
    <feComposite in2='secondShadow' operator='in' result='secondShadow'/>

    <feMerge>
      <feMergeNode in='secondShadow'/>
      <feMergeNode in='border'/>
      <feMergeNode in='shadow'/>
      <feMergeNode in='SourceGraphic'/>
    </feMerge>
  </filter>

  <text dominant-baseline='middle' text-anchor='middle' x='50%' y='50%'>
    ${TEXT}
  </text>
</svg>
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

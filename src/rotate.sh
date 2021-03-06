MODULE="rotate"
TITLE=${MODULE^^}

WORD_COLORS=(wisteria belize pomegranate green midnight)

SPAN_TEXT=''
if ((${#@} > 0)); then
  for TEXTS in "$@"; do
    # replace spaces with &ensp;
    SUB="${TEXTS// /&ensp;}"
    RAN=$((RANDOM % 4))
    ADJ=${WORD_COLORS[$RAN]}
    SPAN_TEXT+="<span class='word $ADJ'>${SUB}</span>"
  done
else
  SPAN_TEXT="<span class='word wisteria'>rotates.</span><span class='word belize'>do&ensp;more.</span>"
fi

fn_rotate() {
  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:600);

html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 600;
  font-size: ${SIZE}vw;
  background-color:${BCOLOR};
}

.text {
  width: 100%;
  padding:${PADDING};
}

p {
  display: inline-block;
  vertical-align: top;
  margin: 0;
}

.word {
  position: absolute;
  opacity: 0;
}

.letter {
  display: inline-block;
  position: relative;
  float: left;
  transform: translateZ(25px);
  transform-origin: 50% 50% 25px;
  letter-spacing: -1px;
}

.letter.out {
  transform: rotateX(90deg);
  transition: transform 0.32s cubic-bezier(0.55, 0.055, 0.675, 0.19);
}

.letter.behind {
  transform: rotateX(-90deg);
}

.letter.in {
  transform: rotateX(0deg);
  transition: transform 0.38s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.wisteria {
  color: #8e44ad;
}

.belize {
  color: #2980b9;
}

.pomegranate {
  color: #c0392b;
}

.green {
  color: #16a085;
}

.midnight {
  color: #2c3e50;
}

</style>
</head>
<body>
<div class="text">
  <p>${TEXT}&ensp;${SPAN_TEXT}
  </p>
</div>
<script type="text/javascript" src="${script_dir}/assets/js/rotate.js"></script>
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

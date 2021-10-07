MODULE="rotate"

# for line-height
# if [ "$SIZE" -gt 0 ]; then
#     LHEIGHT=$(echo "$SIZE*1.1" | bc)
#     LINE_HEIGHT="${LHEIGHT%%.*}"
# fi

WORD_COLORS=(wisteria belize pomegranate green midnight)

# n=$((n - 1))
# echo "${WORD_COLORS[$n]}"
# for i in "${WORD_COLORS[@]}"; do
#     echo $i
# done
echo "${#@}"

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
  cat <<EOF >"${script_dir}/outputs/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
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
  letter-spacing: -5px;
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

  # check if $RETRO_OUTPUT exist
  if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
  fi

  # open browser
  if [[ $(uname) == "Linux" ]]; then
    xdg-open "file:///${script_dir}/outputs/${MODULE}.html"
  elif [[ $(uname) == "Darwin" ]]; then
    open "file:///${script_dir}/outputs/${MODULE}.html"
  fi

  # eval "$FIREFOX" --headless --screenshot "${OUTPUT_DIR}/${MODULE}.png" "file:///${script_dir}/outputs/${MODULE}.html" --window-size="${WIDTH},${HEIGHT}" >/dev/null 2>&1 || {
  #     echo "Something went wrong."
  #     exit
  # }

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

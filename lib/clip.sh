MODULE="clip"
TITLE=${MODULE^^}

GFONT="${FONT_NAME// /+}"
# BROWSER_HEIGHT=$(($HEIGHT - 200))
GF="https://fonts.googleapis.com/css2?family=${GFONT}${FONT_ATT}&display=swap"

# check_bg
# echo "$BKIMG"
if [ ! -f "$BKIMG" ]; then
  echo "You image is not found."
  echo "Please use the absolute path to your image. /Path/to/image.jpg"
  exit 1
fi

fn_clip() {

  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
    @import url("$GF");
html {
    position: relative;
    height: 100%;
}

body {
  padding:0;
  margin:0;
  font-family: "Luckiest Guy";
  background-color:#eee;
}

html, body {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align:center;
}

.container {
    padding:${PADDING};
}
h1 {
  font-size: ${SIZE}px;
  background-image: url($BKIMG);
  background-size: cover;
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
  padding: 0 50px;
  text-align:center;
}
</style>
</head>
<body>
<div class="container">
<h1 class="center">${TEXT}</h1>
</div>
</body>
</html>
EOF

  wkhtmltoimage --width "$WIDTH" --height "$HEIGHT" --enable-local-file-access "${OUTPUT_DIR}/${MODULE}.html" "${OUTPUT_DIR}/${MODULE}.png" >/dev/null 2>&1 || {
    echo "Something weng wrong."
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
	fi

  echo "The image location is $OUTPUT_DIR/${MODULE}.png."
}

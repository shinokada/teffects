MODULE="neon"
TITLE=${MODULE^^}

fn_neon() {
  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Archivo+Black&display=swap" rel="stylesheet">
<style>
:root {
  --shadow-color: #FF9E9E;
  --shadow-color-light: white;
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

html, body {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: ${BCOLOR};
}

body {
  font-family: "Archivo", sans-serif;
  background-color: ${BCOLOR};

}
.neon {
  font-size: ${SIZE}vw;
  font-family: "Archivo Black", "Archivo", sans-serif;
  font-weight: normal;
  display: block;
  height: auto;
  text-align: ${ALIGN};
  color: white;
  animation: neon 3s infinite;
  padding:${PADDING};
}

@keyframes neon {
  0% {
    text-shadow: -1px -1px 1px var(--shadow-color-light), -1px 1px 1px var(--shadow-color-light), 1px -1px 1px var(--shadow-color-light), 1px 1px 1px var(--shadow-color-light),
    0 0 3px var(--shadow-color-light), 0 0 10px var(--shadow-color-light), 0 0 20px var(--shadow-color-light),
    0 0 30px var(--shadow-color), 0 0 40px var(--shadow-color), 0 0 50px var(--shadow-color), 0 0 70px var(--shadow-color), 0 0 100px var(--shadow-color), 0 0 200px var(--shadow-color);
  }
  50% {
    text-shadow: -1px -1px 1px var(--shadow-color-light), -1px 1px 1px var(--shadow-color-light), 1px -1px 1px var(--shadow-color-light), 1px 1px 1px var(--shadow-color-light),
    0 0 5px var(--shadow-color-light), 0 0 15px var(--shadow-color-light), 0 0 25px var(--shadow-color-light),
    0 0 40px var(--shadow-color), 0 0 50px var(--shadow-color), 0 0 60px var(--shadow-color), 0 0 80px var(--shadow-color), 0 0 110px var(--shadow-color), 0 0 210px var(--shadow-color);
  }
  100% {
    text-shadow: -1px -1px 1px var(--shadow-color-light), -1px 1px 1px var(--shadow-color-light), 1px -1px 1px var(--shadow-color-light), 1px 1px 1px var(--shadow-color-light),
    0 0 3px var(--shadow-color-light), 0 0 10px var(--shadow-color-light), 0 0 20px var(--shadow-color-light),
    0 0 30px var(--shadow-color), 0 0 40px var(--shadow-color), 0 0 50px var(--shadow-color), 0 0 70px var(--shadow-color), 0 0 100px var(--shadow-color), 0 0 200px var(--shadow-color);
  }
}
</style>
</head>
<body>
<div class="neon">${TEXT}</div>
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

  echo "Pop art image is done! Open $OUTPUT_DIR/$MODULE.png."
  # echo "BROWSER: $BROWSER"
  if [ "$BROWSER" = 1 ]; then
    # open browser
    if [[ $(uname) == "Linux" ]]; then
      xdg-open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
    elif [[ $(uname) == "Darwin" ]]; then
      open "file:///${OUTPUT_DIR}/${MODULE}.html" >/dev/null 2>&1
    fi
    echo "${MODULE} image is on a browser."
  fi

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

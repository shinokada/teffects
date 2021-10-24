MODULE="squiggle"
TITLE=${MODULE^^}

fn_squiggle() {
  cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
	<title>${TITLE}</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
@import url("https://fonts.googleapis.com/css?family=Amatic+SC:400,700");
html, body {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  vertical-align: middle;
}
body {
  font-family: 'Amatic SC', sans-serif;
  font-size: ${SIZE}vw;
  background: ${BCOLOR};
  color: ${COLOR};
  text-align: center;
}
.squig {
  animation: squiggly-anim 0.34s linear infinite;
}

.small {
  font-size: 0.5em;
}
.smaller {
  font-size: 0.4em;
}
p {
  margin: 0;
}
@-moz-keyframes squiggly-anim {
  0% {
    filter: url("#squiggly-0");
  }
  25% {
    filter: url("#squiggly-1");
  }
  50% {
    filter: url("#squiggly-2");
  }
  75% {
    filter: url("#squiggly-3");
  }
  100% {
    filter: url("#squiggly-4");
  }
}
@-webkit-keyframes squiggly-anim {
  0% {
    filter: url("#squiggly-0");
  }
  25% {
    filter: url("#squiggly-1");
  }
  50% {
    filter: url("#squiggly-2");
  }
  75% {
    filter: url("#squiggly-3");
  }
  100% {
    filter: url("#squiggly-4");
  }
}
@-o-keyframes squiggly-anim {
  0% {
    filter: url("#squiggly-0");
  }
  25% {
    filter: url("#squiggly-1");
  }
  50% {
    filter: url("#squiggly-2");
  }
  75% {
    filter: url("#squiggly-3");
  }
  100% {
    filter: url("#squiggly-4");
  }
}
@keyframes squiggly-anim {
  0% {
    filter: url("#squiggly-0");
  }
  25% {
    filter: url("#squiggly-1");
  }
  50% {
    filter: url("#squiggly-2");
  }
  75% {
    filter: url("#squiggly-3");
  }
  100% {
    filter: url("#squiggly-4");
  }
}

.container {
	padding:${PADDING};
}

.container::before{
  content: "";
  background-image: url('${BIMG}/${WIDTH}x${HEIGHT}');
  background-size: cover;
  position: absolute;
  top: 0px;
  right: 0px;
  bottom: 0px;
  left: 0px;
  opacity: 0.75;
}
</style>
</head>
<body>
<div class="container">
	<div class="squig" contenteditable>
        ${TEXT}
    </div>

<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
  <defs>
    <filter id="squiggly-0">
      <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="0"/>
      <feDisplacementMap id="displacement" in="SourceGraphic" in2="noise" scale="6" />
    </filter>
    <filter id="squiggly-1">
      <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="1"/>
<feDisplacementMap in="SourceGraphic" in2="noise" scale="8" />
    </filter>
    
    <filter id="squiggly-2">
      <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="2"/>
<feDisplacementMap in="SourceGraphic" in2="noise" scale="6" />
    </filter>
    <filter id="squiggly-3">
      <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="3"/>
<feDisplacementMap in="SourceGraphic" in2="noise" scale="8" />
    </filter>
    
    <filter id="squiggly-4">
      <feTurbulence id="turbulence" baseFrequency="0.02" numOctaves="3" result="noise" seed="4"/>
<feDisplacementMap in="SourceGraphic" in2="noise" scale="6" />
    </filter>
  </defs> 
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
  fi

  echo "The image location is $OUTPUT_DIR/${MODULE}.png."

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

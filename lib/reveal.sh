MODULE="reveal"
TITLE=${MODULE^^}

# WORD_COLORS=(wisteria belize pomegranate green midnight)

# SPAN_TEXT=''
# if ((${#@} > 0)); then
#   for TEXTS in "$@"; do
#     # replace spaces with &ensp;
#     SUB="${TEXTS// /&ensp;}"
#     RAN=$((RANDOM % 4))
#     ADJ=${WORD_COLORS[$RAN]}
#     SPAN_TEXT+="<span class='word $ADJ'>${SUB}</span>"
#   done
# else
#   SPAN_TEXT="<span class='word wisteria'>rotates.</span><span class='word belize'>do&ensp;more.</span>"
# fi

fn_reveal() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
body, html {
	 height: 100%;
}
 body {
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 flex-wrap: wrap;
	 font-family: 'Lato';
	 font-weight: 900;
	 color: ${COLOR};
     background-color: ${BCOLOR};
	 position: relative;
}
 .text {
	 display: inline-block;
	 font-size: ${SIZE}vmin;
	 line-height: 1.205;
}
 .text__first, .text__second {
	 position: relative;
}
 .text__word {
	 opacity: 0;
}
 .text__first-bg, .text__second-bg {
	 display: block;
	 width: 100%;
	 height: 100%;
	 position: absolute;
	 left: 0;
	 top: 0;
	 z-index: 100;
	 transform-origin: left;
	 transform: scaleX(0);
}
 .text__first-bg {
	 background-color: ${TCOVER};
}
 .text__second-bg {
	 background-color: ${BCOVER};
}
 .text__second {
	 margin-left: 15vmin;
}
 .restart {
	 position: absolute;
	 font-size: 12px;
	 bottom: 0;
	 left: 0;
	 right: 0;
	 background-color: ${BCOLOR};
	 border: none;
	 border-bottom: 1px dotted grey;
	 padding: 0;
	 margin: 0 auto 2%;
	 cursor: pointer;
	 color: grey;
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
	opacity: ${BOPACITY};
}

</style>
</head>
<body>
<div class="container">
  <p class="text"> 
  <span class="text__first">
  <span class="text__word">${TEXT1} </span>
  <span class="text__first-bg"></span>
  </span>
  <br />
  <span class="text__second"><span class="text__word">${TEXT2}</span>
  <span class="text__second-bg"></span>
  </span>
  </p>
  
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<script type="text/javascript" src="${script_dir}/assets/js/reveal.js"></script>
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

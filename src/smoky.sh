MODULE="smoky"
TITLE=${MODULE^^}

SPAN_TEXT=''
for ((i = 0; i < ${#TEXT}; i++)); do
	LETTER="${TEXT:$i:1}"
	# replace spaces with &ensp;
	SUB="${LETTER// /&nbsp;}"
	# echo $SUB
	SPAN_TEXT+="<span>${SUB}</span>"
done

fn_smoky() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url(https://fonts.googleapis.com/css?family=Finger+Paint);
html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
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
	opacity: ${BOPACITY};
}

 body {
	 background: ${BCOLOR};
	 overflow: hidden;
	 font: ${SIZE}vw/100vh "Finger Paint";
	 text-align: center;
	 color: transparent;
	 backface-visibility: hidden;
}
 span {
	 display: inline-block;
	 text-shadow: 0 0 0 whitesmoke;
	 animation: smoky 5s 3s both;
}
 span:nth-child(even) {
	 animation-name: smoky-mirror;
}
 @keyframes smoky {
	 60% {
		 text-shadow: 0 0 40px whitesmoke;
	}
	 to {
		 transform: translate3d(15rem, -8rem, 0) rotate(-40deg) skewX(70deg) scale(1.5);
		 text-shadow: 0 0 20px whitesmoke;
		 opacity: 0;
	}
}
 @keyframes smoky-mirror {
	 60% {
		 text-shadow: 0 0 40px whitesmoke;
	}
	 to {
		 transform: translate3d(18rem, -8rem, 0) rotate(-40deg) skewX(-70deg) scale(2);
		 text-shadow: 0 0 20px whitesmoke;
		 opacity: 0;
	}
}
 span:nth-of-type(1) {
	 animation-delay: 3.1s;
}
 span:nth-of-type(2) {
	 animation-delay: 3.2s;
}
 span:nth-of-type(3) {
	 animation-delay: 3.3s;
}
 span:nth-of-type(4) {
	 animation-delay: 3.4s;
}
 span:nth-of-type(5) {
	 animation-delay: 3.5s;
}
 span:nth-of-type(6) {
	 animation-delay: 3.6s;
}
 span:nth-of-type(7) {
	 animation-delay: 3.7s;
}
 span:nth-of-type(8) {
	 animation-delay: 3.8s;
}
 span:nth-of-type(9) {
	 animation-delay: 3.9s;
}
 span:nth-of-type(10) {
	 animation-delay: 4s;
}
 span:nth-of-type(11) {
	 animation-delay: 4.1s;
}
 span:nth-of-type(12) {
	 animation-delay: 4.2s;
}
 span:nth-of-type(13) {
	 animation-delay: 4.3s;
}
 span:nth-of-type(14) {
	 animation-delay: 4.4s;
}
 span:nth-of-type(15) {
	 animation-delay: 4.5s;
}
 span:nth-of-type(16) {
	 animation-delay: 4.6s;
}
 span:nth-of-type(17) {
	 animation-delay: 4.7s;
}
 span:nth-of-type(18) {
	 animation-delay: 4.8s;
}
 span:nth-of-type(19) {
	 animation-delay: 4.9s;
}
 span:nth-of-type(20) {
	 animation-delay: 5s;
}
 span:nth-of-type(21) {
	 animation-delay: 5.1s;
}
 
</style>
</head>
<body>
<div class="container">
${SPAN_TEXT}
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

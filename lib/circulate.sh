set +eu

MODULE="circulate"
TITLE=${MODULE^^}

DCOLORS=(f2385a f5a503 e9f1df 56d9cd 3aa1bf)
COL_NUM=${#DCOLORS[@]}
spaces() {
	echo "$1" | grep -o " " | wc -l | tr -d '[:space:]'
}

fn_trim() {
	echo -e "$1" | sed -e 's/^[[:space:]]*//' | sed -e 's/[[:space:]]*$//'
}

if [ -n "$COLORS" ]; then
	NARR=$(fn_trim "$COLORS")
	read -ra user_input <<<"$NARR"
	SPACES=$(spaces "${NARR[@]}")
	MIN=$((SPACES < COL_NUM ? SPACES : COL_NUM))
	i=0
	while [ $i -lt "$MIN" ]; do
		val=${user_input[$i]}
		DCOLORS[$i]=$val
		((i++))
	done
fi

fn_circulate() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
	<title>${TITLE}</title>
	<meta charset="UTF-8">
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:800);
body {
	 background: ${BCOLOR};
	 background-size: 0.2em 100%;
	 font: ${SIZE}vw Open Sans, Impact;
	 text-transform: uppercase;
	 margin: 0;
}

 svg {
	 position: absolute;
	 width: ${WIDTH}px;
	 height: ${HEIGHT}px;
}

/* Main styles */
 .text {
	 fill: none;
	 stroke-width: 3;
	 stroke-linejoin: round;
	 stroke-dasharray: 70 330;
	 stroke-dashoffset: 0;
	 -webkit-animation: stroke 6s infinite linear;
	 animation: stroke 6s infinite linear;
}
 .text:nth-child(5n + 1) {
	 stroke: #${DCOLORS[0]};
	 -webkit-animation-delay: -1.2s;
	 animation-delay: -1.2s;
}
 .text:nth-child(5n + 2) {
	 stroke: #${DCOLORS[1]};
	 -webkit-animation-delay: -2.4s;
	 animation-delay: -2.4s;
}
 .text:nth-child(5n + 3) {
	 stroke: #${DCOLORS[2]};
	 -webkit-animation-delay: -3.6s;
	 animation-delay: -3.6s;
}
 .text:nth-child(5n + 4) {
	 stroke: #${DCOLORS[3]};
	 -webkit-animation-delay: -4.8s;
	 animation-delay: -4.8s;
}
 .text:nth-child(5n + 5) {
	 stroke: #${DCOLORS[4]};
	 -webkit-animation-delay: -6s;
	 animation-delay: -6s;
}
 @-webkit-keyframes stroke {
	 100% {
		 stroke-dashoffset: -400;
	}
}
 @keyframes stroke {
	 100% {
		 stroke-dashoffset: -400;
	}
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
<svg>
    <!-- Symbol-->
    <symbol id="s-text"><text text-anchor="middle" x="50%" y="50%" dy=".35em">${TEXT}</text>
    </symbol>
    <!-- Duplicate symbols-->
    <use class="text" xlink:href="#s-text"></use>
    <use class="text" xlink:href="#s-text"></use>
    <use class="text" xlink:href="#s-text"></use>
    <use class="text" xlink:href="#s-text"></use>
    <use class="text" xlink:href="#s-text"></use>
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

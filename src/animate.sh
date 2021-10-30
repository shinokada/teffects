MODULE="animate"
TITLE=${MODULE^^}

SPAN_TEXT=''
for ((i = 0; i < ${#TEXT}; i++)); do
    LETTER="${TEXT:$i:1}"
    # replace spaces with &ensp;
    SUB="${LETTER// /&nbsp;}"
    # echo $SUB
    SPAN_TEXT+="<span>${SUB}</span>"
done

fn_animate() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css?family=Anton|Roboto');

html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
    text-align:${ALIGN};
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

.word {
	font-family: 'Anton', sans-serif;
	perspective: 1000px; 
}

.word span {
	cursor: pointer;
	display: inline-block;
	font-size: 100px;
	user-select: none;
	line-height: 1.2;
}

.word span:nth-child(5n+1).active {
	animation: balance 1.5s ease-out;
	transform-origin: bottom left;
}

@keyframes balance {
	0%, 100% {
		transform: rotate(0deg);
	}
	
	30%, 60% {
		transform: rotate(-45deg);
	}
}

.word span:nth-child(5n+2).active {
	animation: shrinkjump 1s ease-in-out;
	transform-origin: bottom center;
}

@keyframes shrinkjump {
	10%, 35% {
		transform: scale(2, .2) translate(0, 0);
	}
	
	45%, 50% {
		transform: scale(1) translate(0, -150px);
	}
	
	80% {
		transform: scale(1) translate(0, 0);
	}
}

.word span:nth-child(5n+3).active {
	animation: falling 2s ease-out;
	transform-origin: bottom center;
}

@keyframes falling {
	12% {
		transform: rotateX(240deg);
	}
	
	24% {
		transform: rotateX(150deg);
	}
	
	36% {
		transform: rotateX(200deg);
	}
	
	48% {
		transform: rotateX(175deg);
	}
	
	60%, 85% {
		transform: rotateX(180deg);
	}
	
	100% {
		transform: rotateX(0deg);
	}
}

.word span:nth-child(5n+4).active {
	animation: rotate 1s ease-out;
}

@keyframes rotate {
	20%, 80% {
		transform: rotateY(180deg);
	}
	
	100% {
		transform: rotateY(360deg);
	}
}

.word span:nth-child(5n).active {
	animation: toplong 1.5s linear;
}

@keyframes toplong {
	10%, 40% {
		transform: translateY(-48vh) scaleY(1);
	}
	
	90% {
		transform: translateY(-48vh) scaleY(4);
	}
}

/* Other styles */
body {
	background-color: skyblue;
	color: #fff;
	display: flex;
	font-family: 'Roboto', sans-serif;
	justify-content: center;
	align-items: center;
	flex-direction: row;
	height: 100vh;
	margin: 0;
}

.fixed {
	position: fixed;
	top: 40px;
	left: 50%;
	transform: translateX(-50%);
}

footer {
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	text-align: center;
	letter-spacing: 1px;
}

footer i {
	color: red;
}

footer a {
	color: #3C97BF;
	text-decoration: none;
}
</style>
</head>
<body>
<div class="container">
<div class="word">
	${SPAN_TEXT}
</div>
</div>
<script type="text/javascript" src="${script_dir}/assets/js/animate.js"></script>
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

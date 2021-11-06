MODULE="blob"
TITLE=${MODULE^^}

# for line-height
if [ "$SIZE" -gt 0 ]; then
	LHEIGHT=$(echo "$SIZE*1.2" | bc)
	LINE_HEIGHT="${LHEIGHT%%.*}"
fi

fn_blob() {
	cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css?family=Titan+One');

body{text-align:${ALIGN};}
div{display:block;position:absolute}

.container{
	width:100%;
	height:100%;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
}

h1{
	background:#fff;
	width:100%;
	height:100%;
	margin:0;
	padding:0;
	display:flex;
	font-family:'Titan One',cursive;
	font-size:${SIZE}vw;
	font-weight:700;
	flex-flow:row wrap;
	align-content:center;
	justify-content:center;
	}

h1 span{width:100%;position:relative;}

h1 span:before{
	background:linear-gradient(45deg,#fc5c7d,#6a82fb,#fc5c7d);
	width:100%;
	height:100%;
	display:block;
	position:absolute;
	content:"";
	mix-blend-mode:screen;
	}

[class*="blobs"]
	{mix-blend-mode:color;animation:blobs 15s ease-in-out infinite alternate;}

.blobs_1{
	background:#ff1493;
	width:250px;
	height:250px;
	top:35%;
	left:0%;
	}

.blobs_2{
	background:#ff4500;
	width:250px;
	height:250px;
	top:55%;
	left:25%;
	}

.blobs_3{
	background:#00ff00;
	width:250px;
	height:250px;
	top:15%;
	left:20%;
	}

.blobs_4{
	background:#ff0000;
	width:250px;
	height:250px;
	top:40%;
	left:45%;
	}

.blobs_5{
	background:#ffff00;
	width:250px;
	height:250px;
	top:25%;
	left:60%;
	}

.blobs_6{
	background:#00ffff;
	width:200px;
	height:200px;
	top:45%;
	left:75%;
	}

.blobs_7{
	background:#ff8c00;
	width:300px;
	height:300px;
	top:25%;
	left:80%;
	}

@keyframes blobs{
	0%{border-radius:26% 74% 61% 39% / 54% 67% 33% 46%}
	10%{border-radius:74% 26% 47% 53% / 68% 46% 54% 32%}
	20%{border-radius:48% 52% 30% 70% / 27% 37% 63% 73%}
	30%{border-radius:73% 27% 57% 43% / 28% 67% 33% 72%}
	40%{border-radius:63% 37% 56% 44% / 25% 28% 72% 75%}
	50%{border-radius:39% 61% 70% 30% / 61% 29% 71% 39%}
	60%{border-radius:27% 73% 29% 71% / 73% 51% 49% 27%}
	70%{border-radius:39% 61% 65% 35% / 74% 65% 35% 26%}
	80%{border-radius:55% 45% 37% 63% / 38% 30% 70% 62%}
	90%{border-radius:25% 75% 70% 30% / 39% 50% 50% 61%}
	100%{border-radius:66% 34% 33% 67% / 65% 73% 27% 35%}
	}
</style>
</head>
<body>

<div class="container">
	<h1><span>${TEXT}</span></h1>
	
	<div class="blobs_1"></div>
	<div class="blobs_2"></div>
	<div class="blobs_3"></div>
	<div class="blobs_4"></div>
	<div class="blobs_5"></div>
	<div class="blobs_6"></div>
	<div class="blobs_7"></div>
</div>
</body>
</html>
EOF

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

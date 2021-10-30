set +u

MODULE="transmission"
TITLE=${MODULE^^}

T_LEN=${#TTEXT}
TSPAN_STYLE=""
DELAY=1
for ((t = 1; t <= ${T_LEN}; t++)); do
    DELAY=$(bc <<<"$DELAY+0.05")
    TSPAN_STYLE+=".mast__title span:nth-child(${t}) {
    animation-delay: ${DELAY}s;
    }
    
    "
done

S_LEN=${#STEXT}
SSPAN_CHILD=""
for ((s = 1; s <= ${S_LEN}; s++)); do
    DELAY=$(bc <<<"$DELAY+0.05")
    SSPAN_CHILD+=".mast__text span:nth-child(${s}) {
    animation-delay: ${DELAY}s;
    }
    
    "
done

fn_transmission() {
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

*, *:before, *:after {
    box-sizing: border-box;
}
body {
    margin: 0;
    width: 100%;
    font-family: "Cutive Mono", monospace;
    line-height: 1.5;
    font-weight: 400;
    font-style: normal;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-rendering: optimizeLegibility;
}
.sep {
    border: 0;
    width: 3em;
    height: 1px;
    margin: 1em 0;
    background-color: rgba(255, 255, 255, 0.4);
}
.mast {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
    height: 100vh;
    color: ${COLOR};
    background-color: ${BCOLOR};
}
.mast:after {
    z-index: 0;
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background: rgba(17, 17, 17, 0.9);
}
.mast > header {
    width:100%;
    padding:${PADDING};
    z-index: 2;
    position: relative;
}

.mast__header {
    padding: 5%;
}
.mast__title {
    font-family: "Cutive Mono", monospace;
    font-size: ${TSIZE}vw;
    font-weight: 400;
    letter-spacing: 0.1em;
    text-transform: uppercase;
}
.mast__title span {
    animation: letter-glow 0.7s 0s ease both;
}

${TSPAN_STYLE}

.mast__text {
    font-family: "Cutive Mono", monospace;
    font-size: ${SSIZE}vw;
    margin: 0 0 0.1em;
    line-height: 1.5;
    white-space: pre;
}

.mast__text span {
    animation: letter-glow 0.7s 0s ease both;
}

${SSPAN_CHILD}

@keyframes letter-glow {
    0% {
        opacity: 0;
        text-shadow: 0px 0px 1px rgba(255, 255, 255, 0.1);
}
    66% {
        opacity: 1;
        text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.9);
}
    77% {
        opacity: 1;
}
    100% {
        opacity: 0.7;
        text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.0);
}
}

.mast::before{
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
<main>
    <section class="mast">
        <header class="mast__header">
            <h1 class="mast__title js-spanize">${TTEXT}</h1> 
            <hr class="sep"/>
            <p class="mast__text js-spanize">${STEXT}</p>
        </header>
    </section>
</main>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="${script_dir}/assets/js/transmission.js"></script>
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

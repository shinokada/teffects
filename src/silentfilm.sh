MODULE="slientfilm"
TITLE=${MODULE^^}

fn_silentfilm() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link href="https://fonts.googleapis.com/css?family=Bellefair" rel="stylesheet">
<style>
.main-content {
    overflow:hidden;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-flow: column;
    height: 100vh;
    background: linear-gradient(to right, rgba(36,31,31,1) 0%, rgba(36,31,31,1) 32%, rgba(74,71,70,1) 100%);
    color: #fff;
    text-align: ${ALIGN};
}

.vignette{
    position:absolute;
    width:100%; height:100%;
    box-shadow:inset 0px 0px 150px 20px black;
    mix-blend-mode: multiply;
    -webkit-animation: vignette-anim 3s infinite; /* Safari 4+ */
    -moz-animation:    vignette-anim 3s infinite; /* Fx 5+ */
    -o-animation:      vignette-anim 3s infinite; /* Opera 12+ */
    animation:         vignette-anim 3s infinite; /* IE 10+, Fx 29+ */
}

.noise {
    z-index: 100;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    opacity: .15;
}

.line{
    position:absolute;
    height:100%; width:1px;
    opacity:0.1;
    background-color:#000;
}

.titleCont{
    position:relative;
    width:${CONTWIDTH}px;
}

.main-title {
    padding: .3em 1em .25em;    
    font-weight: 400;
    font-size: ${SIZE}vw;
    color: white;
    font-family: 'Bellefair', serif;
    position:relative;
    line-height:1.3;
    white-spacing:
}

.overTitle{
    position:absolute;
    top:0;
    left:0;
}

.dot{
    width:3px;
    height:2px;
    background-color:white;
    position:absolute;
    opacity:0.3;
}

@-webkit-keyframes vignette-anim {
    0%   , 100%{ opacity: 1; }
    50% { opacity: 0.7; }
}
@-moz-keyframes vignette-anim {
    0%   , 100%{ opacity: 1; }
    50% { opacity: 0.7; }
}
@-o-keyframes vignette-anim {
    0%   , 100%{ opacity: 1; }
    50% { opacity: 0.7; }
}
@keyframes vignette-anim {
    0%   , 100%{ opacity: 1; }
    50% { opacity: 0.7; }
}
</style>
</head>
<body>
<div class="container">
  <main role="main" class="main-content" id="main-content">
    <div class="titleCont">
        <h1 class="main-title" id="main-title">
            ${TEXT}
        </h1>
    </div>
    <canvas id="noise" class="noise"></canvas>
  <div class="vignette"></div>
</main>
  
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<script type="text/javascript" src="${script_dir}/assets/js/talkie.js"></script>
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

MODULE="dashed-shadow"
TITLE=${MODULE^^}

dash_type() {
    case $1 in
    h) DSTYLE="hello" ;;
    s) DSTYLE="sorta" ;;
    i) DSTYLE="hipsterish" ;;
    d) DSTYLE="dashed-shadow-text" ;;
    esac
}

dash_type $STYLE

CONTENT=""
if [ "${DSTYLE}" = "sorta" ]; then
    CONTENT+="<div class='sorta-block'>"
fi

CONTENT+=$(printf "<div class='container'><div data-text='%s' class='dashed-shadow ${DSTYLE}'>%s</div></div>" "$TEXT" "$TEXT")

if [ "${DSTYLE}" = "sorta" ]; then
    CONTENT+="</div>"
fi

fn_dashed-shadow() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>${TITLE}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link href='https://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Sancreek' rel='stylesheet' type='text/css'>
<style>
html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: "Inter", sans-serif;
	background-color: ${BCOLOR};
	text-align:${ALIGN};
}

body {
    font-family: 'Open Sans Condensed', sans-serif;
    font-size: ${SIZE}vw;
    text-align: ${ALIGN};
    line-height: 1.4;
}

.container{
    padding:${PADDING};
}

.dashed-shadow {
    position: relative;
    top: 8px;
    left: 8px;
    display: inline-block;
    color: ${COLOR};
}
@keyframes dash-animation {
    0% {
        background-position: 0 0;
}
    100% {
        background-position: 100% 0;
}
}
.dashed-shadow:before {
    content: " ";
    display: block;
    position: absolute;
    top: -8px;
    left: -8px;
    bottom: -2px;
    right: -2px;
    z-index: 1;
    background-size: 6px 6px;
}
.dashed-shadow:hover:before {
    animation: dash-animation 30s infinite linear;
}
.dashed-shadow:after {
    z-index: 2;
    content: attr(data-text);
    position: absolute;
    left: -8px;
    top: -8px;
    color: #b85b3f;
    text-shadow: 3px 3px #e8e3c7;
}
.hello {
    font-family: 'Cookie', cursive;
    font-size: ${SIZE}vw;
}
.sorta-block {
    font-size: ${SIZE}vw;
    line-height: 1.1em;
    z-index: 3;
    position: relative;
    margin-top: 20px;
    margin-bottom: 10px;
}
.sorta {
    border-top: 4px solid #b85b3f;
    border-bottom: 4px solid #b85b3f;
    text-transform: uppercase;
    z-index: 3;
    font-style: italic;
}
.hipsterish {
    font-family: 'Sancreek', cursive;
    font-size: ${SIZE}vw;
}
.dashed-shadow-text {
    font-size: ${SIZE}vw;
    line-height: 0.7em;
}
.shadow {
    font-size: ${SIZE}vw;
    line-height: 0.8em;
}

.dashed-shadow:before {
    content: " ";
    display: block;
    position: absolute;
    top: -8px;
    left: -8px;
    bottom: -2px;
    right: -2px;
    z-index: 1;
    background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuMCIgeTE9IjEuMCIgeDI9IjEuMCIgeTI9IjAuMCI+PHN0b3Agb2Zmc2V0PSIxMi41JSIgc3RvcC1jb2xvcj0iI2U4ZTNjNyIvPjxzdG9wIG9mZnNldD0iMTIuNSUiIHN0b3AtY29sb3I9IiNlOGUzYzciIHN0b3Atb3BhY2l0eT0iMC4wIi8+PHN0b3Agb2Zmc2V0PSIzNy41JSIgc3RvcC1jb2xvcj0iI2U4ZTNjNyIgc3RvcC1vcGFjaXR5PSIwLjAiLz48c3RvcCBvZmZzZXQ9IjM3LjUlIiBzdG9wLWNvbG9yPSIjZThlM2M3Ii8+PHN0b3Agb2Zmc2V0PSI2Mi41JSIgc3RvcC1jb2xvcj0iI2U4ZTNjNyIvPjxzdG9wIG9mZnNldD0iNjIuNSUiIHN0b3AtY29sb3I9IiNlOGUzYzciIHN0b3Atb3BhY2l0eT0iMC4wIi8+PHN0b3Agb2Zmc2V0PSI4Ny41JSIgc3RvcC1jb2xvcj0iI2U4ZTNjNyIgc3RvcC1vcGFjaXR5PSIwLjAiLz48c3RvcCBvZmZzZXQ9Ijg3LjUlIiBzdG9wLWNvbG9yPSIjZThlM2M3Ii8+PC9saW5lYXJHcmFkaWVudD48L2RlZnM+PHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgZmlsbD0idXJsKCNncmFkKSIgLz48L3N2Zz4g);
    background-size: 100%;
    background-image: -moz-linear-gradient(45deg, #e8e3c7 12.5%, rgba(232, 227, 199, 0) 12.5%, rgba(232, 227, 199, 0) 37.5%, #e8e3c7 37.5%, #e8e3c7 62.5%, rgba(232, 227, 199, 0) 62.5%, rgba(232, 227, 199, 0) 87.5%, #e8e3c7 87.5%);
    background-image: -webkit-linear-gradient(
45deg, #e8e3c7 12.5%, rgba(232, 227, 199, 0) 12.5%, rgba(232, 227, 199, 0) 37.5%, #e8e3c7 37.5%, #e8e3c7 62.5%, rgba(232, 227, 199, 0) 62.5%, rgba(232, 227, 199, 0) 87.5%, #e8e3c7 87.5%);
    background-image: linear-gradient(
45deg, #e8e3c7 12.5%, rgba(232, 227, 199, 0) 12.5%, rgba(232, 227, 199, 0) 37.5%, #e8e3c7 37.5%, #e8e3c7 62.5%, rgba(232, 227, 199, 0) 62.5%, rgba(232, 227, 199, 0) 87.5%, #e8e3c7 87.5%);
    background-size: 6px 6px;
}

.sorta-block {
    font-size: ${SIZE}vw;
    line-height: 1.1em;
    -moz-transform: skew(0, -5deg);
    -ms-transform: skew(0, -5deg);
    -webkit-transform: skew(0, -5deg);
    transform: skew(0, -5deg);
    z-index: 3;
    position: relative;
    margin-top: 20px;
    margin-bottom: 10px;
}
</style>
</head>
<body>
${CONTENT}
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

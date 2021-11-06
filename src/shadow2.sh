MODULE="shadow2"
TITLE=${MODULE^^}

fn_shadow2() {
    cat <<EOF >"${OUTPUT_DIR}/${MODULE}.html"
<!DOCTYPE html>
<html lang="en" >
<head>
  <title>${TITLE}</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" rel="stylesheet">
<style>
html, body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container{
    padding:${PADDING};
}

h1 {
    font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", Lato, sans-serif;
    font-size: ${SIZE}vw;
    text-align: center;
    text-rendering: optimizeLegibility;
    line-height:1.3;
}
.elegant {
    color: #131313;
    background-color: #e7e5e4;
    letter-spacing: .15em;
    text-shadow: 1px -1px 0 #767676, -1px 2px 1px #737272, -2px 4px 1px #767474, -3px 6px 1px #787777, -4px 8px 1px #7b7a7a, -5px 10px 1px #7f7d7d, -6px 12px 1px #828181, -7px 14px 1px #868585, -8px 16px 1px #8b8a89, -9px 18px 1px #8f8e8d, -10px 20px 1px #949392, -11px 22px 1px #999897, -12px 24px 1px #9e9c9c, -13px 26px 1px #a3a1a1, -14px 28px 1px #a8a6a6, -15px 30px 1px #adabab, -16px 32px 1px #b2b1b0, -17px 34px 1px #b7b6b5, -18px 36px 1px #bcbbba, -19px 38px 1px #c1bfbf, -20px 40px 1px #c6c4c4, -21px 42px 1px #cbc9c8, -22px 44px 1px #cfcdcd, -23px 46px 1px #d4d2d1, -24px 48px 1px #d8d6d5, -25px 50px 1px #dbdad9, -26px 52px 1px #dfdddc, -27px 54px 1px #e2e0df, -28px 56px 1px #e4e3e2;
}
.deep {
    color: #e0dfdc;
    background-color: #333;
    letter-spacing: .1em;
    text-shadow: 0 -1px 0 #fff, 0 1px 0 #2e2e2e, 0 2px 0 #2c2c2c, 0 3px 0 #2a2a2a, 0 4px 0 #282828, 0 5px 0 #262626, 0 6px 0 #242424, 0 7px 0 #222, 0 8px 0 #202020, 0 9px 0 #1e1e1e, 0 10px 0 #1c1c1c, 0 11px 0 #1a1a1a, 0 12px 0 #181818, 0 13px 0 #161616, 0 14px 0 #141414, 0 15px 0 #121212, 0 22px 30px rgba(0,0,0,0.9);
}
.inset {
    color: #202020;
    background-color: #7d7d7d;
    letter-spacing: .1em;
    text-shadow: -1px -1px 1px #111, 2px 2px 1px #363636;
}
.retro {
    color: #2c2c2c;
    background-color: #d5d5d5;
    letter-spacing: .05em;
    text-shadow: 4px 4px 0px #d5d5d5, 7px 7px 0px rgba(0,0,0,0.2);
}

.long{
    background-color:#e74c3c;
    color: #fff;
    font-size: 8rem;
    line-height: 8rem;
    font-family: lato;
    font-weight: 900;
    text-align: center;
    text-shadow: 1px 1px rgb(123 25 15 / 50%), 2px 2px rgb(129 28 18 / 51%), 3px 3px rgb(135 31 20 / 52%), 4px 4px rgb(140 33 22 / 53%), 5px 5px rgb(145 36 24 / 54%), 6px 6px rgb(150 38 26 / 55%), 7px 7px rgb(154 40 28 / 56%), 8px 8px rgb(158 42 30 / 57%), 9px 9px rgb(162 44 31 / 58%), 10px 10px rgb(166 45 33 / 59%), 11px 11px rgb(169 47 34 / 60%), 12px 12px rgb(173 48 36 / 61%), 13px 13px rgb(176 50 37 / 62%), 14px 14px rgb(178 51 38 / 63%), 15px 15px rgb(181 52 39 / 64%), 16px 16px rgb(184 54 40 / 65%), 17px 17px rgb(186 55 41 / 66%), 18px 18px rgb(189 56 42 / 67%), 19px 19px rgb(191 57 43 / 68%), 20px 20px rgb(193 58 44 / 69%), 21px 21px rgb(195 59 45 / 70%), 22px 22px rgb(197 60 46 / 71%), 23px 23px rgb(199 61 47 / 72%), 24px 24px rgb(201 62 47 / 73%), 25px 25px rgb(202 62 48 / 74%), 26px 26px rgb(204 63 49 / 75%), 27px 27px rgb(206 64 49 / 76%), 28px 28px rgb(207 65 50 / 77%), 29px 29px rgb(209 65 51 / 78%), 30px 30px rgb(210 66 51 / 79%), 31px 31px rgb(211 67 52 / 80%), 32px 32px rgb(213 67 52 / 81%), 33px 33px rgb(214 68 53 / 82%), 34px 34px rgb(215 69 53 / 83%), 35px 35px rgb(216 69 54 / 84%), 36px 36px rgb(218 70 54 / 85%), 37px 37px rgb(219 70 55 / 86%), 38px 38px rgb(220 71 55 / 87%), 39px 39px rgb(221 71 56 / 88%), 40px 40px rgb(222 72 56 / 89%), 41px 41px rgb(223 72 57 / 90%), 42px 42px rgb(224 73 57 / 91%), 43px 43px rgb(225 73 57 / 92%), 44px 44px rgb(225 73 58 / 93%), 45px 45px rgb(226 74 58 / 94%), 46px 46px rgb(227 74 58 / 95%), 47px 47px rgb(228 75 59 / 96%), 48px 48px rgb(229 75 59 / 97%), 49px 49px rgb(230 75 59 / 98%), 50px 50px rgb(230 76 60 / 99%);
}


</style>
</head>
<body class="${SHADOW_TYPE}">
<div class="container">
<h1>${TEXT}</h1>
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

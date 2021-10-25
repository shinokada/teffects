MODULE="arcade"
TITLE=${MODULE^^}

fn_arcade() {
  STR=''
  # convert to lowercase
  LOWER=$(echo "$TEXT" | tr '[:upper:]' '[:lower:]')
  IFS=" " read -ra ADDR <<<"$LOWER"
  for WORD in "${ADDR[@]}"; do
    # echo "$WORD"
    WITH_SPACE=$(echo "$WORD" | sed 's/./& /g')
    STR+="<ol>"
    for i in $WITH_SPACE; do
      if [ "$i" = 0 ]; then
        i="zero"
      fi
      if [ "$i" = 1 ]; then
        i="one"
      fi
      if [ "$i" = 2 ]; then
        i="two"
      fi
      if [ "$i" = 3 ]; then
        i="three"
      fi
      if [ "$i" = 4 ]; then
        i="four"
      fi
      if [ "$i" = 5 ]; then
        i="five"
      fi
      if [ "$i" = 6 ]; then
        i="six"
      fi
      if [ "$i" = 7 ]; then
        i="seven"
      fi
      if [ "$i" = 8 ]; then
        i="eight"
      fi
      if [ "$i" = 9 ]; then
        i="nine"
      fi
      STR+="<li class=\"$i\"></li>"
    done
    STR+="</ol>"
  done
  # echo $STR
  # exit
  # WITH_SPACE=$(echo "$LOWER" | sed 's/./& /g')
  # for i in $WITH_SPACE; do
  #     STR+="<li class=\"$i\"></li>"
  # done

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
	font-family: "Inter", sans-serif;
	background-color: ${BCOLOR};
	text-align:${ALIGN};
}

.snow-bros li {
  width: 80px;
  height: 80px;
  margin: 10px;
  background-repeat: no-repeat;
  display: inline-block;
}
.snow-bros li.a {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 50px 10px, 30px 70px, 10px 10px, 20px 10px, 20px 20px, 10px 80px, 20px 60px, 10px 60px;
  background-position: 10px 0px, 0px 10px, 40px 10px, 50px 10px, 30px 30px, 30px 0px, 50px 20px, 70px 20px;
}
.snow-bros li.b {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 40px 10px, 10px 10px, 30px 20px, 40px 10px, 10px 10px, 20px 20px, 10px 80px, 20px 40px, 10px 40px;
  background-position: 0px 0px, 30px 0px, 40px 10px, 50px 10px, 30px 30px, 40px 40px, 30px 60px, 30px 0px, 50px 40px, 70px 40px;
}
.snow-bros li.c {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 60px, 20px 80px, 40px 10px, 10px 10px, 30px 10px, 30px 10px, 40px 10px, 20px 10px, 10px 80px;
  background-position: 0px 10px, 10px 0px, 30px 0px, 40px 10px, 50px 10px, 50px 50px, 30px 60px, 40px 70px, 30px 0px;
}
.snow-bros li.d {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 20px 10px, 20px 10px, 20px 10px, 30px 20px, 20px 40px, 10px 80px, 10px 30px;
  background-position: 0px 0px, 30px 0px, 40px 10px, 50px 20px, 30px 60px, 50px 30px, 30px 0px, 70px 30px;
}
.snow-bros li.e {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 50px 10px, 50px 10px, 50px 10px, 50px 10px, 50px 10px, 50px 10px, 10px 80px;
  background-position: 0px 0px, 30px 0px, 40px 10px, 30px 30px, 40px 40px, 30px 60px, 40px 70px, 30px 0px;
}
.snow-bros li.f {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 50px 10px, 50px 10px, 50px 10px, 50px 10px, 10px 80px;
  background-position: 0px 0px, 30px 0px, 40px 10px, 30px 30px, 40px 40px, 30px 0px;
}
.g {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 60px, 20px 80px, 40px 10px, 10px 10px, 20px 20px, 10px 20px, 20px 50px, 20px 20px, 10px 70px, 10px 80px;
  background-position: 0px 10px, 10px 0px, 30px 0px, 40px 10px, 50px 10px, 40px 30px, 50px 30px, 30px 60px, 70px 10px, 30px 0px;
}
.h {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 20px 20px, 10px 80px, 20px 80px, 10px 80px;
  background-position: 0px 0px, 30px 30px, 30px 0px, 50px 0px, 70px 0px;
}
.i {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 10px 80px;
  background-position: 20px 0px, 50px 0px;
}
.j {
  background-image: linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 40px 10px, 40px 10px, 10px 10px, 40px 20px, 10px 80px, 10px 70px, 10px 70px;
  background-position: 0px 40px, 0px 50px, 0px 60px, 10px 60px, 50px 0px, 60px 0px, 70px 0px;
}
.k {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #09c5d8, #09c5d8), linear-gradient(to top, #00a323, #00a323), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 30px 10px, 30px 10px, 30px 10px, 20px 10px, 20px 10px, 20px 10px, 30px 10px, 10px 80px, 30px 10px;
  background-position: 0px 0px, 50px 0px, 40px 10px, 30px 20px, 30px 30px, 30px 40px, 40px 50px, 40px 60px, 30px 0px, 50px 70px;
}
.l {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 50px 10px, 10px 80px, 50px 10px;
  background-position: 0px 0px, 30px 60px, 30px 0px, 30px 70px;
}
.m {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to bottom, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 10px, 30px 70px, 10px 30px, 10px 30px, 10px 40px, 20px 80px, 10px 80px;
  background-position: 0px 0px, 0px 10px, 30px 10px, 40px 10px, 30px 40px, 50px 0px, 70px 0px;
}
.n {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to bottom, #00a2e2 20px, #3d060a 20px), linear-gradient(to bottom, #00a2e2 10px, #09c5d8 10px, #09c5d8 20px, #3d060a 20px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 20px 80px, 10px 70px, 10px 60px, 10px 30px, 20px 80px, 10px 80px;
  background-position: 0px 0px, 20px 10px, 30px 20px, 40px 30px, 50px 0px, 70px 0px;
}
.o,
.zero {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 60px, 20px 80px, 20px 20px, 10px 10px, 20px 20px, 10px 80px, 10px 80px, 10px 60px, 10px 60px;
  background-position: 0px 10px, 10px 0px, 30px 0px, 60px 0px, 30px 60px, 30px 0px, 50px 0px, 60px 10px, 70px 10px;
}
.p {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 30px 10px, 10px 10px, 20px 10px, 30px 20px, 50px 10px, 10px 80px, 30px 10px;
  background-position: 0px 0px, 30px 0px, 40px 10px, 50px 10px, 50px 20px, 30px 40px, 30px 0px, 40px 50px;
}
.q {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #09c5d8 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 60px, 20px 80px, 20px 20px, 10px 10px, 20px 20px, 20px 20px, 10px 80px, 10px 80px, 10px 70px, 10px 70px;
  background-position: 0px 10px, 10px 0px, 30px 0px, 60px 0px, 30px 60px, 30px 40px, 30px 0px, 50px 0px, 60px 10px, 70px 10px;
}
.r {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to bottom, #00a2e2 10px, #09c5d8 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #00a323, #00a323), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 30px 80px, 40px 10px, 10px 10px, 20px 20px, 10px 80px, 30px 30px, 30px 10px, 20px 10px, 30px 10px, 30px 10px;
  background-position: 0px 0px, 30px 0px, 40px 10px, 30px 30px, 30px 0px, 50px 10px, 50px 40px, 40px 50px, 40px 60px, 50px 70px;
}
.s {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to right, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to right, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 60px 10px, 40px 20px, 30px 10px, 10px 10px, 30px 10px, 30px 10px, 40px 10px, 40px 10px, 30px 10px, 40px 10px, 30px 10px, 30px 10px, 40px 10px, 60px 10px;
  background-position: 10px 0px, 0px 10px, 40px 10px, 70px 10px, 50px 20px, 0px 30px, 30px 30px, 10px 40px, 50px 40px, 0px 50px, 50px 50px, 0px 60px, 30px 60px, 10px 70px;
}
.t {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 80px 10px, 30px 70px, 80px 10px, 10px 70px;
  background-position: 0px 0px, 20px 10px, 0px 10px, 50px 10px;
}
.u {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 70px, 20px 80px, 20px 20px, 10px 80px, 10px 80px, 10px 70px, 10px 70px;
  background-position: 0px 0px, 10px 0px, 30px 60px, 30px 0px, 50px 0px, 60px 0px, 70px 0px;
}
.v {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to right, #3d060a 10px, #09c5d8 10px), linear-gradient(to right, #3d060a 10px, #09c5d8 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 40px 40px, 30px 40px, 30px 10px, 30px 10px, 10px 10px, 30px 10px, 20px 10px, 20px 10px, 10px 10px, 10px 10px;
  background-position: 0px 0px, 50px 0px, 0px 40px, 30px 40px, 60px 40px, 10px 50px, 40px 50px, 20px 60px, 40px 60px, 30px 70px;
}
.w {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #09c5d8, #09c5d8), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 20px 80px, 10px 70px, 10px 30px, 20px 10px, 20px 10px, 20px 10px, 20px 80px, 10px 80px;
  background-position: 0px 0px, 20px 0px, 30px 0px, 30px 30px, 30px 40px, 30px 50px, 50px 0px, 70px 0px;
}
.x {
  background-image: linear-gradient(to top, #00a2e2, #00a2e2), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to right, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to right, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #00a2e2, #00a2e2), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to top, #09c5d8, #09c5d8), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to right, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 20px 10px, 30px 10px, 30px 10px, 30px 10px, 30px 10px, 20px 10px, 30px 10px, 30px 10px, 20px 10px, 30px 10px, 30px 10px, 20px 10px, 20px 10px, 10px 10px, 10px 10px, 20px 10px;
  background-position: 0px 0px, 50px 0px, 0px 10px, 40px 10px, 10px 20px, 40px 20px, 20px 30px, 10px 40px, 40px 40px, 0px 50px, 40px 50px, 0px 60px, 50px 60px, 0px 70px, 70px 60px, 60px 70px;
}
.y {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 20px 10px, 20px 10px, 30px 10px, 30px 10px, 30px 10px, 30px 10px, 30px 50px, 10px 50px;
  background-position: 0px 0px, 60px 0px, 0px 10px, 50px 10px, 10px 20px, 40px 20px, 20px 30px, 50px 30px;
}
.z {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 80px 10px, 40px 10px, 30px 10px, 40px 10px, 30px 10px, 30px 10px, 20px 10px, 30px 10px, 80px 10px, 80px 10px;
  background-position: 0px 0px, 0px 10px, 40px 10px, 20px 20px, 20px 30px, 10px 40px, 40px 40px, 0px 50px, 0px 60px, 0px 70px;
}
.one {
  background-image: linear-gradient(to top, #00a2e2, #00a2e2), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 10px, 10px 20px, 30px 80px, 10px 60px, 10px 20px, 10px 20px;
  background-position: 10px 10px, 10px 60px, 20px 0px, 50px 0px, 50px 60px, 60px 60px;
}
.two {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to right, #00a323 50%, #3d060a 50%), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 60px 10px, 30px 30px, 10px 30px, 10px 10px, 30px 20px, 30px 10px, 40px 10px, 40px 10px, 80px 10px, 80px 10px;
  background-position: 10px 0px, 0px 10px, 30px 10px, 40px 10px, 50px 10px, 40px 30px, 20px 40px, 10px 50px, 0px 60px, 0px 70px;
}
.three {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to right, #3d060a 10px, #09c5d8 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 60px 10px, 30px 30px, 10px 30px, 10px 10px, 30px 20px, 30px 10px, 30px 10px, 10px 10px, 40px 10px, 30px 10px, 60px 20px, 80px 10px;
  background-position: 10px 0px, 0px 10px, 30px 10px, 40px 10px, 50px 10px, 40px 30px, 40px 40px, 70px 40px, 0px 50px, 50px 50px, 10px 60px, 0px 60px;
}
.four {
  background-image: linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #00a2e2, #00a2e2), linear-gradient(to top, #09c5d8, #09c5d8), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 30px, 10px 30px, 10px 10px, 20px 10px, 20px 80px, 80px 10px, 80px 10px, 10px 80px;
  background-position: 30px 10px, 20px 20px, 10px 30px, 0px 40px, 40px 0px, 0px 50px, 0px 60px, 60px 0px;
}
.five {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #09c5d8, #09c5d8), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 80px 10px, 40px 20px, 80px 10px, 70px 10px, 20px 10px, 80px 10px, 30px 10px, 70px 10px, 60px 10px;
  background-position: 0px 0px, 0px 10px, 0px 10px, 0px 30px, 50px 40px, 0px 40px, 50px 50px, 0px 60px, 0px 70px;
}
.six {
  background-image: linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 20px, #09c5d8 20px, #09c5d8 30px, #00a2e2 30px), linear-gradient(to top, #3d060a 10px, #00a323 10px, #00a323 30px, #09c5d8 30px, #09c5d8 40px, #00a2e2 40px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 10px 60px, 20px 80px, 40px 10px, 10px 10px, 30px 10px, 30px 10px, 40px 10px, 10px 10px, 30px 10px, 30px 10px, 40px 10px, 10px 80px, 30px 10px;
  background-position: 0px 10px, 10px 0px, 30px 0px, 40px 10px, 50px 10px, 50px 20px, 30px 30px, 40px 40px, 50px 40px, 50px 50px, 30px 60px, 30px 0px, 40px 70px;
}
.seven {
  background-image: linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 20px 20px, 40px 30px, 30px 30px, 30px 10px, 30px 10px, 30px 20px, 30px 10px;
  background-position: 30px 0px, 0px 0px, 50px 0px, 40px 30px, 30px 40px, 20px 50px, 20px 70px;
}
.eight {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #09c5d8 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 60px 10px, 40px 20px, 10px 10px, 30px 20px, 60px 10px, 40px 10px, 10px 10px, 30px 10px, 40px 10px, 30px 10px, 50px 20px, 70px 10px;
  background-position: 10px 0px, 0px 10px, 40px 10px, 50px 10px, 10px 30px, 0px 40px, 40px 40px, 50px 40px, 0px 50px, 50px 50px, 10px 60px, 0px 60px;
}
.nine {
  background-image: linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to right, #3d060a 10px, #00a2e2 10px), linear-gradient(to top, #3d060a, #3d060a), linear-gradient(to left, #3d060a 10px, #00a2e2 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to left, #3d060a 10px, #00a323 10px), linear-gradient(to top, #3d060a, #3d060a);
  background-size: 60px 10px, 40px 20px, 10px 10px, 30px 30px, 50px 10px, 40px 10px, 30px 10px, 30px 10px, 60px 10px, 50px 10px;
  background-position: 10px 0px, 0px 10px, 40px 10px, 50px 10px, 0px 30px, 10px 40px, 50px 40px, 50px 50px, 10px 60px, 10px 70px;
}

</style>
</head>
<body>
<div class="container snow-bros">
<ol>
	${STR}
</ol>
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

# Slide

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/slide.png" /> 
</p>

## Options

```sh
Usage: teffects slide [options] [arguments]

Creates split texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #ffed94
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: /Users/shinichiokada/Bash_Projects/Teffects/teffects/outputs
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px Unit: vw
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help  

```

## Examples

```sh
$ teffects slide
$ teffects slide -t "Lorem ipsum dolor sit amet" -s 8 -e 600 -b "#eee" 
```

## Credit

Slide is inspired by [Animating striped text with background clip and gradients by Mandy Michael](https://codepen.io/mandymichael/pen/PaBraK).
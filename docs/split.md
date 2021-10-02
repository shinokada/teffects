# Split

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/split.png" /> 
</p>

## Options

```sh
Usage: teffects split [options] [arguments]

Creates split texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #000
  -o, --bocolor BOCOLOR       Body color
  -c, --color COLOR           Font color. Enclose with quotes. Default: #fff
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: /Users/shinichiokada/Bash_Projects/Teffects/teffects/outputs
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help
```

## Examples

```sh
$ teffects split -t AWESOME -w 800 -e 200 -d ~/Downloads
$ teffects split -t "AWESOME" -c "#4465aa" -b "#f4e990" -w 900 -e 500 -d ~/Downloads
```

## Credit

Split is inspired by [Håvard Brynjulfsen's Split text with clip-path](https://codepen.io/havardob/pen/PoPaWaE).
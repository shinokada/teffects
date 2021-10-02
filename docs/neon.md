# Neon

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/neon.png" />
</p>

## Options

```sh
Usage: teffects neon [options] [arguments]

Creates neon texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -a, --align ALIGN           Text alignment. Default: center.
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #192824
  -t, --text TEXT             Your text to print.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: /Users/shinichiokada/Bash_Projects/Teffects/teffects/outputs
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -e, --height HEIGHT         Image height. Default: 1200px.
  -h, --help 
```

## Examples

```sh
$ teffects neon -t "Teffects NEON LIGHTS" -b purple -s 80 -e 800 -w 1020
```

## Credit

[Neon light text by Sarah Fossheim](https://codepen.io/fossheim/pen/PoqKoLY)

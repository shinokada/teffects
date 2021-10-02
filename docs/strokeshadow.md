# Strokeshadow

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/strokeshadow.png" />
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/strokeshadow2.png" /> 
</p>

## Options

```sh
Usage: teffects strokeshadow [options] [arguments]

Creates stroke-shadow texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
      --behind                Set the color behind the text.
  -a, --align ALIGN           Text alignment. Default: center.
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #fef3c7
  -c, --color SCOLOR          Shadow color
  -t, --text TEXT             Your text to print.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs directory.
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -e, --height HEIGHT         Image height. Default: 1200px.
  -h, --help
```

## Examples

```sh
$ teffects strokeshadow -c purple -t "Article heading" -s 170 --behind -e 400 -w 1400 -d ~/Downloads

$ teffects strokeshadow -c purple -t "Article heading" -s 170 -e 400 -w 1400 -d ~/Downloads
```

## Credit

Sticker is inspired by [Stephanie Eckles's CSS Sticker](https://codepen.io/5t3ph/pen/mdVZYpr).
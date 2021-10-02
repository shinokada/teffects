# SVG

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/svg.png" />
</p>

## Options


```sh
Usage: teffects svg [options] [arguments]

Creates svg styling texts. Limited to max 3-4 words. Width and height is fixed to 1200x400.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #ebe7e0
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: /Users/shinichiokada/Bash_Projects/Teffects/teffects/outputs
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -t, --text TEXT             Your text to print. Default: Teffects SVG
  -h, --help                
```

## Examples

```sh
$ teffects svg -t "Awesome"
```

## Credit

[Styling Text with SVG (Second Shadow) by Code School](https://codepen.io/team/codeschool/pen/BKrRwg/)
# Clip

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/clip.png" /> 
</p>

## Options

```sh
Usage: teffects clip [options...] [arguments...]

Creates cliped texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b,     --bold WEIGHT       Font weight. Choose from 500|700|900.
  -f,     --font FONT_NAME    Font name. Default: Luckiest Guy.
  -e,     --height HEIGHT     Image height. Default: 1200px.
  -d,     --dir OUTPUT_DIR    Output directory. Use an absolute path without a trailing slash. Default: /Users/shinichiokada/Bash_Projects/Teffects/teffects/outputs
  -i,     --image BKIMG       Background image. Use an absolute path.  Default flower.jpg
  -s,     --size SIZE         Font-size. Use a number without px. Default: 120px
  -t,     --text TEXT         Your text to print.
  -w,     --width WIDTH       Image width. Use a number without px. Default: 1600px.
  -h,     --help  
```

## Examples

```sh
$ teffects clip -t "Bash script to clip an image to text" -w 1400 -e 900 -d ~/Downloads
```

## Credit

Clip is inspired by [this video](https://www.youtube.com/watch?v=9Kr3T4Ndl-o).
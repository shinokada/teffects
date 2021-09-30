# Clip

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/clip.png" /> 
</p>

## Options

```sh
Usage: teffects clip [options...] [arguments...]

Clip an image to texts.

  OPTIONS                     DESCRIPTION
  -t,     --text TEXT         -t 'Your text to print'
  -f,     --font FONT_NAME    -f 'Font Name'
  -s,     --size SIZE         -s 120 will set CSS font-size: 120px
  -i,     --image BKIMG       -i /Absolute/path/to/image.jpg
  -d,     --dir OUTPUT_DIR    -d /Path/to/dir without the trailing slash.
  -w,     --width WIDTH       -w 1240. The default width is 1600px.
  -e,     --height HEIGHT     -h 800. The default height is 1200px.
  -b,     --bold WEIGHT       -b 900. This sets the font weight. Choose from 500|700|900.
  -h,     --help
```

## Examples

```sh
$ teffects clip -H "Bash script to clip an image to text" -w 1400 -e 900 -d ~/Downloads
```

## Credit

Clip is inspired by [this video](https://www.youtube.com/watch?v=9Kr3T4Ndl-o).
# Sticker

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/sticker.png" /> 
</p>

## Options

```sh
Usage: teffects sticker [options] [arguments]

Creates sticker texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #eee
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs directory.
  -l, --lsize LSIZE           -l 180 will set CSS top font-size: 180px
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -u, --subtext SUB_TEXT      Subtext. Your text to print.
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help 
```

## Examples

```sh
$ teffects sticker -t Teffects -S Rocks -d ~/Downloads
```

## Credit

Sticker is inspired by [Stephanie Eckles's CSS Sticker](https://codepen.io/5t3ph/pen/mdVZYpr).
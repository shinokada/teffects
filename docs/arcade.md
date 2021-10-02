# Arcade

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/arcade.png" /> 
</p>

## Options

```sh
Usage: teffects arcade [options] [arguments]

Creates arcade texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -a, --align ALIGN           Text alignment. Default: center.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs directory.
  -e, --height HEIGHT         Image height. Default: 1200px.
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help  
```

## Examples

```sh
$ teffects arcade -t "arcade texts" -w 800 -e 300 -d ~/Downloads
```

## Credit

Arcade is inspired by [Lynn Fisher's CSS Arcade Typography: Snow Bros. 1990](https://codepen.io/lynnandtonic/pen/rNVNpmN).
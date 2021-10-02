# Layer

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/layer.png" /> 
</p>

## Options

```sh
Usage: teffects layer [options] [arguments]

Creates layered texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #d52e3f
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs directory.
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help 
```

## Examples

```sh
$ teffects layer -t Teffects -w 1040 -e 400
```


## Credit

[Layered text-shadow effect CSS by Shireen Taj](https://codepen.io/TajShireen/pen/abzmoRE)

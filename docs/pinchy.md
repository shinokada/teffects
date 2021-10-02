# Pinchy

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/pinchy.png" />
</p>

## Options

```sh
Usage: teffects pinchy [options] [arguments]

Creates pinchy texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -a, --align ALIGN           Text alignment. Default: center.
  -t, --text TEXT             Your text to print.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs directory.
  -s, --size SIZE             Font-size. Use a number without px. Default: 120px Default: 150
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -e, --height HEIGHT         Image height. Default: 1200px.
  -h, --help 
```

## Examples

```sh
$ teffects pinchy -w 1200 -e 400
```

## Credit

Inspired by [Pinchy Type with CSS text-shadow by Bennett Feely](https://codepen.io/bennettfeely/pen/EjBqoL)

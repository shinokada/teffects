# Covfete

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/covfete.png" />
</p>

## Options

```sh
Usage: teffects covfete [options] [arguments]

Covfete texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -b, --bcolor BCOLOR         Background color. Enclose with quotes. Default: #ab3428
  -c, --color COLOR           Font color. Enclose with quotes. Default: #f49e4c
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs dir.
  -s, --size SIZE             Font-size. Use a number without a unit. Default: 15vw.
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help  
```

## Examples

```sh
$ teffects covfete -t "Medium Article Title" -w 1450
```

## Credit

Covfete is inspired by [Background clipping covfefe by Stephanie](https://codepen.io/ramenhog/pen/VboyrL).
# Retro

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/retro.png" /> 
</p>

## Options

```sh
Usage: teffects retro [options] [arguments]

Creates retro texts.
All parameters accepts --param value and --param=value form.

  OPTIONS                     DESCRIPTION
  -e, --height HEIGHT         Image height. Default: 1200px.
  -d, --dir OUTPUT_DIR        Output directory. Use an absolute path without a trailing slash. Default: teffects/outputs directory.
  -s, --subtext SUB_TEXT      Subtext. Your text to print.
  -t, --text TEXT             Your text to print.
  -w, --width WIDTH           Image width. Use a number without px. Default: 1600px.
  -h, --help 
```

## Examples

```sh
$ teffects retro -t Super -s Duper -d ~/Downloads
```

## Credit

Retro is inspired by [Yoav Kadosh's Retro Text Effect Pure CSS](https://codepen.io/ykadosh/pen/zYNxVKr).
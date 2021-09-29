# Split

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/split.png" /> 
</p>

```sh
Usage: teffects split [options] [arguments]
Options:
  -H, --header HEADER         accepts --header word / --header=word
  -c, --color COLOR           Color
  -b, --bcolor BCOLOR         Background Color
  -d, --dir OUTPUT_DIR        -d /Path/to/dir without the trailing slash.
  -w, --width WIDTH           -w 1240. The default width is 1600px.
  -e, --height HEIGHT         -h 800. The default height is 1200px.
  -h, --help   
```

## Examples

```sh
$ teffects split -H AWESOME -w 800 -e 200
$ teffects split -H "AWESOME" -c "#4465aa" -b "#f4e990" -w 900 -e 500 
```
# Text Effects, TEFFECTS

## Overview

Teffects automates creating header images.

## Requirement

To run the clip command you need [wkhtmlpdf/wkhtmltoimage](https://wkhtmltopdf.org/downloads.html).

## Installation

Using [Awesome package manager](https://github.com/shinokada/awesome):

```sh
awesome install shinokada/teffects
```

Or download the repo and move to a bin directory.

## Usage

You can find all options using `-h` or `--help` for each command.

```sh
$ teffects 3d -h
$ teffects arcade -h
$ teffects clip -h
$ teffects retro -h
$ teffects split -h
$ teffects sticker -h
```

Examples:

```sh
$ teffects 3d -d ~/Downloads
$ teffects arcade -d ~/Downloads
$ teffects clip -d ~/Downloads
$ teffects retro -d ~/Downloads
$ teffects split -d ~/Downloads
$ teffects sticker -d ~/Downloads
```

## More details

- [3d](https://github.com/shinokada/teffects/blob/master/docs/3d.md)
- [arcade](https://github.com/shinokada/teffects/blob/master/docs/arcade.md)
- [clip](https://github.com/shinokada/teffects/blob/master/docs/clip.md)
- [retro](https://github.com/shinokada/teffects/blob/master/docs/retro.md)
- [split](https://github.com/shinokada/teffects/blob/master/docs/split.md)
- [sticker](https://github.com/shinokada/teffects/blob/master/docs/sticker.md)

## Reference

[Bash Script to Clip an Image to Text](https://medium.com/mkdir-awesome/bash-script-to-clip-an-image-to-text-8adab80a7dfa)

## Author

Shinichi Okada

## License

Please see license.txt.

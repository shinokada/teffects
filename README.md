# Text Effects, TEFFECTS

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/teffects.png" />

## Overview

Teffects automates creating header images for your articles, email, presentation and other purposes.

## Requirement

To run the clip command you need [wkhtmlpdf/wkhtmltoimage](https://wkhtmltopdf.org/downloads.html).

Tested on macOS and Ubuntu.

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

1. [3d](https://github.com/shinokada/teffects/blob/master/docs/3d.md)
2. [arcade](https://github.com/shinokada/teffects/blob/master/docs/arcade.md)
3. [blog](https://github.com/shinokada/teffects/blob/master/docs/blob.md)
4. [clip](https://github.com/shinokada/teffects/blob/master/docs/clip.md)
5. [covfete](https://github.com/shinokada/teffects/blob/master/docs/covfete.md)
6. [layer](https://github.com/shinokada/teffects/blob/master/docs/layer.md)
7. [neon](https://github.com/shinokada/teffects/blob/master/docs/neon.md)
8. [pinchy](https://github.com/shinokada/teffects/blob/master/docs/pinchy.md)
9. [popart](https://github.com/shinokada/teffects/blob/master/docs/popart.md)
10. [retro](https://github.com/shinokada/teffects/blob/master/docs/retro.md)
11. [shade](https://github.com/shinokada/teffects/blob/master/docs/shade.md)
12. [slide](https://github.com/shinokada/teffects/blob/master/docs/slide.md)
13. [split](https://github.com/shinokada/teffects/blob/master/docs/split.md)
14. [sticker](https://github.com/shinokada/teffects/blob/master/docs/sticker.md)
15. [strokeshadow](https://github.com/shinokada/teffects/blob/master/docs/strokeshadow.md)
16. [svg](https://github.com/shinokada/teffects/blob/master/docs/svg.md)

## Reference

[Bash Script to Clip an Image to Text](https://medium.com/mkdir-awesome/bash-script-to-clip-an-image-to-text-8adab80a7dfa)

## Author

Shinichi Okada

## License

Please see license.txt.

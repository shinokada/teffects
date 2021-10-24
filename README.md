# Text Effects, TEFFECTS

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/teffects.png" />

## Overview

Teffects automates creating header images for your articles, email, presentation and other purposes. Tested on macOS and Ubuntu.

## Requirement

- Firefox: Teffects uses Firefox to take a screenshot.
- To run the clip command you need [wkhtmlpdf/wkhtmltoimage](https://wkhtmltopdf.org/downloads.html).

## Installation

### Homebrew

```sh
$ brew tap shinokada/teffects
$ brew install teffects
```

### Awesome package manager

Using [Awesome package manager](https://github.com/shinokada/awesome):

```sh
awesome install shinokada/teffects
```

### Apt

Download the latest debian package from [releases](https://github.com/shinokada/teffects/releases)

```sh
$ sudo apt install /path/to/teffects_XXXXX-X_all.deb
```

### Others

Or download the repo and move to a bin directory.

## Usage

You can find all options using `-h` or `--help` for each command.

```sh
$ teffects 3d -h
$ teffects arcade -h
$ teffects clip -h
```

Examples:

```sh
$ teffects 3d -t "Your Heading"-d ~/Downloads
$ teffects arcade -t "Awesome Heading" -d ~/Downloads
$ teffects clip -d -t "Amazing Heading" ~/Downloads
```

## More details

- [3d](https://github.com/shinokada/teffects/blob/master/docs/3d.md)
- [arcade](https://github.com/shinokada/teffects/blob/master/docs/arcade.md)
- [blob](https://github.com/shinokada/teffects/blob/master/docs/blob.md)
- [bubble](https://github.com/shinokada/teffects/blob/master/docs/bubble.md)
- [circulate](https://github.com/shinokada/teffects/blob/master/docs/circulate.md)
- [clip-animate](https://github.com/shinokada/teffects/blob/master/docs/clip-animate.md)
- [clip](https://github.com/shinokada/teffects/blob/master/docs/clip.md)
- [covfete](https://github.com/shinokada/teffects/blob/master/docs/covfete.md)
- [glow](https://github.com/shinokada/teffects/blob/master/docs/glow.md)
- [jump](https://github.com/shinokada/teffects/blob/master/docs/jump.md)
- [layer](https://github.com/shinokada/teffects/blob/master/docs/layer.md)
- [neon](https://github.com/shinokada/teffects/blob/master/docs/neon.md)
- [pinchy](https://github.com/shinokada/teffects/blob/master/docs/pinchy.md)
- [popart](https://github.com/shinokada/teffects/blob/master/docs/popart.md)
- [retro](https://github.com/shinokada/teffects/blob/master/docs/retro.md)
- [reveal](https://github.com/shinokada/teffects/blob/master/docs/reveal.md)
- [rotate](https://github.com/shinokada/teffects/blob/master/docs/rotate.md)
- [shade](https://github.com/shinokada/teffects/blob/master/docs/shade.md)
- [shadow](https://github.com/shinokada/teffects/blob/master/docs/shadow.md)
- [silentfilm](https://github.com/shinokada/teffects/blob/master/docs/silentfilm.md)
- [smoky](https://github.com/shinokada/teffects/blob/master/docs/smoky.md)
- [split](https://github.com/shinokada/teffects/blob/master/docs/split.md)
- [squiggle](https://github.com/shinokada/teffects/blob/master/docs/squiggle.md)
- [sticker](https://github.com/shinokada/teffects/blob/master/docs/sticker.md)
- [stripe](https://github.com/shinokada/teffects/blob/master/docs/stripe.md)
- [strokeshadow](https://github.com/shinokada/teffects/blob/master/docs/strokeshadow.md)

## Reference

[Bash Script to Clip an Image to Text](https://medium.com/mkdir-awesome/bash-script-to-clip-an-image-to-text-8adab80a7dfa)

## Author

Shinichi Okada

## License

Please see license.txt.

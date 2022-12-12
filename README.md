<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/teffects.png" />
</p>
<p align="center">
<a href="https://shinokada.github.io/teffects/">https://shinokada.github.io/teffects/</a>
</p>

# Text Effects - TEFFECTS

## Overview

Teffects automates creating header images for your articles, email, presentation and other purposes. Tested on macOS and Ubuntu.

## Requirement

- Bash version 5 or higher.

If you are using macOS:

```sh
brew install bash
```

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

## 3d

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/3d.png" />
</p>

### Options

Find all the options using `teffects 3d -h`.

### Examples

```sh
$ teffects 3d -d ~/Downloads
```

### Credit

3d is inspired by [Håvard Brynjulfsen's 3D letters - sugar sweet](https://codepen.io/havardob/pen/WNQwvze).

## Animate


<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/animate.gif" />
</p>

### Options

Find all the options using `teffects animate -h`.

### Examples

```
$ teffects animate -t "Teffects rocks"　-s 4
```

### Credit

Animate is inspired by [Florin Pop's Letter Animation](https://codepen.io/FlorinPop17/pen/WEBNyx).


## Arcade

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/arcade.png" /> 
</p>

### Options

Find all the options using `teffects arcade -h`.

### Examples

```sh
$ teffects arcade -t "arcade texts" -w 800 -e 300 -d ~/Downloads
```

### Credit

Arcade is inspired by [Lynn Fisher's CSS Arcade Typography: Snow Bros. 1990](https://codepen.io/lynnandtonic/pen/rNVNpmN).

### Notes

- Use `-w 2000` for a multi-line heading.
- Not able to change a font size.

## Blob

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/blob.gif" />
</p>

### Options

Find all the options using `teffects blob -h`.

### Examples

```
$ teffects blob -t "Create Your Programming Article Heading Image with Teffects" -w 1200 -e 900 -s 8
```

### Credit

Blob is inspired by [Amli's Animated Blobs Text - Multiple Colors](https://codepen.io/uzcho_/pen/LaPqWJ)


## Bubble

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/bubble.gif" />
</p>

This is a bubble animation effect and it will open a browser.

### Options

Find all the options using `teffects bubble -h`.

### Examples

```sh
$ teffects bubble -t "long lorem ipsum and more" +i -c "#ff2d2d" -b "#008ac1"
```

### Credit

Bubble is inspired by [html5andblog's Bubbling Text Effect](https://codepen.io/html5andblog/pen/ZWmYMy)

## Circulate

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/circulate.gif" />
</p>

Circulating in texts for one line. If your line is long you need to adjust with font size `-s` and screen width `-w` options.

### Options

Find all the options using `teffects circulate -h`.

### Examples

Change circulating colors using the `--colors` option. Use max of 6 hexdecimal colors without `#` symbol:

```
$ teffects circulate2 -t Teffects --colors "eee ed4bc7 4d76ed ccc"
```

### Credit

Circulate is inspired by [Cesar C.'s Animated text fill with svg text practice](https://codepen.io/cesar2535/pen/ByYXpN).

## Clip-animate

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/clip-animate.gif" />
</p>

This is a CSS clip animation effect and it will open a browser.

### Options

Find all the options using `teffects clip-animate -h`.

### Examples

```sh
$ teffects clip-animate -t "TEFFECTS CLIP ANIMATE" -v "NEW CSS ANIMATION" -u "FOR YOUR ARTICLE"
```

### Credit

Clip-animate is inspired by [Daniel Riemer's Animated text fill](https://codepen.io/zitrusfrisch/pen/fjbal)


## Clip

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/clip.png" /> 
</p>

### Options

Find all the options using `teffects click -h`.

### Examples

```sh
$ teffects clip -t "Bash script to clip an image to text" -w 1400 -e 900 -d ~/Downloads
```

### Credit

Clip is inspired by [this video](https://www.youtube.com/watch?v=9Kr3T4Ndl-o).

### Notes

Clip uses wkhtmltoimage and can't handle advanced CSS.

- font size should be px.
- Not able to use flex.

## Covfete

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/covfete.png" />
</p>

### Options

Find all the options using `teffects covfete -h`.

### Examples

```sh
$ teffects covfete -t "Medium Article Title" -w 1450
```

### Credit

Covfete is inspired by [Background clipping covfefe by Stephanie](https://codepen.io/ramenhog/pen/VboyrL).

## Dashed-shadow

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/dashed-shadow.png" />
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/dashed-shadow.gif" />
</p>

### Options

Find all the options using `teffects dashed-shadow -h`.

### Examples

```sh
$ teffects dashed-shadow -t "Awesome"
```

### Credit

Dashed-shadow is inspired by [Lucas Bebber's CSS Dashed Shadow](https://codepen.io/lbebber/pen/BzoHi).

## Glow

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/glow.gif" />
</p>

This is a CSS animation effect and it will open a browser.

### Options

Find all the options using `teffects glow -h`.

### Examples

```sh
$ teffects glow -t "Teffects Glow Effects" -l "2px" -p 150px -g "#ff3299"
```

### Credit

Glow is inspired by [kiran raj r's Css Text Effect--Glow Effect3](https://codepen.io/kiran-r-raj/pen/OJmQQwO)


## Jump

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/jump.gif" />
</p>

This is a CSS animation effect and it will open a browser.

### Options

Find all the options using `teffects jump -h`.

### Examples

```sh
$ teffects jump
$ teffects jump -t "LOREM IPSUM" -c "#eee" -b "#EF6667" -s 4
```

### Credit

Jump is inspired by [kiran raj r's Css Text Effect--fade Effect](https://codepen.io/kiran-r-raj/pen/QWvaPwE)


## Layer

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/layer.png" /> 
</p>

### Options

Find all the options using `teffects layer -h`.

### Examples

```sh
$ teffects layer -t Teffects -w 1040 -e 400
```

### Credit

[Layered text-shadow effect CSS by Shireen Taj](https://codepen.io/TajShireen/pen/abzmoRE)

## Neon

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/neon.png" />
</p>

### Options

Find all the options using `teffects neon -h`.

### Examples

```sh
$ teffects neon -t "Teffects NEON LIGHTS" -b purple -s 80 -e 800 -w 1020
```

### Credit

[Neon light text by Sarah Fossheim](https://codepen.io/fossheim/pen/PoqKoLY)


## New-neon

<p align="center">
<img width="300" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/new-neon.png"/>
<img width="300" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/new-neon-7.png"/>
<img width="300" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/new-neon-8.png"/>
<img width="300" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/new-neon-9.png"/>
<img width="300" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/new-neon.gif"/>
</p>

### Options

Choose different neon styles by using the `-n` option with any number from 1 to 9.

Find all the options using `teffects new-neon -h`.

### Examples

```sh
$ teffects new-neon -t "Teffects NEON LIGHTS" -n 5
```

### Credit

[Erik Jung's Neon text-shadow effect](https://codepen.io/erikjung/pen/XdWEKE)


## Pinchy

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/pinchy.png" />
</p>

### Options

Find all the options using `teffects pinchy -h`.

### Examples

```sh
$ teffects pinchy -w 1200 -e 400
```

### Credit

Inspired by [Pinchy Type with CSS text-shadow by Bennett Feely](https://codepen.io/bennettfeely/pen/EjBqoL)

## Popart

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/popart.png" /> 
</p>

### Options

Find all the options using `teffects popart -h`.

### Examples

```sh
$ teffects popart -t "Bold, bright and brash" -e 600
$ teffects popart -t "Bold, bright" -e 600 -b purple -s 200 -a left
```

### Credit

[Typo triple by creatz](https://codepen.io/creatz/pen/pooBeev)

## Retro

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/retro.png" /> 
</p>

### Options

Find all the options using `teffects retro -h`.

### Examples

```sh
$ teffects retro -t Super -s Duper -d ~/Downloads
```

### Credit

Retro is inspired by [Yoav Kadosh's Retro Text Effect Pure CSS](https://codepen.io/ykadosh/pen/zYNxVKr).

## Reveal

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/reveal.gif" /> 
</p>

### Options

Find all the options using `teffects reveal -h`.

### Examples

```sh
$ teffects reveal -u "More text here" -d "And more and more" -s 8 -b "#333" -f "#123" -g "#ff3344" -c "#fff"
```

### Credit

Reveal is inspired by [Artur Sedlukh's GSAP text reveal animation](https://codepen.io/sedlukha/pen/eRoYMZ).

## Rotate

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/rotate.gif" /> 
</p>

This is a CSS animation effect and it will open a browser.

### Options

Find all the options using `teffects rotate -h`.

### Examples

```sh
$ teffects rotate -t "Create header image" -s 4 "for Medium article" "for Blog" "for Email" "for Presentation" "for socila media" "from terminal"
```

### Credit

Rotate is inspired by [Rachel Smith's Rotating text](https://codepen.io/rachsmith/full/BNKJme).


## Shade

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shade.gif" />
</p>

This is a CSS animation effect and it will open a browser.

### Options

Find all the options using `teffects shade -h`.

### Examples

```sh
$ teffects shade -t "Teffects Shade" -s 20 -e 600 
```

### Credit

Shade is inspired by [Shaded Text by Rafael González](https://codepen.io/rgg/pen/ozLzbz/).

## Shadow

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shadow.png" />
</p>

### Options

Find all the options using `teffects shadow -h`.

### Examples

```sh
$ teffects shadow -t "Awesome"
```

### Credit

Shadow is inspired by [Styling Text with SVG (Second Shadow) by Code School](https://codepen.io/team/codeschool/pen/BKrRwg/).

## Shadow2

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shadow-default.png"/>
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shadow-deep.png"/>
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shadow-inset.png"/>
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shadow-retro.png"/>
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/shadow-long.png"/>
</p>

### Options

Use the `-y` parameter with `elegant | deep | inset | retro | long`

Find all the options using `teffects shadow2 -h`.

### Examples

```sh
$ teffects shadow2 -t "Awesome" -y deep
```

### Credit

Shadow2 is inspired by [Jorge Epuñan's CSS3 text-shadow effects](https://codepen.io/juanbrujo/pen/yGpAK) and [roikles's Long Shadow Gradient Mixin](https://codepen.io/roikles/pen/xbydH).

## Silent film

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/silentfilm.gif" /> 
</p>

### Options

Find all the options using `teffects silentfilm -h`.

### Examples

```sh
$ teffects silentfilm
```

### Credit

Silentfilm is inspired by [Dimitra Vasilopoulou's Silent Movie Text Effect](https://codepen.io/mimikos/pen/QMjjzy).

## Smoky

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/smoky.gif" />
</p>

### Options

Find all the options using `teffects smoky -h`.

### Examples

```
$ teffects smoky -t "Teffects rocks"　-s 4
```

### Credit

Smoky is inspired by [Bennett Feely's Smoky Text](https://codepen.io/bennettfeely/pen/lgybC).


## Split

This is a CSS animation effect and it will open a browser.

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/split.png" />
</p>

### Options

Find all the options using `teffects split -h`.

### Examples

```sh
$ teffects split -t AWESOME -w 800 -e 200 -d ~/Downloads
$ teffects split -t "AWESOME" -c "#4465aa" -b "#f4e990" -w 900 -e 500 -d ~/Downloads
```

### Credit

Split is inspired by [Håvard Brynjulfsen's Split text with clip-path](https://codepen.io/havardob/pen/PoPaWaE).

## Squiggle

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/squiggle.gif" />
</p>

### Options

Find all the options using `teffects squiggle -h`.

### Examples

You can add HTML text as the following example:

```
$ teffects squiggle -t 'Squiggly Text
  <p class="small">– with – <p/>
  SVG Filters 
  <p class="small">(you can even edit this text)</p>
  <p class="smaller">(Here more text)</p>'
```

### Credit

Squiggle is inspired by [Squiggly Text by Lucas Bebber](https://codepen.io/lbebber/pen/KwGEQv).

## Sticker

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/sticker.png" /> 
</p>

### Options

Find all the options using `teffects sticker -h`.

### Examples

```sh
$ teffects sticker -t Teffects -S Rocks -d ~/Downloads
```

### Credit

Sticker is inspired by [Stephanie Eckles's CSS Sticker](https://codepen.io/5t3ph/pen/mdVZYpr).

## Stripe

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/stripe.gif" /> 
</p>

### Options

Find all the options using `teffects stripe -h`.

### Examples

```sh
$ teffects stripe
$ teffects stripe -t "Lorem ipsum dolor sit amet" -s 8 -e 600 -b "#eee" 
```

### Credit

Stripe is inspired by [Animating striped text with background clip and gradients by Mandy Michael](https://codepen.io/mandymichael/pen/PaBraK).

## Strokeshadow

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/strokeshadow.png" />
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/strokeshadow2.png" /> 
</p>

### Options

Find all the options using `teffects strokeshadow -h`.

### Examples

```sh
$ teffects strokeshadow -c purple -t "Article heading" -s 170 --behind -e 400 -w 1400 -d ~/Downloads

$ teffects strokeshadow -c purple -t "Article heading" -s 170 -e 400 -w 1400 -d ~/Downloads
```

### Credit

Strokeshadow is inspired by [Mark Mead's Strokes, Shadows + Halftone Effects](https://codepen.io/markmead/pen/YjQKeZ).

## Transmission

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/transmission.gif" />
</p>

### Options

Find all the options using `teffects transmission -h`.

### Examples

```sh
$ teffects transmission -t "Awesome" -x "text lines" -s 5 -z 3
$ teffects transmission -t "Header line" -x "First line here
dquote> Second line here
dquote> third line here."
```

### Credit

Transmission is inspired by [Stephen Scaff's Transmission: Glowing Text Animation](https://codepen.io/StephenScaff/pen/oLBqmw).

## Type

<p align="center">
<img width="500" src="https://raw.githubusercontent.com/shinokada/teffects/main/images/type.gif" />
</p>

### Options

Find all the options using `teffects type -h`.

### Examples

```
$ teffects type -t "Teffects rocks"　-s 4
$ teffects type 'Star Wars: ' 'It is a period of civil war.' 'Rebel spaceships,''striking from a hidden base, ' 'have won their first victory...' -s 4
```

### Credit

Type is inspired by [Jack Armley's Text typing thingamy](https://codepen.io/jackarmley/pen/WvGJPB).

## Reference

[Bash Script to Clip an Image to Text](https://medium.com/mkdir-awesome/bash-script-to-clip-an-image-to-text-8adab80a7dfa)

## Author

@shinokada

## License

Please see license.txt.

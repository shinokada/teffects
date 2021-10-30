# shellcheck disable=SC1083
parser_definition() {
    setup REST help:usage abbr:true -- \
        "Usage: ${2##*/} [command] [options...] [arguments...]"
    msg -- '' 'Options:'
    disp :usage -h --help
    disp VERSION --version

    msg -- '' 'Commands: '
    msg -- 'Use command -h for a command help.'
    cmd 3d -- "3D letters style texts."
    cmd animate -- "Animation (balance, shrink, fall, rotate, extend) effects."
    cmd arcade -- "Arcade typography style texts."
    cmd blob -- "Muliple colors blog style texts."
    cmd bubble -- "Bubble effect animation."
    cmd circulate -- "Circulating text animation."
    cmd circulate1 -- "Circulating text animation."
    cmd clip -- "Clip image."
    cmd clip-animate -- "Animated clip texts."
    cmd covfete -- "Background clipping texts."
    cmd dashed-shadow -- "Dashed-shadow animation effects."
    cmd glow -- "Glowing text animation."
    cmd jump -- "Jumping text animation."
    cmd layer -- "Layered text-shadow effect."
    cmd neon -- "Neon light style text animation."
    cmd new-neon -- "Neon light text animation."
    cmd pinchy -- "Pinchy style texts."
    cmd popart -- "Pop art style texts."
    cmd retro -- "Retro style texts."
    cmd reveal -- "Reveal text animation."
    cmd rotate -- "Rotating text animation."
    cmd shade -- "Shaded text animation."
    cmd shadow -- "Styling with shadow lines."
    cmd shadow2 -- "Shadow style effects."
    cmd silentfilm -- "Silent movie text effect animation."
    cmd smoky -- "Smoky text animation."
    cmd squiggle -- "Squiggly text animation."
    cmd split -- "Split style texts."
    cmd sticker -- "Sticker style texts."
    cmd stripe -- "Stripe, clip, and gradient text animation."
    cmd strokeshadow -- "Strokes and shadows effect texts."
    cmd transmission -- "Type-writer effect."
    cmd type -- "Type-writer effect."

    msg -- '' "Examples:
Clip an image 
    $SCRIPT_NAME clip
3D letters
    $SCRIPT_NAME 3d
Animation effects
    $SCRIPT_NAME
Arcade typography
    $SCRIPT_NAME arcade
Blob text with muliple colors
    $SCRIPT_NAME blob
Bubble effect
    $SCRIPT_NAME bubble
Circulating texts
    $SCRIPT_NAME circulate
Dashed-shadow effects
    $SCRIPT_NAME
Glowing texts
    $SCRIPT_NAME glow
Jumping texts
    $SCRIPT_NAME jump
Layered text-shadow effect
    $SCRIPT_NAME layer
Neon light text
    $SCRIPT_NAME neon
New-neon
    $SCRIPT_NAME new-neon
Pop art effect
    $SCRIPT_NAME popart 
Retro banner: 
    $SCRIPT_NAME retro
Styling with shadow lines
    $SCRIPT_NAME shadow
Smoky text animation
    $SCRIPT_NAME smoky
Split text:
    $SCRIPT_NAME split
Squiggly text:
    $SCRIPT_NAME squiggle
Sticker text: 
    $SCRIPT_NAME sticker
Stripe text:
    $SCRIPT_NAME stripe
Strokes and shadows effects
    $SCRIPT_NAME strokeshadow
Silent movie text effect animation
    $SCRIPT_NAME talkie
Type-writer effect
    $SCRIPT_NAME transmission
Type-writer effect 2
    $SCRIPT_NAME

Display the version:
    $SCRIPT_NAME --version
Display help:
    $SCRIPT_NAME -h | --help
"
}

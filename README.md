# nvim-align

## Usage

```vim
" In visual mode
:'<,'>Align regex_pattern
```

*Note:* If used in normal mode, the previous visual selection will be used.

*Note:* See help docs for more information.

## Example

Start text:

```text
var x = 1
var xx = 2
var xxx = 3
var xxxx = 4
var xxxxx = 5
var xxxxxx = 6
```

Command:

```vim
:'<,'>Align =
```

Resulting text:

```text
var x      = 1
var xx     = 2
var xxx    = 3
var xxxx   = 4
var xxxxx  = 5
var xxxxxx = 6
```

You can then operate on the same text again without highlighting it. For example:

```vim
:Align x\ 
```

Resulting in:

```text
var      x      = 1
var x    x     = 2
var xx   x    = 3
var xxx  x   = 4
var xxxx x  = 5
var xxxxxx = 6
```

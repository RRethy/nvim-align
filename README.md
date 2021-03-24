# nvim-align

## Usage

```vim
command! -range=% -nargs=1 Align lua require'align'.align(<f-args>)

" In visual mode
:'<,'>Align regex_pattern.*
```

*Note:* If used in normal mode, the previous visual selection will be used.

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
:'<,'>lua require('align').align('=')
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

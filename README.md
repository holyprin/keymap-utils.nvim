# keymap-utils.nvim

A lightweight Neovim utility for ergonomic keymap definitions.

## Installation

### vim.pack (Neovim 0.12+)

```lua
vim.pack.add('holyprin/keymap-utils.nvim')
```

### lazy.nvim

```lua
{ 'holyprin/keymap-utils.nvim' }
```

### mini.deps

```lua
MiniDeps.add('holyprin/keymap-utils.nvim')
```

## Usage

```lua
local map = require('keymap-utils').map
```

## API

### `map.<modes>(lhs, rhs, [desc], [opts])`

Sets a keymap for one or more modes. The mode is specified by chaining mode characters directly onto `map`.

| Parameter | Type | Description |
|-----------|------|-------------|
| `lhs` | `string` | The key sequence to map |
| `rhs` | `string\|function` | The action to perform |
| `desc` | `string` (optional) | Human-readable description, shown in which-key etc. |
| `opts` | `table` (optional) | Extra options passed to `vim.keymap.set` |

Keymaps are created with `noremap = true` and `silent = true` by default.

### Modes

Any combination of standard Neovim mode characters can be used:

| Character | Mode |
|-----------|------|
| `n` | Normal |
| `i` | Insert |
| `v` | Visual |
| `x` | Visual block |
| `s` | Select |
| `t` | Terminal |
| `o` | Operator-pending |
| `c` | Command |

## Examples

```lua
local map = require('keymap-utils').map

-- Single mode
map.n('<leader>w', ':w<CR>', 'Save file')
map.i('jk', '<Esc>')

-- Multiple modes
map.ni('<C-s>', ':w<CR>', 'Save file')
map.nv('<leader>y', '"+y', 'Yank to clipboard')
map.nix('<C-c>', '<Esc>', 'Escape')

-- With a function
map.n('j', function()
    return vim.v.count == 0 and 'gj' or 'j'
end, 'Move down (wrap-aware)', { expr = true })

-- Extra options
map.n('<leader>p', '"_dP', 'Paste without yanking', { nowait = true })
`````

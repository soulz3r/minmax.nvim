# minmax.nvim

A minimal, terminal-inspired colorscheme family for Neovim. Built around phosphor tones, restrained accents, transparent editor surfaces, and clear syntax hierarchy.

## Variants

| Colorscheme | Character |
| --- | --- |
| `minmax-phosphor` | Phosphor green with restrained amber accents |
| `minmax-mono` | Soft monochrome green |
| `minmax-amber` | Warm amber terminal with subtle green details |
| `minmax-oxide` | Muted oxidized teal with copper accents |

The original `minmax` name remains an alias for `minmax-phosphor`.

## Installation

With lazy.nvim:

```lua
{
  "soulz3r/minmax.nvim",
  lazy = false,
  priority = 1000,
}
```

Choose a variant directly:

```lua
vim.cmd.colorscheme("minmax-phosphor")
-- minmax-mono
-- minmax-amber
-- minmax-oxide
```

No globals, setup calls, or custom commands are required.

## Design

- Four distinct palettes sharing one visual language.
- Transparent backgrounds, including floating windows and completion menus.
- Deliberate syntax hierarchy with selective bold for keywords, functions, types, declarations, and headings.
- Traditional Vim highlight groups and modern Tree-sitter captures.
- Neovim diagnostics, LSP, diff, statusline, and common plugin highlight groups.
- C and C++ syntax support, with emphasis on readable declarations and control flow.
- No external dependencies.

## Terminal ports

The same four palettes are available outside Neovim:

| Variant | WezTerm | Termux | fzf |
| --- | --- | --- | --- |
| Phosphor | `ports/wezterm/minmax-phosphor.toml` | `ports/termux/minmax-phosphor.properties` | `ports/fzf/minmax-phosphor.sh` |
| Mono | `ports/wezterm/minmax-mono.toml` | `ports/termux/minmax-mono.properties` | `ports/fzf/minmax-mono.sh` |
| Amber | `ports/wezterm/minmax-amber.toml` | `ports/termux/minmax-amber.properties` | `ports/fzf/minmax-amber.sh` |
| Oxide | `ports/wezterm/minmax-oxide.toml` | `ports/termux/minmax-oxide.properties` | `ports/fzf/minmax-oxide.sh` |

All ports preserve the Neovim palette's identity without forcing every ANSI role into the dominant green hue. ANSI slots 0-15 follow the conventional terminal order: black, red, green, yellow, blue, magenta, cyan, and white, followed by their bright counterparts. Blue, magenta, and cyan are carefully muted supporting hues, so directory listings, compiler output, shell prompts, and terminal applications remain visually distinguishable. The mono variant keeps these supporting hues especially restrained. WezTerm exposes the ten core Minmax colors at indexes 16-25 and six supporting ANSI hues at indexes 26-31 for `LS_COLORS`: blue, magenta, cyan, and their brighter counterparts. These custom colors replace xterm's first sixteen 256-color cube entries; indexes 32-255 remain untouched.

### WezTerm

Put the chosen TOML file in a directory WezTerm scans for color schemes. On Windows, the most reliable option is to point `color_scheme_dirs` at the checked-out port directory:

```lua
config.color_scheme_dirs = { "D:/path/to/minmax.nvim/ports/wezterm" }
config.color_scheme = "minmax-phosphor"
```

On POSIX systems, WezTerm also searches `~/.config/wezterm/colors`.

The terminal background stays opaque for legible terminal applications. The Neovim colorscheme itself remains transparent.

### Termux

Copy the chosen `.properties` file to `~/.termux/colors.properties`, then reload:

```sh
termux-reload-settings
```

### fzf

Source the matching shell file from your shell startup:

```sh
source /path/to/minmax.nvim/ports/fzf/minmax-phosphor.sh
```

fzf keeps the terminal background transparent and the current selection on a muted surface. Matches and prompts use the variant's warm accent, while headers and metadata use blue, pointers use cyan, and spinners use magenta. This gives each part of the picker a clear role instead of painting the whole interface green.

## License

MIT

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

All ports now use the same semantic mapping from the Neovim palette. The 16 ANSI slots map to background, red, mid, accent, dim, string, muted, and foreground, followed by their bright counterparts. WezTerm deliberately leaves indexed colors 16-255 untouched so applications using the standard 256-color cube keep their expected colors.

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

fzf keeps the terminal background transparent, gives the current selection a muted surface, and uses the variant accent for matches and prompt emphasis.

## License

MIT

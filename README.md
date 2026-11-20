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

### WezTerm

Put the chosen TOML file in a directory WezTerm scans for color schemes. On Windows, the most reliable option is to point `color_scheme_dirs` at the checked-out port directory:

```lua
config.color_scheme_dirs = { "D:/path/to/minmax.nvim/ports/wezterm" }
config.color_scheme = "minmax-phosphor"
```

On POSIX systems, WezTerm also searches `~/.config/wezterm/colors`.

The scheme keeps the terminal background opaque and uses the same foreground, cursor, selection, and ANSI palette as the Neovim variant.

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

The fzf theme leaves the terminal background transparent and styles the prompt, highlights, current item, pointer, marker, border, and supporting UI with the selected Minmax palette.

## License

MIT

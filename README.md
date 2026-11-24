# minmax.nvim

A minimal, terminal-inspired colorscheme family for Neovim. Built around phosphor tones, restrained accents, transparent editor surfaces, and clear syntax hierarchy.

## Variants

| Colorscheme | Character |
| --- | --- |
| `minmax-phosphor` | Phosphor green with restrained amber accents |
| `minmax-mono` | Soft monochrome green |
| `minmax-amber` | Warm amber with green details |
| `minmax-oxide` | Muted oxidized tones with copper accents |

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

| Variant | Kitty | WezTerm | Termux | fzf |
| --- | --- | --- | --- | --- |
| Phosphor | `ports/kitty/minmax-phosphor.conf` | `ports/wezterm/minmax-phosphor.toml` | `ports/termux/minmax-phosphor.properties` | `ports/fzf/minmax-phosphor.sh` |
| Mono | `ports/kitty/minmax-mono.conf` | `ports/wezterm/minmax-mono.toml` | `ports/termux/minmax-mono.properties` | `ports/fzf/minmax-mono.sh` |
| Amber | `ports/kitty/minmax-amber.conf` | `ports/wezterm/minmax-amber.toml` | `ports/termux/minmax-amber.properties` | `ports/fzf/minmax-amber.sh` |
| Oxide | `ports/kitty/minmax-oxide.conf` | `ports/wezterm/minmax-oxide.toml` | `ports/termux/minmax-oxide.properties` | `ports/fzf/minmax-oxide.sh` |

The Neovim colorschemes retain their own four variant identities. The terminal ports intentionally share a separate green-dominant direction: ANSI slots traditionally used for blue, magenta, and cyan are remapped to distinct moss, sage, and mint greens. Directories, prompts, selections, and important UI markers use bold or bright green. Amber remains available for emphasis and warnings; red is reserved for errors and archives. No blue, cyan, or magenta hues are used in these terminal palettes. WezTerm keeps ten additional Minmax colors at indexes 16-25 for optional semantic styling; indexes 26-255 remain untouched. Kitty also exposes these ten semantic colors at indexes 16-25. Bash `LS_COLORS` uses portable ANSI codes, so its file-type colors do not depend on WezTerm-specific indexes.

### Kitty

Choose one of the four files in `ports/kitty`. Add an `include` at the end of your `kitty.conf`, pointing to the chosen file:

```conf
# Use the path where you cloned minmax.nvim.
include /path/to/minmax.nvim/ports/kitty/minmax-phosphor.conf
```

Replace `minmax-phosphor.conf` with `minmax-mono.conf`, `minmax-amber.conf`, or `minmax-oxide.conf` to use another variant. Putting the include after existing color definitions makes the Minmax colors take precedence.

The Kitty files contain color definitions only. They do not change fonts, opacity, window decorations, tab-bar visibility, split borders, shaders, animations, or key mappings. Your Kitty appearance settings remain yours to control. The Kitty theme is independent of the Neovim colorscheme: selecting or including a Kitty palette does not call `vim.cmd.colorscheme()`, change Neovim highlights, or replace your custom Neovim theme.

Validate the configuration with `kitty --debug-config`, then reload Kitty's configuration (or restart Kitty).

### WezTerm

Put the chosen TOML file in a directory WezTerm scans for color schemes. On Windows, the most reliable option is to point `color_scheme_dirs` at the checked-out port directory:

```lua
config.color_scheme_dirs = { "D:/path/to/minmax.nvim/ports/wezterm" }
config.color_scheme = "minmax-phosphor"
```

On POSIX systems, WezTerm also searches `~/.config/wezterm/colors`.

The terminal background stays opaque for legible terminal applications. The Neovim colorscheme itself remains transparent. The terminal port changes do not alter the Neovim highlight palette.

### Termux

Copy the chosen terminal palette to `~/.termux/colors.properties`, then reload:

```sh
cp ports/termux/minmax-phosphor.properties ~/.termux/colors.properties
termux-reload-settings
```

For Termux Launcher, install the separate Phosphor interface palette too:

```sh
cp ports/termux/minmax-phosphor-launcher.properties ~/.termux/launcher-theme.properties
termux-reload-settings
```

The terminal palette controls text and ANSI colours. The launcher palette controls interface surfaces and accents, including the dock, keyboard, app drawer, and command palette. They can be used together; the launcher palette also works with wallpaper colours enabled.

### fzf

Source the matching shell file from your shell startup:

```sh
source /path/to/minmax.nvim/ports/fzf/minmax-phosphor.sh
```

fzf keeps the terminal background transparent and the current selection on a muted surface. Prompts, pointers, markers, and selected text use bold green; the selection surface uses a darker green. Variant-specific amber or copper accents remain available for matches and emphasis. No blue, cyan, or magenta is used.

## License

MIT

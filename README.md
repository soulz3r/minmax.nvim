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

## License

MIT

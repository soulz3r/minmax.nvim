# minmax.nvim

A family of minimal terminal-inspired Neovim colorschemes. Each variant has its own native colorscheme name. No globals, setup options, or custom commands.

## Variants

| Colorscheme | Character |
| --- | --- |
| `minmax-phosphor` | Phosphor green with restrained amber accents |
| `minmax-mono` | Soft monochrome green, with no competing accent color |
| `minmax-amber` | Warm amber terminal with subtle green details |
| `minmax-oxide` | Muted oxidized teal with copper accents |

The original `minmax` name remains as an alias for `minmax-phosphor`.

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
-- or: minmax-mono, minmax-amber, minmax-oxide
```

All variants use a transparent background, so your terminal controls the overall darkness. They include native Neovim and Tree-sitter highlights and have no external dependencies.

## License

MIT

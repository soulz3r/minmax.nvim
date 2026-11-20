# minmax.nvim

A phosphor-green terminal colorscheme for Neovim, with restrained amber accents.

## Palette

- **Phosphor green:** primary text, keywords, and the theme's identity.
- **Bright mint:** functions and focused elements.
- **Forest green:** types, punctuation, comments, and secondary UI.
- **Warm amber:** numbers, constants, operators, search, and selected syntax.
- **Olive green:** strings, keeping code readable without introducing another loud color.
- **Muted red:** errors and destructive diff changes.

The background is transparent, so the terminal controls the overall darkness.

## Installation

With lazy.nvim:

```lua
{
  "soulz3r/minmax.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("minmax")
  end,
}
```

## Design

- CRT-inspired phosphor-green foundation.
- Small amber accent for visual hierarchy.
- Transparent editor and floating windows.
- Native Neovim and Tree-sitter highlight groups.
- No external dependencies.

## License

MIT

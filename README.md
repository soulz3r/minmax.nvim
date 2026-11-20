# minmax.nvim

A minimal phosphor-green terminal colorscheme for Neovim.

## Palette

- **Background:** transparent, allowing the terminal background through.
- **Foreground:** phosphor green.
- **Bright green:** emphasis, functions, and important syntax.
- **Muted green:** comments and secondary UI.
- **Red / yellow:** errors and warnings.

## Installation

With lazy.nvim:

```lua
{
  "soulz3r/minmax.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("minmax")
  end,
}
```

## Features

- Transparent background.
- Green monochrome syntax with restrained diagnostic colors.
- Native Neovim highlight groups.
- No external dependencies.

## License

MIT

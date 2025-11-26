# Lazygit Neovim Plugin

A Neovim plugin that provides cross-platform keybindings to open [lazygit](https://github.com/jesseduffield/lazygit) in your current working directory.

## Features

- **Cross-platform support**: Works on Windows, macOS, and Linux
- **Smart terminal detection**: Automatically finds the best terminal emulator on Linux
- **Fullscreen experience**: Opens lazygit in fullscreen mode for optimal usage
- **Easy configuration**: Simple setup with customizable keymaps

## Requirements

- [lazygit](https://github.com/jesseduffield/lazygit) installed and available in your PATH
- Neovim 0.7 or higher

### Platform-specific Requirements

- **Windows**: Windows Terminal (`wt`)
- **macOS**: Terminal app
- **Linux**: One of the supported terminal emulators:
  - gnome-terminal
  - konsole
  - xfce4-terminal
  - alacritty
  - xterm

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'your-username/your-lazygit-plugin',
  config = function()
    require('your-plugin-name').setup({
      keymap = {
        lazygit = '<leader>gg'  -- or your preferred keybinding
      }
    })
  end
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
  'your-username/your-lazygit-plugin',
  config = function()
    require('your-plugin-name').setup({
      keymap = {
        lazygit = '<leader>gg'
      }
    })
  end
}
```

## Configuration

The plugin requires a keymap configuration to work:

```lua
require('your-plugin-name').setup({
  keymap = {
    lazygit = '<leader>gg'  -- Change this to your preferred keybinding
  }
})
```

## Usage

Once configured, press your defined keybinding in normal mode to open lazygit in the current file's directory. The plugin will:

1. Detect your operating system
2. Find the appropriate terminal emulator
3. Open lazygit in fullscreen mode in the current directory

## Supported Platforms

### Windows
- Uses Windows Terminal (`wt`) with fullscreen mode

### macOS
- Uses the built-in Terminal app

### Linux
Supports multiple terminal emulators (in order of preference):
1. gnome-terminal
2. konsole
3. xfce4-terminal
4. alacritty
5. xterm

The plugin will automatically use the first available terminal from this list.

## Troubleshooting

1. **Keymap not working**: Ensure you've provided a `keymap.lazygit` configuration
2. **lazygit not opening**: Verify that lazygit is installed and available in your PATH
3. **Terminal not found**: On Linux, make sure you have at least one of the supported terminal emulators installed

## License

MIT

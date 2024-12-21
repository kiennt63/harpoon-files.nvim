# harpoon-files.nvim
<img width="1178" alt="image" src="https://github.com/user-attachments/assets/a463caf3-0c49-4776-b4ac-58816ef97c7b" />


**Lualine component to show your harpoon marks list with filenames and indexes.**

## Requirements

- Neovim >= 0.8.0 (not sure tbh)
- [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)

> [!IMPORTANT]  
> Require [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) on `harpoon2` branch
>

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim) (not tested):

```lua
use {
    'kiennt63/harpoon-files.nvim',
    requires = {
        { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
    },
}
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    'kiennt63/harpoon-files.nvim',
    dependencies = {
        { 'ThePrimeagen/harpoon', branch = 'harpoon2' },
    }
}
```

## Usage

Add to your lualine config:

```lua
local harpoon_files = require 'harpoon_files'

require('lualine').setup {
    sections = {
        lualine_c = {
            { harpoon_files.lualine_component },
        },
    },
}
```

## Configuration

Available options with their defaults:
### Using lazy.nvim
```lua
{
    'kiennt63/harpoon-files.nvim',
    dependencies = {
        { 'ThePrimeagen/harpoon' },
    },
    opts = {
        max_length = 15,
        icon = '',
        show_index = true,
        separator_left = ' ',
        separator_right = ' ',
    },
}

```

## License

MIT

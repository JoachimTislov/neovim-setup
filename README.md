# Neovim config/setup

I thrive for a minimal setup and utilizing the inbuilt features over external ones.

## Resources

- [AI plugins](https://gist.github.com/ColinKennedy/8a0eea1b18b6e22bc10daa64cb47ae9d)
- youtube
    - [Vim Tips I Wish I Knew earlier](https://www.youtube.com/watch?v=5BU2gBOe9RU)
    - [Advanced Vim Workflows](https://www.youtube.com/watch?v=futay9NjOac)

## TODOs

- Open oil for telescope or similar in a specific dir
    - Need a input field to determine which dir, or use telescope list or similar
    - ":Oil 'dir'" - open oil in dir
- Add cmd line
- Work on Telescope
    - create a minimal setup, optionally use a different pkg
- Configure minimal diagnostics
    - https://github.com/rachartier/tiny-inline-diagnostic.nvim
- Migrate over to the inbuilt package manager in version 12.0
- Figure out a clean of closing tabs, buffer and exiting vim. (with key binds)
    - buffer, :bd
    - tab, :tabc
    - Exiting vim, :q - but there's also :qa, :qa!. And this should be supported, but can be annoying - maybe
        - <leader>e = quit/exit, <leader>q = open quit alternative menu; <leader>qf == quit force, <leader>qt == close tab, <leader>qb == exit buffer (empty buffer)
        - Writing bd, qa, q, and etc.
- Add a good snippets plugin, maybe [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    - friendly snippets: https://github.com/rafamadriz/friendly-snippets
    - add with https://github.com/hrsh7th/nvim-cmp
- Use overseer to run tasks
- Fix noice overriding messages
    - Pretty the mini plugin handles the messages
- Prevent nvim from adding empty entries to the clipboard

- Consider switching from Qwerty to programmer Dvorak keyboard layout (unlikely)
    - https://wiki.archlinux.org/title/Dvorak
    - https://www.kaufmann.no/roland/dvorak/
    - https://www.kaufmann.no/roland/dvorak/linux.html
    - training: https://learn.dvorak.nl/

## Plugins

### to add

https://github.com/ravitemer/mcphub.nvim
https://github.com/olimorris/codecompanion.nvim
https://github.com/zbirenbaum/copilot.lua
https://github.com/ycm-core/YouCompleteMe
https://github.com/nvimdev/lspsaga.nvim
https://github.com/neoclide/coc.nvim?tab=readme-ov-file
    - To host VS Code extensions

### Commented out (to be removed or reconfigured)

- guess indent (in lazy file)
- dashboard
- avante

### misc

- https://github.com/MunifTanjim/nui.nvim
- https://github.com/lukas-reineke/indent-blankline.nvim?tab=readme-ov-file
- https://github.com/artemave/workspace-diagnostics.nvim
- https://github.com/stevearc/profile.nvim
- https://github.com/tpope/vim-fugitive
- https://github.com/rcarriga/nvim-notify
- https://github.com/nvim-lualine/lualine.nvim
- https://github.com/hrsh7th/nvim-cmp / currently using blink.cmp ...
- https://github.com/Exafunction/windsurf.nvim

#### pickers

- https://github.com/echasnovski/mini.pick
- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
- https://github.com/nvim-telescope/telescope-ui-select.nvim
- https://github.com/ibhagwan/fzf-lua

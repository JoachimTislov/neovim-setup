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
- Add cmd line
- Work on Telescope
    - create a minimal setup, optionally use a different pkg
- Configure minimal diagnostics
    - https://github.com/rachartier/tiny-inline-diagnostic.nvim
- Migrate over to the inbuilt package manager in version 12.0
- Update the grep telescope functionality
- Figure out a clean of closing tabs, buffer and exiting vim. (with key binds)
    - buffer, :bd
    - tab, :tabc
        - Should probably support managing tabs better, which can be done with harpoon or similar
    - Exiting vim, :q - but there's also :qa, :qa!. And this should be supported, but can be annoying - maybe
        - <leader>e = quit/exit, <leader>q = open quit alternative menu; <leader>qf == quit force, <leader>qt == close tab, <leader>qb == exit buffer (empty buffer)
        - Writing bd, qa, q, and etc.
- Update silkcircuit colors from pink and purple to blue and lime ?
- Add a good snippets plugin, maybe [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    - friendly snippets: https://github.com/rafamadriz/friendly-snippets
    - add with https://github.com/hrsh7th/nvim-cmp

- Consider switching to programmer Dvorak keyboard layout (unlikely)
    - https://wiki.archlinux.org/title/Dvorak
    - https://www.kaufmann.no/roland/dvorak/
    - https://www.kaufmann.no/roland/dvorak/linux.html
    - training: https://learn.dvorak.nl/

### Plugins

#### to add

AI:
    https://github.com/olimorris/codecompanion.nvim
    https://github.com/github/copilot.vim
    [cursor like features](https://github.com/yetone/avante.nvim)
https://github.com/nvimdev/lspsaga.nvim
https://github.com/meznaric/key-analyzer.nvim?tab=readme-ov-file
https://github.com/ycm-core/YouCompleteMe
https://github.com/neoclide/coc.nvim?tab=readme-ov-file
    - To host VS Code extensions
https://github.com/piersolenski/wtf.nvim
https://github.com/folke/trouble.nvim
https://github.com/folke/noice.nvim
https://github.com/voldikss/vim-floaterm
https://github.com/stevearc/overseer.nvim
{
  'stevearc/overseer.nvim',
  opts = {},
}
https://github.com/gelguy/wilder.nvim
https://github.com/ahmedkhalf/project.nvim
https://github.com/echasnovski/mini.misc?tab=readme-ov-file#features


#### Commented out (to be removed or reconfigured)

- treesitter
- notify
- guess indent (in lazy file)
- dashboard

#### misc

https://github.com/lukas-reineke/indent-blankline.nvim?tab=readme-ov-file
https://github.com/artemave/workspace-diagnostics.nvim
https://github.com/stevearc/profile.nvim
https://github.com/tpope/vim-fugitive
https://github.com/ravitemer/mcphub.nvim


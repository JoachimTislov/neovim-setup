# Neovim config/setup

I thrive for a minimal setup and utilizing the inbuilt features over external ones.

## Resources

- [AI plugins](https://gist.github.com/ColinKennedy/8a0eea1b18b6e22bc10daa64cb47ae9d)

## TODOs

- Always indent on entering insert - no point in being on the wrong indentation
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

- Consider switching to programmer Dvorak keyboard layout (unlikely)
    - https://wiki.archlinux.org/title/Dvorak
    - https://www.kaufmann.no/roland/dvorak/
    - https://www.kaufmann.no/roland/dvorak/linux.html
    - training: https://learn.dvorak.nl/

### Plugins

#### to add

https://github.com/github/copilot.vim
https://github.com/nvimdev/lspsaga.nvim
https://github.com/meznaric/key-analyzer.nvim?tab=readme-ov-file
https://github.com/ycm-core/YouCompleteMe
https://github.com/neoclide/coc.nvim?tab=readme-ov-file
    - To host VS Code extensions
https://github.com/piersolenski/wtf.nvim
https://github.com/folke/trouble.nvim
https://github.com/folke/noice.nvim
https://github.com/voldikss/vim-floaterm
https://github.com/akinsho/toggleterm.nvim
tab:
    - https://github.com/akinsho/bufferline.nvim
    - https://github.com/nanozuki/tabby.nvim
https://github.com/stevearc/overseer.nvim
{
  'stevearc/overseer.nvim',
  opts = {},
}
https://github.com/gelguy/wilder.nvim
https://github.com/ahmedkhalf/project.nvim

#### Commented out

- treesitter
- notify
- guess indent (in lazy file)

#### misc

https://github.com/lukas-reineke/indent-blankline.nvim?tab=readme-ov-file
https://github.com/artemave/workspace-diagnostics.nvim

![LunarVim Demo](./utils/media/lunarvim_logo_dark.png)

<div align="center"><p>
    <a href="https://github.com/ChristianChiarulli/LunarVim/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/ChristianChiarulli/LunarVim" />
    </a>
    <a href="https://github.com/ChristianChiarulli/LunarVim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/ChristianChiarulli/LunarVim"/>
    </a>
    <a href="https://github.com/ChristianChiarulli/LunarVim/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/siduck76/NvChad?style=flat-square&logo=GNU&label=License" alt="License"
    />
    <a href="https://patreon.com/chrisatmachine" title="Donate to this project using Patreon">
      <img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" />
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=chrisatmachine">
      <img src="https://img.shields.io/twitter/follow/chrisatmachine?style=social&logo=twitter" alt="follow on Twitter">
    </a>
</p>	

</div>

## Install In One Command!

Make sure you have the newest version of Neovim (0.5).

``` bash
bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/master/utils/installer/install.sh)
```

### Installing
The following command installs LunarVim.  Change `LVBRANCH` to the branch you'd like to install.  `master` for the stable branch and `rolling` for the latest changes.
``` bash
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/rolling/utils/installer/install.sh)
```

### BREAKING CHANGE on the rolling branch
* The latest changes to LunarVim require you to [remove it completely](https://github.com/ChristianChiarulli/LunarVim/wiki/Uninstalling-LunarVim) before upgrading
* Going forward LunarVim will no longer reside in the nvim configuration folder.  LunarVim has been moved to `~/.local/share/lunarvim`.  
* To launch Lunarvim use the new `lvim` command.  `nvim` will only launch standard neovim.  
* Your personal configuration file (`lv-config.lua`) can now be found in `~/.config/lvim`.  You can initialize this folder as a git repository to track changes to your configuration files.
* If you want to keep launching LunarVim with the `nvim` command, add an alias entry to your shell's config file:  `alias nvim=lvim`.  To temporarily revert to the default `nvim` prefix it with a backslash `\nvim`.
* Many options formerly available in `lv-config.lua` have been renamed.  For details [look here](https://github.com/ChristianChiarulli/LunarVim/wiki/Breaking-changes-in-rolling)

### Fixing installation problems
If your installation is stuck on `Ok to remove? [y/N]`, it means there are some leftovers, \
you can run the script with `--overwrite` but be warned this will remove the following folders:
- `~/.cache/nvim`
- `~/.config/nvim`                        #Removed only on Master Branch
- `~/.local/share/nvim/site/pack/packer`  #Removed only on Master Branch
- `~/.local/share/lunarvim`               #Removed only on Rolling Branch
- `~/.config/lvim`                        #Removed only on Rolling Branch
```bash
curl -s https://raw.githubusercontent.com/ChristianChiarulli/lunarvim/rolling/utils/installer/install.sh | LVBRANCH=rolling bash -s -- --overwrite
```
then run nvim and wait for treesitter to finish the installation


## Installing LSP for your language

Just enter `:LspInstall` followed by `<TAB>` to see your options

**NOTE** I recommend installing `lua` for autocomplete in `lv-config.lua`

For the julia language server look [here](https://github.com/ChristianChiarulli/LunarVim/wiki/Enabling-a-language-server#julia-support)

## Configuration file

To activate other plugins and language features use the `lv-config.lua` file provided in the `nvim` folder (`~/.config/nvim/lv-config.lua`) in the master branch or (`~/.config/lvim/lv-config.lua`) on rolling

Example:

```lua
-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

lvim.builtin.compe.autocomplete = true

-- keymappings
lvim.leader = "space"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.lang.python.formatter.exe = "black"
lvim.lang.python.linters = ""

lvim.lsp.diagnostics.virtual_text = false

-- Additional Plugins
lvim.plugins = {
    {"lunarvim/colorschemes"},
    {"folke/tokyonight.nvim"}, {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

```

In case you want to see all the settings inside LunarVim, run the following:

```bash
cd /tmp
lvim --headless +'lua require("lv-utils").generate_settings()' +qa && sort -o lv-settings.lua{,}
```
and then inspect `/tmp/lv-settings.lua` file

## Updating LunarVim

In order to update you should be aware of three things `Plugins`, `LunarVim` and `Neovim`

To update plugins:

```
:PackerUpdate
```

To update LunarVim:

```bash
# Master Branch
cd ~/.config/nvim && git pull
:PackerSync  

# Rolling Branch
cd ~/.local/share/lunarvim/lvim && git pull
:PackerSync
```

To update Neovim use your package manager or [compile from source](https://github.com/ChristianChiarulli/LunarVim/wiki/Installation#get-the-latest-version-of-neovim)

## Project Goals

1. Provide basic functionalities required from an IDE
    - LSP
    - Formatting/Linting
    - Debugging
    - Treesitter
    - Colorschemes
2. Be as fast and lean as possible 
    - Lazy loading
    - Not a single extra plugin
    - User configurable lang/feature enable/disable
3. Provide a [simple and easy](https://github.com/LunarVim/LunarVimCommunity) way for users to share their own configuration or use others. 
4. Hot reload of configurations
    - Hot install of lsp/treesitter/formatter required upon openning a filetype for the first time
5. Provide a stable & maintainable error free configuration layer over neovim 
    - With the help of the community behind it
    - Github workflow testing
    - Freezing plugin versions
6. Provide detailed documentation
    - Video series on how to configure LunarVim as an IDE for each lang
7. Valhalla

## Resources

- [YouTube](https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA)

- [Wiki](https://github.com/ChristianChiarulli/LunarVim/wiki)

- [Discord](https://discord.gg/Xb9B4Ny)

- [Twitter](https://twitter.com/chrisatmachine)

## Testimonials

> "I have the processing power of a potato with 4 gb of ram and LunarVim runs perfectly."
> - @juanCortelezzi, LunarVim user.

> "My minimal config with a good amount less code than LunarVim loads 40ms slower. Time to switch."
> - @mvllow, Potential LunarVim user.

<div align="center" id="madewithlua">
	
[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blue.svg?style=for-the-badge&logo=lua)](#madewithlua)
	
</div>

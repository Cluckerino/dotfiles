# Hey look, dotfiles

I'm following [Zach Holman's](https://github.com/holman)
[advice](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

This is intended to be more than just setting up a shell environment; the `Brewfile`
should install a **lot** of apps (e.g. browses, Visual Studio).

## Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## Shell

I use a fancy ZSH with [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) and [oh-my-zsh](https://ohmyz.sh/).

## Components

There's a few special files in the hierarchy.

- **Brewfile**: This is a list of applications for [Homebrew](https://brew.sh/) and [Homebrew Cask](https://caskroom.github.io)
 to install. This should install ZSH and all the fancy stuff I use with it, as well as all of the other applications I need to
 get: e.g. Chrome, Visual Studio Code, etc.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded last and is expected to setup autocomplete.
- **topic/\*.bash**: Similar to `.zsh` files, but for bash.
- **topic/path.bash**: Similar to `path.zsh` files; these get loaded to bash first.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/run_install_scripts.sh`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap.sh`.

## To install

Run this:

```sh
git clone https://github.com/cluckerino/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `~/.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

### Install deets

The order of scripts are as follows:

1. `script/bootstrap`
    1. Symlink `*topic*/*.symlink`:
2. `script/install`
    1. `homebrew/install.sh`
    2. Consume `Brewfile`
    3. `*topic*/install.sh`

## Thanks

Thanks again to [Zach Holman](https://github.com/holman).

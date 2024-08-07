# Personal Configs Repo

Just configs that I have on my personal machine, clone the repo and source them where you want them.

> [!NOTE]
> I just made this to share with friends.

## How to Use

Put the files in a directory called `~/.config/yamens` and source the `entrypoint.sh` file into your shell prompt.

For executables, I use a directory called `~/.exec` that I add to `$PATH`.

## Files

* [entrypoint.sh](./entrypoint.sh): entry point and also dump for `.bashrc` configs that I have changed.
* [functions.sh](./functions.sh): custom shell functions.
* [nnn-config.sh](./nnn-config.sh)

## Programs to Install

* [brew](https://brew.sh/)
* [nnn](https://github.com/jarun/nnn) or [yazi](https://github.com/sxyazi/yazi)
* [fzf](https://github.com/junegunn/fzf)
* [bat](https://github.com/sharkdp/bat)
* [zellij](https://zellij.dev/)
* [oh-my-posh](https://ohmyposh.dev/)
* [atuin](https://github.com/atuinsh/atuin)
* [eza](https://github.com/eza-community/eza)
* [btop](https://github.com/aristocratos/btop)
* [zoxide](https://github.com/ajeetdsouza/zoxide)
* [tldr](https://github.com/tldr-pages/tldr)
* [rg](https://github.com/BurntSushi/ripgrep)
* [jless](https://jless.io/)
* [lazygit](https://github.com/jesseduffield/lazygit)

## Dotfiles

I use GNU stow to manage the [dotfiles directory](./dotfiles), here is a [simple tutorial](https://www.youtube.com/watch?v=y6XCebnB9gs) on this.

Run the following:

```bash
stow . -t ~
```

You may also use [chezmoi](https://github.com/twpayne/chezmoi) for this but I liked symlinks more because of their simplicity.

## Prompt

The theme can be found [here](./theme.omp.toml) for OMP.

## Shell

`zsh` is used with `zinit`.

## Desktop Theme

* [Nordic-Darker](https://github.com/EliverLara/Nordic)
* [Papirus Icons](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

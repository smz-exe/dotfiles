# dotfiles

Personal macOS dotfiles, managed with [chezmoi](https://www.chezmoi.io/). Apple Silicon + zsh only.

## Bootstrap a new Mac

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply smz-exe
```

First run prompts for git `name` (default `smz-exe`) and `email`. Answers are saved to `~/.config/chezmoi/chezmoi.toml` on that machine and are **not** tracked in this repo.

## What's managed

- Shell — `.zshrc`, `.zshenv`
- Git — `.gitconfig` (templated name/email), `.config/git/ignore`
- Prompt — `.config/starship.toml`
- Terminals — `.config/ghostty/config`, `.config/alacritty/alacritty.toml`
- Node — `.config/mise/config.toml` (Node via `lts`)
- Editor — `.config/nvim/` (init.lua, `lua/`, `after/`, `.luarc.json`)
- Other — `.latexmkrc`

## Daily workflow

```sh
chezmoi edit ~/.zshrc      # edit the source copy
chezmoi apply              # write it back to $HOME
chezmoi re-add ~/.zshrc    # pull in edits made directly to ~/.zshrc
chezmoi update             # git pull + chezmoi apply in one step
chezmoi cd                 # cd into the source repo to commit / push
```

## Notes

- Neovim `lazy-lock.json` is intentionally untracked — plugin versions float per machine.
- `.gitconfig` `user.name` and `user.email` use `promptStringOnce`, so each machine prompts once on `chezmoi init`.

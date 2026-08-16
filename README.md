# dotfiles

Minimal macOS development environment with Ghostty, Zsh, Git, and Vim.

## Install

On a new Mac, clone this repository and run:

```sh
./setup
```

The setup script installs Homebrew when necessary, installs the packages in the
`Brewfile`, links the configuration files, applies the Git defaults, and offers
to make Zsh the default shell. Existing files are backed up with a timestamp.

Run `./setup` again at any time to repair links or install newly added packages.

## Shell shortcuts

- `Esc` enters Vim normal mode; `i`, `a`, etc. return to insert mode.
- `Esc k` changes to the parent directory.
- `Esc h` changes to the home directory.
- `Esc l` lists the current directory.
- `Esc s` prepends `sudo` to the current command.
- `Esc f`, `Esc b`, `Esc t`, and `Esc r` insert a Git file, branch, tag, or remote selected with `fzf`.
- `Esc g h` inserts a commit selected from Git history.
- Up and Down search history using the text already typed.

The main aliases are documented directly in `zsh/.zshrc`.

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

## Aliases

| Alias | Command | Purpose |
| --- | --- | --- |
| `l` | `eza -lahF --group-directories-first` | Detailed listing including hidden files, with directories grouped first |
| `cat` | `bat` | File output with syntax highlighting, line numbers, and Git changes |
| `c` | `clear` | Clear the terminal |
| `v` | `vim .` | Open the current directory in Vim |
| `gs` | `git status --short --branch` | Compact Git status |
| `gc` | `git commit` | Create a commit |
| `gco` | `git switch` | Switch branches |
| `gcb` | `git switch -c` | Create and switch to a branch |
| `gc-` | `git switch -` | Return to the previous branch |
| `gpp` | `git push` | Push the current branch |
| `gll` | `git log --all --decorate --oneline --graph` | Compact visual Git history |

`gtg <ref-a> <ref-b>` shows commits that differ between two branches, tags, or
other Git references.

Use `command cat` when you specifically need the original macOS `cat` command.

## Command-line tools

### zoxide

`zoxide` is a smarter `cd`. It learns which directories you use and lets you
jump to them using a memorable fragment instead of their full path.

```sh
z dotfiles       # Jump to the best matching directory
z dev project    # Match multiple fragments
zi               # Select a known directory interactively with fzf
```

Use ordinary `cd` whenever you want; both commands contribute to zoxide's
directory database.

### ripgrep (`rg`)

`ripgrep` recursively searches file contents. It is fast, respects `.gitignore`,
and skips hidden and binary files by default.

```sh
rg 'search text'
rg 'TODO' src/
rg -i 'case insensitive'
rg --hidden 'include hidden files'
```

### fd

`fd` is a convenient alternative to `find` for locating files and directories.
It uses regular expressions, respects `.gitignore`, and produces readable output.

```sh
fd config
fd -e ts
fd package src/
fd -H '.env'     # Include hidden files
```

### eza

`eza` is a modern directory listing tool. The `l` alias enables a detailed view
with hidden files, file-type indicators, and directories grouped first.

```sh
l
eza --tree --level=2
eza -lah --git
```

### bat

`bat` displays files with syntax highlighting, line numbers, Git modifications,
and automatic paging. It replaces `cat` through the shell alias.

```sh
cat README.md
bat -n setup
bat --plain README.md   # No decorations
```

### fzf

`fzf` is an interactive fuzzy selector. It powers `zi` and the `Esc` Git
shortcuts above, and it can also filter any list from another command.

```sh
fd | fzf
git branch --format='%(refname:short)' | fzf
```

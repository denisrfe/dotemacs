<div align=center><a href="https://github.com/emacs-tw/awesome-emacs"><img alt="Emacs Logo" width="240" height="240" src="https://upload.wikimedia.org/wikipedia/commons/0/08/EmacsIcon.svg"></a></div>

This repository contains my `.emacs.d` directory and config files.

To install this `emacs.d` directory, simply rename emacs to .emacs and emacs.d to .emacs.d and move to your home directory.

Inside file .emacs have the packages needed to configure properly.

This configuration comes with following emacs packages:

- MELPA Repository enabled
- Material Theme to dark mode
- EGG (Emacs Got Git)
- Docker compose mode
- Puppet mode
- Terraform mode
- Company mode for autocomplete
- MPG123 to listen music
- Backup files disabled
- Some command alias
- Keyboard shotcuts
- Icons on dired mode
- Environment variables for terraform on Oracle Cloud

# Contents

* [Emacs Keybindings](#emacs-keybindings)
  * [File Operations](#file-operations)
  * [Copy, Paste, Undo](#copy-paste-undo)
  * [Deleting text](#deleting-text)
  * [Select text](#select-text)
  * [Split window](#split-window)
* [Dired Mode](#dired-mode)
  * [Most Useful Commands](#most-useful-commands)
* [EGG Mode](#egg-mode)
  * [Install EGG](#install-egg)
  * [Commit Files](#commit-files)
  * [Common Key Bindings](#common-key-bindings)
* [Define Alias](#define-alias)

* [Useful Links](#useful-links)

## Emacs Keybindings

### File Operations
- `C-x C-f` Open file
- `C-x C-`s Save
- `C-x k` Kill buffer

### Copy Paste Undo
- `C-_` Undo
- `Alt-w` Copy
- `C-w`  Cut
- `C-y` Paste

### Deleting text
- `Alt-d` Delete the word to the right
- `Alt-backspace` Delete the previous word
- `C-k` Delete all characters from cursor to end of line

### Select Text
- `C-Space` Mark the starting point for cut/copy a text
- `C-x h` Select all

### Split Window
- `C-x 2` Split window vertically
- `C-x 3` Split window horizontally
- `C-x 1` Remove all split panes
- `C-x o` Move cursor to the next pane


## Dired Mode
M-x dired is the emacs file management

Most useful commands:
- `Enter` Open file or directory
- `q` Done. Quit
- `C` Copy file
- `R` Rename/move file
- `D` Delete file or directory
- `+` Create new directory
- `Z` Compress/decompress the file by gzip
- `m` Mark a file
- `u` Unmark a file
- `%-m` Mark by pattern (regex). For example, for mark all html files type %-m then `\.html$`
- `g` Refresh dir listing

## EGG Mode

### Install EGG
Install egg with M-x package-install RET egg
Insert into your `.emacs` the line `(require 'egg)`

### Commit files
Type M-x egg-status, this show the Unstaged, Staged, Untracked and Stashed WIPs files.
To stage a modified file go to them and type `s` or press `S` to stage all modified files.
Press `c` to commit file, provide a commit message and press `C-c C-c` to exit
Press `P` to push  to the upstream and press `q` to exit egg-mode.

### Common Key Bindings

## Define alias
To define alias on emacs use the defalias on `.emacs` file.
For example, to define an alias to git-status command named git insert into `.emacs` file:
`(defalias 'git 'egg-status)`
`p` Previous block
`n` next block
`c` commit staged modifications
`P` push to the upstream
`j` pull from the upstream
`l` show repo's history
`S` stage all modifications
`U` unstage all modifications
`d` diff other revision
`X` throw away ALL modifications
`DEL` throw away file's modifications
`h` hide/show blocks
`H` Hide sub-blocks
`G` Redisplay
`q` quit





#### Useful links:
- **http://ergoemacs.org/emacs/emacs_keys_basics.html
<div align=center><a href="https://github.com/emacs-tw/awesome-emacs"><img alt="Emacs Logo" width="240" height="240" src="https://upload.wikimedia.org/wikipedia/commons/0/08/EmacsIcon.svg"></a></div>

# Denis dotemacs

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

## Emacs Keybindings

### Open, Save, Close, File
- C-x C-f Open file
- C-x C-s Save
- C-x k Kill buffer

### Copy Paste Undo
- C-_ Undo
- Alt-w Copy
- C-w  Cut
- C-y Paste

### Deleting Text
- Alt-d Delete the word to the right
- Alt-backspace Delete the previous word
- C-k Delete all characters from cursor to end of line

### Select Text
- C-Space Mark the starting point for cut/copy a text
- C-x h Select all

### Split Window
- C-x 2 Split window vertically
- C-x 3 Split window horizontally
- C-x 1 Remove all split panes
- C-x o Move cursor to the next pane


## Dired Mode
M-x dired is the emacs file management

Most useful commands:
- Enter Open file or directory
- q Done. Quit
- C Copy file
- R Rename/move file
- D Delete file or directory
- + Create new directory
- Z Compress/decompress the file by gzip
- m Mark a file
- u Unmark a file
- %-m Mark by pattern (regex). For example, for mark all html files type %-m then \.html$
- g Refresh dir listing
- > Move cursor to next subdirectory
- < Move cursor to previous subdirectory








#### Usefull links:
- **http://ergoemacs.org/emacs/emacs_keys_basics.html
# Dotfiles

These files are used for my terminal configuration across various machines (Mac or Linux).  Anything under `config/` is symlinked to the home directory by `install.sh`.  Files under `include/` are sourced from `bash_profile`. Feel free to fork/copy but use at your own risk.

## Contents

##### install.sh
This script was written by [Scott Dougan](https://github.com/scottdougan/) and does the symlinking of all the configuration dotfiles.  In short, the script will symlink the `.bashrc` (Linux) or `.bash_profile` (Mac) to `.dotfiles/bash_profile` and will symlink all the files located in the config folder to the users home directory.  See installation instructions below.

##### bash_profile
The contents of this file will replace `.bash_profile` (Mac) or `.bashrc` (Linux) via a symlink. If using across both systems remember to have checks around any system-dependent commands.

### `config/`

##### Brewfile
Contains homebrew packages and applications that I like to have on my Mac. They are installed through my `macSetup.sh` script in the [scripts repo](https://github.com/alexvermeulen/scripts).

##### gitconfig
Configuration for Git

##### vimrc
Configuration for Vim

### `include/`

##### aliases
Does exactly what it sounds like it does.
  
##### appearance
Customizes the appearance of the terminal prompt based on the success/failure of the last-executed command.  Also displays whatever git branch you are currently on and/or the active virtual environment.

## Install
1. Clone this repository into your home directory
2. Rename the `dotfiles` folder to `.dotfiles`
3. Run the install script (**at your own risk!**)

    To install the dotfiles run the `install.sh` script then follow the command line prompts.  The script will create a symlink to `dotfiles/bash_profile` from your `.bashrc` (Linux) or `.bash_profile` (Mac) in the home directory.  It will also create symlinks in your home directory for each file in `dotfiles/config`.  If any of the files being linked already exists a backup of the file will be created with the extension `.bak`.
    ```
    ./install.sh
    ```

## Uninstall
To unlink the files linked by `install.sh` run the script with the `--uninstall` flag.  This will remove the symlink and restore files from the `.bak` backups (if they exist).
```
./install.sh --uninstall
```

## Note
* If you don't have anything to put in the config folder you can delete it. The install script will skip trying to symlink config files if the folder is missing.
* The script isn't portable and is only expected to work with bash from a `$HOME/.dotfiles` directory.
* This very likely contains some bugs. Please use at your own risk!

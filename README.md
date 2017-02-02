# blm
A login manager written entirely in bash.

## Setup
Copy the reference blm.config file to either of:

- `$HOME/.config/blm/blm.conf`
- `$HOME/.blm.conf`
- `/etc/blm.conf`

Disable any graphical login managers (many Linux distributions come with such preinstalled). Refer to the relevant documentation when in doubt.

Then execute

```
echo '. /path/to/blm' >> ~/.bash_profile
```

to enable launching the script on login. When using a non-bash login shell, refer to the relevant documentation.


## Configuration
To configure which sessions can be launched from the manager, create the relevant directories as specified in your configuration file.

Options:

- PS3 :: Specifies the prompt.
- MODE :: "text"/"dialog" Specifies the display mode. For mode "dialog" the dialog library must be installed.
- XSESSIONS :: The x sessions directory path (see #Sesions).
- OSESSIONS :: The directory path for non-x sessions.
- MENUS :: The directory path containing sub-menus.

Dialog-specific options:
- HEIGHT :: The height of the dialog.
- WIDTH :: The width of the dialog.
- ITEMHEIGHT :: The height of items in the dialog.

### Sessions
There are 2 session types:

- Xsessions :: Sessions launched using `xinit`. The file is executed after X launches, much like the .xinit file when launching using startx.
- Osessions :: Sessions launched using `exec`. These are shell scripts that are executed. A simple example would be, for example, `exec /bin/bash` for a normal tty.

Besides these, "menus" can be created.

Menus are subdirectories of the `$MENUS` directory, which in turn contain an xsessions and osessions directory.
In these the items of sub-menus can be specified.

### Example

For example, by default the following structure would work:

```
.config/blm
├── blm.conf
├── menus
│   ├── remote
│   │   └── osessions
│   │       └── my.fav.server.net
│   └── shutdown
│       └── osessions
│           ├── reboot
│           └── shutdown
├── osessions
│   ├── bash
│   └── emacs
└── xsessions
    ├── awesome
    └── Gnome
```

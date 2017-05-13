# blm
A login manager written entirely in bash.

## Setup
1. Disable any graphical login managers (many Linux distributions come with such preinstalled). Refer to the relevant documentation when in doubt.
2. Execute `echo '. blm' >> ~/.bash_profile` to enable launching the script on login. When using a non-bash login shell, refer to the relevant documentation.

## Configuration
To configure which sessions can be launched from the manager, create
the relevant directories as specified in your configuration file.

### Options:
| Option    | Values            | Default              | Function                                                                            |
|-----------|-------------------|----------------------|-------------------------------------------------------------------------------------|
| PS3       | string            | "Select session: "   | Specifies the prompt.                                                               |
| MODE      | ("text"/"dialog") | "dialog"             | Specifies the display mode. For mode "dialog" the dialog library must be installed. |
| XSESSIONS | path              | "/etc/blm/xsessions" | The X sessions directory path (see [Sessions](#sessions)).                          |
| OSESSIONS | path              | "/etc/blm/osessions" | The directory path for non-X sessions.                                              |
| MENUS     | path              | "/etc/blm/menus"     | The directory path containing sub-menus.                                            |

### Dialog-specific options:
| Option     | Values | Default | Function                           |
|------------|--------|---------|------------------------------------|
| HEIGHT     | number |      14 | The height of the dialog.          |
| WIDTH      | number |      55 | The width of the dialog.           |
| ITEMHEIGHT | number |       6 | The height of items in the dialog. |

### Sessions
There are 2 session types:

- Xsessions :: Sessions launched using `xinit`. The file is executed
  after X launches, much like the .xinit file when launching using
  startx.
- Osessions :: Sessions launched using `exec`. These are shell scripts
  that are executed. A simple example would be, for example, `exec
  /bin/bash` for a normal tty.

Besides these, "menus" can be created.

Menus are subdirectories of the `$MENUS` directory, which in turn
contain an xsessions and osessions directory.  In these the items of
sub-menus can be specified.

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

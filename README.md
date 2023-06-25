<img src="https://user-images.githubusercontent.com/13941584/173183299-79946d36-276f-47d8-9c40-0a1ca968461f.png" align="left" height="160px" alt="MPDWeb logo">

# MPDWeb

Web client for the Music Player Daemon

<br clear="left">

<br>

:construction: This project is still under active development and some features may be missing. :construction:

## Table of contents

1. [What is this?](#what-is-this)
2. [Features](#features)
3. [Screenshots](#screenshots)
4. [Keybindings](#keybindings)
5. [Installation](#installation)
6. [Configuration](#configuration)
7. [Compatability](#compatability)
8. [Development](#development)
9. [License](#license)

## What is this?

MPDWeb is a web application that serves as a frontend for [MPD](https://musicpd.org) - a powerful server-side audio
player.

## Features

- Music database browsing
- Stored playlist support
- Global search
- Cover art
- Vi-inspired keybindings
- Volume control
- Playback options: random, repeat, single, consume

## Screenshots

![image](https://user-images.githubusercontent.com/13941584/179988308-567c0ebf-0f77-4363-b143-a4b98723b493.png)

![image](https://user-images.githubusercontent.com/13941584/179988487-ba594e21-504c-42cb-b9c2-31c7b7d6ba64.png)

![image](https://user-images.githubusercontent.com/13941584/187583493-f06eb125-a3c2-4f8f-a693-de34f1a08efa.png)

![image](https://user-images.githubusercontent.com/13941584/179988635-2bd73245-ba46-4a96-8b66-01bbc7bcbb7a.png)

## Keybindings

| Action                                                                        | Keybindings                   |
|-------------------------------------------------------------------------------|-------------------------------|
| Navigate down                                                                 | <kbd>j</kbd> <kbd>↓</kbd>     |
| Navigate up                                                                   | <kbd>k</kbd> <kbd>↑</kbd>     |
| Navigate left                                                                 | <kbd>h</kbd> <kbd>←</kbd>     |
| Navigate right                                                                | <kbd>l</kbd> <kbd>→</kbd>     |
| First item                                                                    | <kbd>gg</kbd> <kbd>Home</kbd> |
| Last item                                                                     | <kbd>G</kbd> <kbd>End</kbd>   |
| Add item                                                                      | <kbd>a</kbd>                  |
| Clear queue and play item                                                     | <kbd>p</kbd>                  |
| Show item in files view                                                       | <kbd>gi</kbd>                 |
| Show current song in files view                                               | <kbd>gI</kbd>                 |
| Remove item                                                                   | <kbd>x</kbd> <kbd>dd</kbd>    |
| Search                                                                        | <kbd>/</kbd>                  |
| Global search                                                                 | <kbd>s</kbd>                  |
| Play/pause                                                                    | <kbd>Space</kbd>              |
| Stop playback                                                                 | <kbd>S</kbd>                  |
| Play next song                                                                | <kbd>N</kbd>                  |
| Play previous song                                                            | <kbd>P</kbd>                  |
| Toggle random state                                                           | <kbd>Or</kbd>                 |
| Toggle repeat state                                                           | <kbd>Op</kbd>                 |
| Toggle consume state                                                          | <kbd>Oc</kbd>                 |
| Cycle single state: off/oneshot/on                                            | <kbd>Os</kbd>                 |
| Volume up                                                                     | <kbd>+</kbd>                  |
| Volume down                                                                   | <kbd>-</kbd>                  |
| Update database                                                               | <kbd>U</kbd>                  |
| Clear queue                                                                   | <kbd>Qc</kbd>                 |
| Focus queue sidebar                                                           | <kbd>q</kbd>                  |
| Toggle focused partition between up next/history when queue sidebar has focus | <kbd>h</kbd>                  |
| Enlarge cover art of currently playing song                                   | <kbd>c</kbd>                  |

## Installation

You will need `make`, `yarn`, and `rust 1.65+` in order to build MPDWeb.

1. Clone this repository (make sure the submodules get populated):

    ```shell
    git clone --recurse-submodules https://github.com/toncherami/mpdweb
    ```

2. Build

    ```shell
    make
    ```

3. The binary can be found at `backend/target/release/mpdweb`.

## Configuration

To configure MPDWeb create a config file at `$XDG_CONFIG_HOME/mpdweb/config.toml`. `XDG_CONFIG_HOME` defaults to `$HOME/.config` if not set.

Default configuration:
```toml
[mpd]
host = "localhost"
port = 6600

[server]
bind = "127.0.0.1"
port = 8989

[logging]
level = "info"
```

## Compatability

MPDWeb works best in combination with MPD 0.23.5+ and latest Firefox/Chromium. 

## Development

The codebase is split into two separate repositories - one for the [backend](https://github.com/toncherami/mpdweb.backend) and one for the [frontend](https://github.com/toncherami/mpdweb.frontend).

## License

MPDWeb is licensed under the [MIT License](http://opensource.org/licenses/MIT).

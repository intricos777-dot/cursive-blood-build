<!-- Watermark: Living_Sin (intricos777-dot) + AI agents (Hermes, Lia, opencode) - collaborative work -->
# Cursive Blood Build

A faithful snapshot of the **Cursive Blood** desktop build: black-as-void
backgrounds, blood-red text, and cursive fonts (Great Vibes / Dancing Script).
Everything lives under `home/` mirroring `$HOME`, so the repo can be restored
with a single script.

> Private repository — do not publish.

## What this is

A global theme + font build for KDE Plasma / GTK on Garuda Linux. The palette
is defined once in [`blood.yaml`](blood.yaml) and applied across the terminal,
shell prompt, editor TUI, GTK, Qt/KDE, Konsole, cursors, icons, window
decorations and wallpapers.

## Palette

| Token | Hex | Use |
| --- | --- | --- |
| background | `#050507` | blood-black base |
| accent / text | `#C8102E` | primary blood red |
| accent2 | `#FF1744` | bright blood red |
| muted | `#8B0000` | dark red (dims) |
| border | `#3A3440` | panel borders |

No pure white anywhere — the lightest text is bright blood red.

## Theme stack

| Layer | Value |
| --- | --- |
| Plasma desktop theme | `Infinity-Plasma` |
| Plasma look-and-feel | `Infinity-Global-6` |
| Window decoration | `Infinity-Blur-Aurorae-6` |
| Icon theme | `Blood` (inherits `BeautyLine`, `hicolor`) |
| Cursor theme | `Rage-Cursor` |
| GTK theme | `Sweet-Dark` |
| Qt widget style | `Dr460nized` (Kvantum) |
| Konsole profile | `Garuda` + `BlackRed` color scheme |
| Alacritty | Great Vibes 16, BlackRed palette |
| Shell prompt | Starship, red styles |
| opencode | `voidlit` theme |
| Splash | `a2n.kuro` |
| Wallpapers | `Infinity-*` |

## Fonts

- **Great Vibes** — UI / menu / terminal cursive face
- **Dancing Script** — fixed-width face
- Fontconfig `99-greatvibes-bold.conf` emboldens both cursive families.

## Layout

```
home/                       # mirrors $HOME
├── .bashrc, .bash_profile, .gitconfig, .gtkrc-2.0
├── .icons/                 # cursor themes (Rage-Cursor, The-Witcher-3)
├── .config/
│   ├── alacritty/          # terminal theme + font
│   ├── fish/               # shell config + functions
│   ├── fontconfig/         # cursive embolden rules
│   ├── gtk-3.0/ gtk-4.0/   # GTK theme, icons, cursor, colors.css
│   ├── Kvantum/            # Qt widget style
│   ├── kdeglobals          # KDE colors + fonts
│   ├── kdedefaults/        # fallback KDE defaults
│   ├── kwinrc              # window decoration + effects
│   ├── konsolerc           # Konsole profile/scheme
│   ├── plasmarc            # desktop theme
│   ├── plasmashellrc
│   ├── starship.toml       # prompt
│   ├── xsettingsd/         # live X settings
│   ├── opencode/           # opencode.jsonc, tui.json, voidlit theme
│   └── micro/              # editor settings
└── .local/share/
    ├── color-schemes/      # InfinityBlueDark, InfinityDark
    ├── fonts/              # Dancing Script, Great Vibes
    ├── icons/              # Blood + alternate dark icon themes
    ├── aurorae/themes/     # Infinity window decorations
    ├── plasma/             # look-and-feel + desktop theme
    ├── wallpapers/
    └── konsole/            # BlackRed.colorscheme, Garuda.profile
```

## Install

```sh
./install.sh
```

Copies every file from `home/` into `$HOME`, backing up anything that already
exists to `~/.cursive-blood-backup/<timestamp>/` first. Re-run freely; it is
idempotent and non-destructive.

Manual restore:

```sh
cp -a home/. "$HOME"/
fc-cache -fv          # rebuild font cache
```

## Notes

- Third-party themes (Infinity, Sweet-Dark, Dr460nized, BeautyLine) are kept
  as-is for fidelity. Re-download upstream if you want updates.
- `blood.yaml` is the single source of truth for the palette; regenerate
  terminal/editor themes from it when tweaking.

# Gnome Setup

## Theme

- Cursors: Capitaine Cursors
  - Download binaries from [Pling](https://www.pling.com/p/1148692)
    - Install extracted contents via `sudo cp -pr <LOCATION> /usr/share/icons/capitaine-cursors` for all users
  - Source located on GitHub at [keeferrourke/capitaine-cursors](github.com/keeferrourke/capitaine-cursors)
- Icons: Papirus
  - Download binaries via dnf: `sudo dnf install papirus-icon-theme`
  - Source located on GitHub at [PapirusDevelopmentTeam/papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/)

## Settings

```sh
# Variable Refresh Rate
# (note that this will overwrite the existing array, use `get` in lieu of `set` to retrieve existing values)
# (may change in the future to be non-experimental)
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"

# Disable mouse acceleration for mice/trackballs
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

# Disable tap-to-click for touchpads
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click false

# Disallow middle-click pasting (should also disable middlemouse.paste in firefox's about:config)
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

# Use workspaces on all monitors, otherwise disconnecting/reconnecting monitors moves windows to a single space
gsettings set org.gnome.mutter workspaces-only-on-primary false

# Gnome's GUI dosn't allow users to bind their workspace shortcuts past 4 for some reason.
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Control>F1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Control>F2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Control>F3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Control>F4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Control>F5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Control>F1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Control>F2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Control>F3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Control>F4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Control>F5']"

# Disable hot-corners
gsettings set org.gnome.desktop.interface enable-hot-corners false
```

## Extensions

- [Night Theme Switcher](https://extensions.gnome.org/extension/2236/night-theme-switcher/)
  - Sunrise script
    ```
    gsettings set org.gnome.desktop.interface icon-theme "'Papirus-Light'";
    ```
  - Sunset script
    ```
    gsettings set org.gnome.desktop.interface icon-theme "'Papirus-Dark'";
    ```
- [AppIndicator Support](https://extensions.gnome.org/extension/615/appindicator-support/)
  - Install via `sudo dnf reinstall gnome-shell-extension-appindicator` for Fedora's official version

## Nautilus Thumbnails

### RAW

Gnome does not (yet) support `RAW` file thumbnails. Fedora 42 also seems to be missing `ufraw` packages to do this, and `raw-thumbnailer` is unavailable.

Thankfully, [miniaturo](https://github.com/dbrgn/miniaturo) ([copr](https://copr.fedorainfracloud.org/coprs/decathorpe/miniaturo/)) can be used in their stead with a small edit to `/usr/share/thumbnailers/gdk-pixbuf-thumbnailer.thumbnailer`:

```
[Thumbnailer Entry]
TryExec=/usr/bin/miniaturo
Exec=/usr/bin/gdk-pixbuf-thumbnailer -s %s %u %o
MimeType=image/png;image/bmp;image/x-bmp;image/x-MS-bmp;image/gif;image/x-icon;image/x-ico;image/x-win-bitmap;image/vnd.microsoft.icon;application/ico;image/ico;image/icon;text/ico;application/x-navi-animation;image/jpeg;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/tiff;image/x-xpixmap;image/x-xbitmap;image/x-tga;image/x-icns;image/x-quicktime;image/qtif;image/x-3fr;image/x-adobe-dng;image/x-arw;image/x-bay;image/x-canon-cr2;image/x-canon-crw;image/x-cap;image/x-cr2;image/x-crw;image/x-dcr;image/x-dcraw;image/x-dcs;image/x-dng;image/x-drf;image/x-eip;image/x-erf;image/x-fff;image/x-fuji-raf;image/x-iiq;image/x-k25;image/x-kdc;image/x-mef;image/x-minolta-mrw;image/x-mos;image/x-mrw;image/x-nef;image/x-nikon-nef;image/x-nrw;image/x-olympus-orf;image/x-orf;image/x-panasonic-raw;image/x-panasonic-raw2;image/x-pef;image/x-pentax-pef;image/x-ptx;image/x-pxn;image/x-r3d;image/x-raf;image/x-raw;image/x-rw2;image/x-rwl;image/x-rwz;image/x-samsung-srw;image/x-sigma-x3f;image/x-sony-arw;image/x-sony-sr2;image/x-sony-srf;image/x-sr2;image/x-srf;image/x-x3f;
```

Note that `TryExec` has been changed to use `miniaturo`, and `MimeType` has been expanded to include many other types of `RAW` files.

## Bugs & Gotchas

### Chrome Keyboard Shortcut Popups

Chrome has an odd [bug](https://issues.chromium.org/issues/404298968) at the moment in Gnome that causes a "Keyboard Shortcuts" popup to open whenever it is opened.

To fix this, you can add `--disable-features=GlobalShortcutsPortal` to the end of the `Exec` commands in the desktop application shortcut file.

For a flatpak user installation, the `.desktop` file can be found at `~/.local/share/flatpak/app/com.google.Chrome/current/active/export/share/applications/com.google.Chrome.desktop`

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

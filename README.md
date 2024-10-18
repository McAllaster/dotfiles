# Dotfiles

## Kitty
For Kitty light/dark mode, install https://github.com/gaheldev/kitty-gnome-lightdark-mode-switcher

## Flatpak

- [FlatSeal](https://github.com/tchx84/Flatseal) is a helpful GUI manipulation of Flatpak permissions/settings
- Wayland & GPU acceleration are often toggled off by default, make sure to enable them where appropriate
- Some apps (possibly incorrectly) use `XCURSOR_PATH`, set the environment variable: `XCURSOR_PATH=/run/host/user-share/icons:/run/host/share/icons`
- Using KDE, applications that need to stop the screensaver from appearing may need the `org.freedesktop.ScreenSave` session bus added to talk over

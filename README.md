# Dotfiles

## Common

###  Kitty
For Kitty light/dark mode, install https://github.com/gaheldev/kitty-gnome-lightdark-mode-switcher

## Linux

### Flatpak

- [FlatSeal](https://github.com/tchx84/Flatseal) is a helpful GUI manipulation of Flatpak permissions/settings
- Wayland & GPU acceleration are often toggled off by default, make sure to enable them where appropriate
- Some apps (possibly incorrectly) use `XCURSOR_PATH`, set the environment variable: `XCURSOR_PATH=/run/host/user-share/icons:/run/host/share/icons`
- Using KDE, applications that need to stop the screensaver from appearing may need the `org.freedesktop.ScreenSave` session bus added to talk over

### Fedora & Smartcards

By default, Fedora seems to ship with both `pcsc-lite` and `opensc`. Both of these being present seems to cause conflicts with GPG being able to detect smartcards (i.e. `gpg --card-status`). Uninstalling `opensc` and restarting `pcscd` (`sudo systemctl restart pcscd`) should fix this.

### Keyboard Remapping

The most reliable way for a hardware keyboard to be remapped without affecting _other_ keyboards is to use `udev` rule updates.
Deskthority has a [good thread](https://deskthority.net/viewtopic.php?t=24076) on the subject.

To get a list of devices with input events associated with them, run `evtest` (with root permissions).
After executing the command and selecting the input device, you will see which codes are being executed by the device.

Once you've made note of the codes you're using for the given device, it's time to find the device's `modalias` (replacing `event2` with the appropriate input event assignment for your device):

```sh
cat /sys/class/input/event2/device/modalias
```
This outputs something like the following:
```
input:b0003v258Ap002Ae0111-e0,1,4,11,14,k71,72,73,74,75,79,7A,7B,7C,7D,7E,7F...
```

A file named like `70-internal-keyboard.hwdb` can be created in `/etc/udev/hwdb.d/`:
```
evdev:input:b0003v258Ap002*
 KEYBOARD_KEY_38=key_leftmeta
 KEYBOARD_KEY_db=key_leftalt
```

> Note that you do not need to use the entire input's modalias.

> Key codes can be found by referring to `/usr/include/linux/input-event-codes.h`.


Ensure you run the following to apply the changes (with root permissions, replace `event2` with your input event):
```sh
systemd-hwdb update ; udevadm trigger --verbose --sysname-match='event2'
```

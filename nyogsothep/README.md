# Nyogsothep

## Keyboard Mapping

Keyboard mapping for Nyogsothep is done via `udev` hardware database under `/etc/udev/hwdb.d/90-internal-keyboard.hwdb`.
The contents of this file are constructed in the following manner:

```
evdev:<used_identification>:<identifier>:*
 KEYBOARD_KEY_<scancode>=<keycode>
```

`<used_identification>` can be replaced by something such as `name` (or `input`, but I don't use that here).
Assuming `name` is used, you can use `cat /proc/bus/input/devices | less` to find the device's name, replacing `<identifier>` with it.

To find the replacement for `<scancode>` and `<keycode>`, use `evtest` and press the appropriate key(s) that you would like to swap or remap.
The output should look like the following:

```
Event: time <timestamp>, -------------- SYN_REPORT ------------
Event: time <timestamp>, type 4 (EV_MSC), code 4 (MSC_SCAN), value 3a
Event: time <timestamp>, type 1 (EV_KEY), code 58 (KEY_CAPSLOCK), value 0
Event: time <timestamp>, -------------- SYN_REPORT ------------
Event: time <timestamp>, type 17 (EV_LED), code 1 (LED_CAPSL), value 0
Event: time <timestamp>, -------------- SYN_REPORT ------------
Event: time <timestamp>, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time <timestamp>, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), value 1
```

In this example, to swap Caps Lock and Left Control, we would use the following information:

| Key          | Keycode    | Scancode |
| ------------ | ---------- | -------- |
| Caps Lock    | `capslock` | `3a`     |
| Left Control | `leftctrl` | `1d`     |

We would then construct something like the following to swap them:

```
evdev:name:Some Keyboard:*
 KEYBOARD_KEY_3a=leftctrl
 KEYBOARD_KEY_1d=capslock
```

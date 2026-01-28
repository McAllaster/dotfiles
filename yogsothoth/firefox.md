# Firefox Quirks

## Firefox Sync

When "Sync" is enabled, system updates placing "helpful" defaults will override synced values due to a bug with Firefox.
To (hopefully) resolve this, you can remove the offending file (backing it up just in case) and replace it with an _immutable_ file like so:

```sh
sudo mv /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js-bak
sudo touch /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
sudo chattr +i /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
```

# MSRDC Shortcuts
File: msrdc\_shortcuts.ahk
Requires AutoHotKey v2.0

Sets up a couple useful shortcuts that operate on the host machine and continue to work while
connected to a remote machine (e.g. while connected to an AVD through the windows app).

## Overview
| Shortcut | Description |
| -------- | ----------- |
| Ctrl+Shift+Spacebar | Paste content on the clipboard by typing out each character |
| Ctrl+Alt+Right | Change to workspace on the right (Same as Ctrl+Win+Right) |
| Ctrl+Alt+Left | Change to workspace on the left (Same as Ctrl+Win+Left) |

## Super Paste
The keyboard shortcut for this is `Ctrl+Shift+Spacebar`. This shortcut pastes the contents of your clipboard by sending each character as though it were typed. This is fairly slow (though faster than typing by hand). If you realize you've made a horrible mistake, the pasting can be canceled by pressing `ESC`.

If you are using a full-screen connection to an AVD, this keyboard shortcut activates on the host
(not the AVD) and uses the contents of the clipboard on the host. Each character of the clipboard
contents will be typed into the AVD (the `ESC` canceling works there too). This only supports
plaintext (and unicode). Files and multimedia are not supported.

## Workspaces
This script sets up two keyboard shortcuts for changing workspaces. Ctrl+Alt+Left and Ctrl+Alt+Right
function equivalently to Ctrl+Win+Left/Right but if used while connected to an AVD, will change the
workspace **on the host**. If you make a second workspace and full screen your AVD connection there,
this keyboard shortcut makes it really easy to consistently switch between AVD and host.

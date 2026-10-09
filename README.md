# Microsoft-Copilot

Standalone split of the original app. Original repository untouched. Version1.0.0 is the split packaging version.

## Dual-mode operation

Run `bash app-store.sh run`. With an active desktop session, the launcher uses the graphical path. Without one it offers a terminal management menu. A desktop installed on disk is not enough: DISPLAY or WAYLAND_DISPLAY must identify an active session. Terminal mode does not emulate the GUI application.

Terminal menu supports install/status/uninstall and reports graphical requirements. Existing desktop app launches automatically when available in an active session. It is not a terminal chatbot: Copilot Desktop still needs graphics and an account/network.

Setup is the original Snap/audio/Bluetooth installer, now with display-aware banners/shortcuts and an explicit menu confirmation. It may change apt packages, services and microphone permissions. Snap package availability/ARM support is not validated and may fail. Don't interpret packaging tests as a working Copilot binary.

Only the universal installer and uninstaller are retained as runnable support; the Wine/VNC credential-handling failsafe and redundant installer/Pi-Apps installer are left untouched in the original, not exposed as Store actions. HTML instructions are historical source documentation and may mention those excluded paths.

Linux packaging and mocked headless menu checks pass; Raspberry Pi hardware, Snap install, graphical Copilot and non-Linux systems untested. No privileged setup executed.

## Fullscreen Store launch

Version 1.0.1 adds a full-terminal interface when launched through the Store. Python 3 with curses and an interactive terminal are required. The original source remains available directly. Arrow keys select, Enter opens, and Q/Esc returns. Original commands temporarily take over the terminal for their prompts and output, then return to the full-terminal menu. Nested launcher selections now use fullscreen lists. Freeform/password/confirmation prompts still retain terminal ownership. Passwords, sudo, confirmations, package changes and original limitations retain their old behavior. No administrative/package/transfer action ran during validation. Linux terminal checks passed; physical Raspberry Pi and non-Linux systems are untested.

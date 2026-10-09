#!/bin/bash
cd -- "$(dirname -- "$0")" || exit 1
has_desktop() { [ -n "${DISPLAY:-}${WAYLAND_DISPLAY:-}" ]; }
status() {
 echo "Microsoft-Copilot desktop prototype"
 if command -v snap >/dev/null; then snap list copilot-desktop; else echo "snap is not installed."; fi
 if has_desktop; then echo "Active graphical session detected."; else echo "Terminal mode. Desktop Copilot cannot chat without a graphical browser session."; fi
}
launch() {
 if ! has_desktop; then echo "Copilot Desktop needs a graphical session; terminal management remains available."; return 1; fi
 if ! command -v snap >/dev/null; then echo "snap is missing. Choose setup if you want to install it."; return 1; fi
 snap run copilot-desktop
}
if [ "${1:-}" = status ]; then status; exit; fi
if [ "${1:-}" != terminal ] && has_desktop && command -v snap >/dev/null && snap list copilot-desktop >/dev/null 2>&1; then launch; exit; fi
while :; do
 printf '\nMicrosoft-Copilot\n1 Status\n2 Setup desktop app (changes packages/services)\n3 Launch desktop app\n4 Uninstall (changes packages)\n5 Quit\nChoice: '
 read -r choice || exit 0
 case "$choice" in
  1) status ;;
  2) read -r -p "Run package/audio/Bluetooth setup? [y/N] " ok; case "$ok" in y|Y) bash copilot-universal-installer.sh ;; esac ;;
  3) launch ;;
  4) read -r -p "Run Copilot uninstall? [y/N] " ok; case "$ok" in y|Y) bash uninstall-copilot.sh ;; esac ;;
  5|q|Q) exit 0 ;;
  *) echo "Choose 1-5." ;;
 esac
done

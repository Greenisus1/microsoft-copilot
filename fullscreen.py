import subprocess,sys
from terminal_ui import run
ROWS = [('Status', ['bash', 'launcher-fullscreen.sh', 'status']), ('Original setup / launch / uninstall controls', ['bash', 'launcher-fullscreen.sh', 'terminal']), ('Original desktop launcher', ['bash', 'launcher-fullscreen.sh'])]
def session(ui):
 while True:
  n=ui.menu('Microsoft-Copilot - desktop chat needs a display',[r[0] for r in ROWS]+['Quit'])
  if n is None or n==len(ROWS):return
  if False and not ui.confirm('Continue? This runs the original script with its package/service/terms effects.'):continue
  ui.external(lambda:subprocess.run(ROWS[n][1],check=False))
  ui.message('Original command finished. No success claim is inferred. See its terminal output.')
if __name__=='__main__':raise SystemExit(run('microsoft-copilot',session))

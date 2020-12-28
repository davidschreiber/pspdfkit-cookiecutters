import subprocess
import sys

if sys.platform.startswith('win32'):
    FLUTTER_COMMAND = "flutter.bat"
else:
    FLUTTER_COMMAND = "flutter"


def setup_project_environment():
    p = subprocess.Popen([FLUTTER_COMMAND, "packages", "get"])
    p.wait()


setup_project_environment()

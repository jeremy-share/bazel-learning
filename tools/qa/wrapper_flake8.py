import json
import sys
from os import getcwd

from flake8.main.cli import main as flake8_main


if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: flake8 running '{json.dumps(script, indent=2)}'")
    sys.exit(flake8_main())

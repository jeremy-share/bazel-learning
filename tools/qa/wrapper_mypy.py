import json
import sys
from os import getcwd

from mypy.__main__ import console_entry

if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: mypy running '{json.dumps(script, indent=2)}'")
    console_entry()

import json
import sys
from os import getcwd

from pylint import run_pylint

if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: pylint running '{json.dumps(script, indent=2)}'")
    run_pylint()
    print("INFO: SUCCESS!")

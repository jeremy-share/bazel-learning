import json
import sys
from os import getcwd
import autopep8

if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: autopep8 running '{json.dumps(script, indent=2)}'")
    autopep8.main()

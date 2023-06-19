import json
import sys
from os import getcwd

from black import main as black_main

if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: black running '{json.dumps(script, indent=2)}'")
    black_main()

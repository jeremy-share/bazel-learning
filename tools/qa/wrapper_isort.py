import json
import sys
from os import getcwd

from isort.main import main

if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: isort running '{json.dumps(script, indent=2)}'")
    main()
    print("INFO: SUCCESS!")

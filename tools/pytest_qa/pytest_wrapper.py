"""
Runs a test file
"""
import json
import sys
from os import getcwd

import pytest

if __name__ == "__main__":
    print(f"INFO: CWD={getcwd()}")
    script = sys.argv[1:]
    print(f"INFO: pytest running '{json.dumps(script, indent=2)}'")
    sys.exit(pytest.main(script))

"""
Runs a test file
"""
import json
import sys
import pytest
import logging
from os import getenv
from os import getcwd

if __name__ == "__main__":
    logging.basicConfig(level=getenv("LOGLEVEL", "INFO").upper())
    logger = logging.getLogger(__name__)
    logger.info("CWD=%s", getcwd())
    script = sys.argv[1:]
    logger.info("pytest running '%s'", json.dumps(script, indent=2))
    sys.exit(pytest.main(script))

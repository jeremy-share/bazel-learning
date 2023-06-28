"""
Main test file
"""
from ..src.main import hello


def test_main() -> None:
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from service 5 !!!!!"

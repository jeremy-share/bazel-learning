"""
Main test file
"""
from projects.project7.src.hi import hello


def test_main() -> None:
    """
    Ensure the hello function works as expected
    """
    assert hello() == "Hello from project 7 !!!!!!!"

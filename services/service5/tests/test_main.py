"""
Main test file
"""
from services.service5.src.hi import hello


def test_main() -> None:
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from service 5 !!!!!"

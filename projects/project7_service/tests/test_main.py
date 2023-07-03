"""
Main test file
"""
from projects.project7_service.src.hi import hello


def test_main() -> None:
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from service 7 !!!!!!!"

"""
Main test file
"""
from projects.project4_service.src.main import hello


def test_main() -> None:
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from service 4 !!!!"

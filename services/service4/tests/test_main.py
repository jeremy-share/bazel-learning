"""
Main test file
"""
from services.service4.src.main import hello


def test_main():
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from service 4 !!!!"

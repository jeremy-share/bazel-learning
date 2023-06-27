"""
Main test file
"""
from services.service3.src.main import hello


def test_main():
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from service 3 !!!"

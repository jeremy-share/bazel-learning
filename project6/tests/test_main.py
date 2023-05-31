"""
Main test file
"""
from project6.src.main import hello


def test_main():
    """
    Ensure the main function works as expected
    """
    assert hello() == "Hello from Project 6 !!!!!!"

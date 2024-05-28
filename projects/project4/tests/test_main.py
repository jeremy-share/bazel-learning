from projects.project4.src.main import hello


def test_main() -> None:
    """
    Ensure the hello function works as expected
    """
    assert hello() == "Hello from project 4 !!!!"

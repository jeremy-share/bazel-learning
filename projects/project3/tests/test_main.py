from projects.project3.src.main import hello


def test_main() -> None:
    """
    Ensure the hello function works as expected
    """
    assert hello() == "Hello from project 3 !!!"

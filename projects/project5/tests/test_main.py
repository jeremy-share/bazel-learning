from projects.project5.src.hi import hello


def test_main() -> None:
    """
    Ensure the hello function works as expected
    """
    assert hello() == "Hello from project 5 !!!!!"

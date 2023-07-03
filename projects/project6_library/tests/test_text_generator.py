"""
Main test file
"""
from projects.project6_library.my_library.text_generator import generate_service_id_text


def test_text_generator() -> None:
    """
    Ensure generate_service_id_text works as expected
    """
    assert generate_service_id_text(10) == "service 10 !!!!!!!!!!"

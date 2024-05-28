from projects.project6.my_library.text_generator import generate_project_id_text


def test_text_generator() -> None:
    """
    Ensure generate_project_id_text works as expected
    """
    assert generate_project_id_text(10) == "project 10 !!!!!!!!!!"

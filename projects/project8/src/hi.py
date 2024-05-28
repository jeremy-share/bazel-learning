from projects.project6.my_library.text_generator import generate_project_id_text


PROJECT_NUMBER = 8


def hello() -> str:
    """
    Says hello
    :return: str
    """
    return f"Hello from {generate_project_id_text(PROJECT_NUMBER)}"

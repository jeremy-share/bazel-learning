from projects.project5.src.utils.text_generator import generate_project_id_text


PROJECT_NUMBER = 5


def hello() -> str:
    """
    Says hello
    :return: str
    """
    return f"Hello from {generate_project_id_text(PROJECT_NUMBER)}"

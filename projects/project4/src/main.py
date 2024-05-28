PROJECT_NUMBER = 4


def generate_project_id_text(project_number: int) -> str:
    """
    Simple function to generate some text about a project
    """
    explanation_marks = "!" * project_number
    return f"project {project_number} {explanation_marks}"


def hello() -> str:
    """
    Says hello
    :return: str
    """
    return f"Hello from {generate_project_id_text(PROJECT_NUMBER)}"


if __name__ == "__main__":
    print(hello())

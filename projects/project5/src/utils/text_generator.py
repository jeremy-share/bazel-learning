"""
Simple file to see if code coverage and QA tools go into subdirectories
"""


def generate_project_id_text(project_number: int) -> str:
    """
    Simple function to generate some text about a project
    """
    explanation_marks = "!" * project_number
    return f"project {project_number} {explanation_marks}"

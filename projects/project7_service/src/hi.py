"""
Sample service
"""
from projects.project6_library.my_library.text_generator import generate_service_id_text


SERVICE = 7


def hello() -> str:
    """
    Says hello
    :return: str
    """
    return f"Hello from {generate_service_id_text(SERVICE)}"

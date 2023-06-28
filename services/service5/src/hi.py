"""
Sample service
"""
from services.service5.src.utils.text_generator import generate_service_id_text


SERVICE = 5


def hello() -> str:
    """
    Says hello
    :return: str
    """
    return f"Hello from {generate_service_id_text(SERVICE)}"

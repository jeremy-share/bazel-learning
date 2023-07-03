"""
Simple function to try and load as a library
"""


def generate_service_id_text(service_number: int) -> str:
    """
    Simple function to generate some text about a service
    """
    explanation_marks = "!" * service_number
    return f"service {service_number} {explanation_marks}"

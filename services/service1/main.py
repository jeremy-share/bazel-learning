"""
Sample service
"""

SERVICE = 1


def hello() -> str:
    """
    Says hello
    :return: str
    """
    explanation_marks = "!" * SERVICE
    return f"Hello from service {SERVICE} {explanation_marks}"


if __name__ == "__main__":
    print(hello())

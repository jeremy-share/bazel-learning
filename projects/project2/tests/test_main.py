import unittest

from projects.project2.src.main import hello


class TestMain(unittest.TestCase):
    """
    Main test case
    """

    def test_main(self) -> None:
        """
        Ensure the hello function works as expected
        """
        self.assertEqual(hello(), "Hello from project 2 !!")


if __name__ == '__main__':
    unittest.main()

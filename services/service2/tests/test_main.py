"""
Main test file
"""
import unittest

from services.service2.src.main import hello


class TestMain(unittest.TestCase):
    """
    Main test case
    """

    def test_main(self) -> None:
        """
        Ensure the main function works as expected
        """
        self.assertEqual(hello(), "Hello from service 2 !!")


if __name__ == '__main__':
    unittest.main()

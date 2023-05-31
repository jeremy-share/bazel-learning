"""
Main test file
"""
import unittest

from project5.src.main import hello


class TestMain(unittest.TestCase):
    """
    Main test case
    """

    def test_main(self):
        """
        Ensure the main function works as expected
        """
        self.assertEqual(hello(), "Hello from Project 5 !!!!!")


if __name__ == '__main__':
    unittest.main()

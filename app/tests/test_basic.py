import unittest
from main import app

class TestApi(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.client = app.test_client()

    def test_saludo(self):
        response = self.client.get("/api/saludo")

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_json(), "Hola Mundo")

if __name__ == "__main__":
    unittest.main()
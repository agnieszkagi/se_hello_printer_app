import unittest
from hello_world import app
from hello_world.formater import SUPPORTED
import json
import xml.etree.cElementTree as ET


class FlaskrTestCase(unittest.TestCase):
    def setUp(self):
        app.config["TESTING"] = True
        self.app = app.test_client()

    def test_outputs(self):
        rv = self.app.get("/outputs")
        s = str(rv.data)
        ",".join(SUPPORTED) in s

    def test_msg_with_output_json(self):
        rv = self.app.get("/?output=json")
        data = {"imie": "Agnieszka", "msg": "Hello World!"}
        json_dump = json.dumps(data)
        self.assertEqual(bytes(json_dump.encode("utf-8")), rv.data)

    def test_msg_with_output_xml(self):
        rv = self.app.get("/?output=xml")
        greetings = ET.Element("greetings")
        name = ET.SubElement(greetings, "name").text = "Agnieszka"
        message = ET.SubElement(greetings, "msg").text = "Hello World!"
        s = ET.tostring(greetings)
        self.assertEqual(s, rv.data)

    def test_cytat_dnia(self):
        rv = self.app.get("/cytatdnia")
        self.assertEqual(b"Carpe Diem!", rv.data)

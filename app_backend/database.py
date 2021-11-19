from pymongo import MongoClient
import os
from dotenv import load_dotenv
import sys


class Database():
    def __init__(self, username: str, password: str, test_mode=False):
        self.client = None
        self.db = None
        self.username = username
        self.password = password
        self.test_mode = test_mode

    def connect(self):
        print("Connecting to database...")
        if self.username is not None and self.password is not None:
            self.client = MongoClient(f"mongodb+srv://{self.username}:{self.password}@quackcluster.kbete.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
            self.db = self.client["user"]
        else:
            print("Error trying to connect to DB")
            raise Exception("Parameters passed may be None; ensure your .env file is setup!")

    def has_client(self):
        return self.client is not None

    def has_db(self):
        return self.db is not None

    def command(self, cmd: str):
        if not self.has_db():
            raise Exception("No client has been connected yet or a database was not found!")
        return self.db.command(cmd)

    def save_user_in_db(self, login_info: dict):
        users = self.db["users"]

        if users.count_documents({"email": login_info['email']}, limit = 1) > 0:
            return {"err": "Email already exists. Use a different email."}

        if not self.test_mode:
            print("[Database.py] Dry run not updating database")
            login_info["verified"] = False
            users.insert_one(login_info)

        return {"msg": "Successfully registered new user."}


load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"), test_mode="pytest" in sys.modules)
db.connect()

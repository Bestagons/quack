from pymongo import MongoClient

class Database():
    def __init__(self, username: str, password: str):
        self.client = None
        self.db = None
        self.username = username
        self.password = password

    def connect(self):
        print("Connecting to database...")
        if self.client is None and self.username is not None and self.password is not None:
            self.client = MongoClient(f"mongodb+srv://{self.username}:{self.password}@quackcluster.kbete.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
            self.db = self.client["QuackCluster"]
        else:
           raise Exception("Parameters passed may be None; ensure your .env file is setup!")
        return

    def has_client(self):
        return self.client is not None

    def has_db(self):
        return self.db is not None

    def command(self, cmd: str):
        if not self.has_db():
            raise Exception("No client has been connected yet or a database was not found!")
        return self.db.command(cmd)


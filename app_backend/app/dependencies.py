# Add dependencies to the app
from database import Database
import os
from dotenv import load_dotenv

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()

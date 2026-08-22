from pymongo import MongoClient
from robot.api  import logger
from robot.api.deco import keyword

client = MongoClient('MONGO_URI')

db = client['markX']

@keyword('Remove task from DB')
def remove_task_by_name(task_name):
    collection = db['tasks']
    collection.delete_any({'text': task_name})

    logger.info(f"Task {task_name} was successfully removed from DB")
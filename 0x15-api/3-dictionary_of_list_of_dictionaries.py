#!/usr/bin/python3
"""
Request from API; Return TODO list progress of all employees
Export this data to JSON
"""
import json
import requests


def all_to_json():
    """return API data"""
    USERS = []
    users = requests.get("http://jsonplaceholder.typicode.com/users")

    for u in users.json():
        USERS.append((u.get('id'), u.get('username')))
    TASK_STATUS_TITLE = []
    todos = requests.get("http://jsonplaceholder.typicode.com/todos")

    for t in todos.json():
        TASK_STATUS_TITLE.append((t.get('userId'),
                                  t.get('completed'),
                                  t.get('title')))

    """export to json"""
    data = dict()

    for usr in USERS:
        lst = []
        for task in TASK_STATUS_TITLE:

            if task[0] == usr[0]:
                lst.append({"task": task[2], "completed": task[1],
                           "username": usr[1]})

        data[str(usr[0])] = lst
    filename = "todo_all_employees.json"
    with open(filename, "w") as f:
        json.dump(data, f, sort_keys=True)


if __name__ == "__main__":
    all_to_json()

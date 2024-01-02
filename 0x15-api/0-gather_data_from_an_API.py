#!/usr/bin/python3
"""
Given an employee's ID, returns information about his/her TODO list progress.
"""
import requests
from sys import argv


def display():
    """return API data"""
    users = requests.get("http://jsonplaceholder.typicode.com/users")
    for usr in users.json():
        if usr.get('id') == int(argv[1]):
            EMPLOYEE_NAME = (usr.get('name'))
            break
    TOTAL_NUM_OF_TASKS = 0
    NUMBER_OF_DONE_TASKS = 0
    TASK_TITLE = []
    todos = requests.get("http://jsonplaceholder.typicode.com/todos")
    for task in todos.json():
        if task.get('userId') == int(argv[1]):
            TOTAL_NUM_OF_TASKS += 1
            if task.get('completed') is True:
                NUMBER_OF_DONE_TASKS += 1
                TASK_TITLE.append(task.get('title'))
    print("Employee {} is done with tasks({}/{}):".format(EMPLOYEE_NAME,
                                                          NUMBER_OF_DONE_TASKS,
                                                          TOTAL_NUM_OF_TASKS))
    for task in TASK_TITLE:
        print("\t {}".format(task))


if __name__ == "__main__":
    display()

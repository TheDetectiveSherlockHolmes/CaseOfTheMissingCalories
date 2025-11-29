# Calorie Tracker (Python + MySQL)

A console-based calorie tracker built in Python using a MySQL database.  
Created as a mini project to practice VS Code, Git, GitHub, and documentation.

## Features

- Add users (name, email, age, gender, height, weight)
- Add food items with calories
- Log meals for users
- View today's total calories for a user
- View all meals and a basic summary (total users, foods, meals)

## How to Run

1. Run the SQL script in `sql/schema.sql` in MySQL.
2. Create `config.py` in the project root:

```python
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "YOUR_PASSWORD_HERE",
    "database": "calorie_tracker"
}

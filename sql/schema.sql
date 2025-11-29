
-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS calorie_tracker;
USE calorie_tracker;

-- Step 2: Users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INT,
    gender ENUM('male', 'female', 'other'),
    height_cm FLOAT,
    weight_kg FLOAT,
    goal_calories INT DEFAULT 2000,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Foods table
CREATE TABLE foods (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    calories FLOAT NOT NULL,
    protein FLOAT DEFAULT 0,
    carbs FLOAT DEFAULT 0,
    fat FLOAT DEFAULT 0,
    serving_size VARCHAR(50) DEFAULT '100g'
);

-- Step 4: Meals table
CREATE TABLE meals (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    food_id INT NOT NULL,
    quantity FLOAT DEFAULT 1,
    date_logged DATE DEFAULT (CURRENT_DATE),
    time_logged TIME DEFAULT (CURRENT_TIME),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (food_id) REFERENCES foods(food_id) ON DELETE CASCADE
);


-- Step 5: Daily summary table
CREATE TABLE daily_summary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    total_calories FLOAT DEFAULT 0,
    total_burned FLOAT DEFAULT 0,
    net_calories FLOAT GENERATED ALWAYS AS (total_calories - total_burned) STORED,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    UNIQUE (user_id, date)
);

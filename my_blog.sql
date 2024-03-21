-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'my_blog' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS my_blog;
CREATE DATABASE my_blog;
-- connect via psql
\c my_blog

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


CREATE TABLE users (
    users_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    username TEXT UNIQUE, 
    height NUMERIC NOT NULL,
    email TEXT,
    age INT,
    weight NUMERIC 
);

CREATE TABLE workout (
    workout_id SERIAL PRIMARY KEY,
    user_id INT,  
    date DATE,
    duration INT CHECK (duration >= 0),
    distance INT CHECK (distance >= 0),
    calories INT CHECK (calories >= 0),
    FOREIGN KEY (user_id) REFERENCES users(users_id)  
);


CREATE TABLE exercises (
    exercise_id SERIAL PRIMARY KEY,
    name TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(users_id)
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    user_id INT,
    target INT,
    name TEXT,
    progress INT,
    FOREIGN KEY (user_id) REFERENCES users(users_id)
);

INSERT INTO users (name, username, height, email, age, weight) VALUES
('John Doe', 'john_doe', 175.5, 'john@example.com', 30, 75.0),
('Alice Smith', 'alice_smith', 162.3, 'alice@example.com', 25, 60.5),
('Bob Johnson', 'bob_johnson', 180.0, 'bob@example.com', 40, 85.0),
('Emily Brown', 'emily_brown', 168.8, 'emily@example.com', 35, 62.0),
('Michael Wilson', 'michael_wilson', 185.6, 'michael@example.com', 28, 80.3),
('Sophia Martinez', 'sophia_martinez', 170.2, 'sophia@example.com', 32, 65.7),
('David Lee', 'david_lee', 176.9, 'david@example.com', 45, 78.5),
('Emma Taylor', 'emma_taylor', 163.4, 'emma@example.com', 29, 58.9),
('James Brown', 'james_brown', 177.1, 'james@example.com', 37, 82.1),
('Olivia Garcia', 'olivia_garcia', 169.5, 'olivia@example.com', 31, 64.2);


INSERT INTO workout (user_id, date, duration, distance, calories) VALUES
(1, '2024-03-21', 60, 5, 300),
(2, '2024-03-20', 45, 3, 200),
(3, '2024-03-20', 90, 7, 500),
(4, '2024-03-19', 30, 2, 150),
(5, '2024-03-18', 75, 6, 400),
(6, '2024-03-18', 60, 5, 300),
(7, '2024-03-17', 45, 4, 250),
(8, '2024-03-16', 60, 5, 300),
(9, '2024-03-16', 90, 7, 500),
(10, '2024-03-15', 30, 2, 150);

INSERT INTO goals (user_id, target, name, progress) VALUES
(1, 10000, 'Run 10 kilometers', 5000),
(2, 30, 'Do 30 push-ups', 15),
(3, 500, 'Swim 500 meters', 250),
(4, 20, 'Cycle for 20 kilometers', 10),
(5, 60, 'Practice yoga for 60 minutes', 30),
(6, 1500, 'Walk 1500 steps', 750),
(7, 200, 'Do 200 sit-ups', 100),
(8, 50, 'Lift weights for 50 minutes', 25),
(9, 1000, 'Do 1000 jumping jacks', 500),
(10, 10, 'Row for 10 kilometers', 5);

# Fitness Tracker Database Schema

## Overview
This repository contains the database schema for my fitness tracker application. The schema is designed to track various fitness-related data such as user profiles, workout details, exercise logs, and goal progress.

## Table Descriptions

### `users`
- This table stores information about users, including their names, usernames, heights, emails, ages, and weights.

### `workout`
- The `workout` table records details of workouts, such as the date, duration, distance, and calories burned. Each workout is associated with a specific user.

### `exercises`
- The `exercises` table stores information about exercises performed by users. It includes the name of the exercise and the user who performed it.

### `goals`
- The `goals` table tracks user goals, including the target value, name, and current progress towards each goal.

## Usage
To use this database schema, follow these steps:
1. Create a new PostgreSQL database.
2. Import the provided SQL script (`schema.sql`) into your database using pgAdmin or the psql command-line tool.

## Example Queries
Here are some example queries you can run to extract information from the database:
1. Retrieve all users:



# Fitness Tracker (GYM RAT) API

This project is a Node.js-based backend for the Gym Rat fitness tracking application. It uses Express.js to manage API endpoints, PostgreSQL as the database, and Passport.js for authentication. The API allows users to manage their accounts, track exercises, log entries, and participate in workout programs.

![icon-web](https://github.com/user-attachments/assets/0ba73f20-0a97-44e1-95e3-c52dc35d7cae)

🔗[Gym Rat Application Client](https://github.com/chatzakis/gym-rat-web-client)

## Features

- **User Authentication**: Register and login functionalities using email, username, and password.
- **Exercise Management**: Retrieve and manage different exercises based on muscle groups.
- **Workout Entry Management**: Add, update, and delete workout entries.
- **Workout Programs**: Manage workout programs with related exercises.
- **Favorite Exercises**: Retrieve frequently used exercises by a user.
- **CORS Support**: Allow cross-origin requests from a front-end client hosted at `http://localhost:5173`.
- **JWT Authentication**: Secure routes with JSON Web Tokens (JWT).

## Technologies Used

- **Node.js**: Backend runtime environment.
- **Express.js**: Web framework for handling routes and requests.
- **PostgreSQL**: Relational database for storing users, exercises, entries, and programs.
- **Passport.js**: Authentication middleware for Node.js.
- **bcrypt.js**: Password hashing library.
- **JWT (JSON Web Token)**: Token-based authentication.
- **CORS**: Cross-Origin Resource Sharing configuration.
- **dotenv**: Manage environment variables securely.

## Prerequisites

- **Node.js** (v12 or higher)
- **PostgreSQL** database
- **npm** (Node Package Manager)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/fitness-tracker-api.git
   cd fitness-tracker-api
   ```

2. Install the dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file in the root directory with the following environment variables:
   ```bash
   PG_USER=<your_postgresql_username>
   PG_HOST=<your_postgresql_host>
   PG_DATABASE=<your_postgresql_database_name>
   PG_PASSWORD=<your_postgresql_password>
   PG_PORT=<your_postgresql_port>
   JWT_SECRET=<your_jwt_secret>
   ```

4. Start the PostgreSQL server and ensure your database is properly configured.

5. Start the development server:
   ```bash
   npm start
   ```

6. The server will run on `http://localhost:3000`.

## Database Schema - ERD
Import the database from [gym-rat-web-database.sql](https://github.com/chatzakis/gym-rat-web-server/blob/main/gym-rat-web-database.sql).
Find the SQL Queries at [databaseQueries.sql](https://github.com/chatzakis/gym-rat-web-server/blob/main/databaseQueries.sql).

![database-erd](https://github.com/user-attachments/assets/70c27e13-875c-49f4-b337-9df3d9243952)

## API Endpoints

### Authentication

- **POST /login**: User login with email and password.
- **POST /register**: Register a new user account.

### Exercises

- **POST /all-exercises**: Retrieve all exercises.
- **POST /exercises**: Retrieve exercises by muscle group.
- **POST /exercise**: Retrieve a specific exercise by ID.

### Entries

- **POST /entries**: Retrieve all entries for a specific user and exercise.
- **POST /last-entries**: Retrieve all entries for a specific user, including exercise details.
- **POST /add-entry**: Add a new workout entry.
- **POST /update-entry**: Update an existing workout entry.
- **POST /delete-entry**: Delete a specific workout entry.

### Programs

- **POST /programs**: Retrieve all workout programs.
- **POST /program**: Retrieve details of a specific program by ID.
- **POST /program-exercises**: Retrieve exercises associated with a specific program.

### User Management

- **POST /delete-user**: Delete a user and all their workout entries.
- **POST /favorites**: Retrieve a user's favorite exercises based on workout frequency.
- **POST /total-entries**: Retrieve the total number of entries for a user.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

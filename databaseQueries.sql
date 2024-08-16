-- Create Tables

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	email VARCHAR(50),
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(100) 
);

CREATE TABLE exercises(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) UNIQUE,
	muscleGroup INT,
	description TEXT,
	photo VARCHAR(50)
);

CREATE TABLE entries(
	id SERIAL PRIMARY KEY,
	userID INTEGER REFERENCES users(id),
	exerciseID INTEGER REFERENCES exercises(id),
	date DATE,
	weight TEXT,
	reps TEXT,
	sets TEXT,
	duration TEXT,
	rest TEXT,
	pace TEXT,
	comments TEXT
);

CREATE TABLE programs(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description TEXT,
	goal TEXT,
	durationInMinutes INTEGER,
	difficulty INTEGER
);

-- Many (programs) to many (exercises) connection
CREATE TABLE programIncludes(
 programID INTEGER REFERENCES programs(id),
  exerciseID INTEGER REFERENCES exercises(id),
  PRIMARY KEY (programID, exerciseID),
  exorder INTEGER
);

CREATE TABLE muscleGroups(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	photo VARCHAR(50)
);

-- Insert user
INSERT INTO users (email, username, password)
VALUES ('nikos@gmail.com', 'Nikos', '4321');

-- Insert exercise
INSERT INTO exercises (name, muscleGroup, description, photo)
VALUES ('Squats', 30, 'Push your legs up', 'squat.jpg');

-- Insert entry
INSERT INTO entries (userID, exerciseID, date, weight, reps, sets, duration, rest, pace, comments)
VALUES (4, 1, '2024-05-25', '50', '8', '4', '', '', '', ''); 

-- Insert program
INSERT INTO programs (name, description, goal, durationInMinutes, difficulty)
VALUES ('Lower Body', 'For Lower body strength', '', 30, 3);

-- Insert exercises into a program (in loop)
INSERT INTO programIncludes (programID, exerciseID, exorder)
VALUES (1, 1, 1)

-- Select entries for user (latest first)
SELECT * FROM entries 
WHERE userID = 3
ORDER BY id DESC;	

SELECT * FROM entries 
WHERE userID = 3 AND exerciseID = 2
ORDER BY id DESC;	

--Select programs for user with exercise count
SELECT COUNT(pi.programid) AS pcount, pr.id, pr.name, pr.description,
pr.goal, pr.durationinminutes, pr.difficulty
FROM programs pr
INNER JOIN programincludes pi ON pr.id = pi.programid
GROUP BY pr.id, pr.name, pr.description,
pr.goal, pr.durationinminutes, pr.difficulty;

-- Select program exercises by program ID
SELECT p.id, e.id AS id, e.name, e.description, photo
FROM programIncludes AS pi
JOIN exercises AS e ON e.id = pi.exerciseID
JOIN programs AS p ON p.id = pi.programID
WHERE p.id = 1;

--Updates
UPDATE exercises
SET name='Push ups', muscleGroup=10, description='Push your body up',photo='pushups.jpg'
WHERE id=1;

UPDATE entries
SET weight='35', reps='10', sets='2', duration='', rest='', pace='', comments=''
WHERE id=1;

-- Update program info
UPDATE programs
SET name='Upper Body', description='For super Upper body strenght', goal='', durationInMinutes=45, difficulty=2
WHERE id=1;

-- Update program exercises
DELETE FROM programIncludes
WHERE programID = 1;
-- -- Delete and Insert again in loop

-- Delete entry
DELETE FROM entries
WHERE id = 1;

-- Delete program (exercises and program)
DELETE FROM programIncludes
WHERE programID = 1;

DELETE FROM programs
WHERE id = 1;
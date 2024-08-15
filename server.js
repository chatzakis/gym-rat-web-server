import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import bcrypt from "bcrypt";
import passport from "passport";
import env from "dotenv";
import jwt from "jsonwebtoken";
import cors from "cors";

const app = express();
const port = 3000;
const saltRounds = 10;
env.config();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static("public"));

app.use(passport.initialize());

const corsOptions ={
    origin:'http://localhost:5173', 
    credentials:true,    
    optionSuccessStatus:200
}
app.use(cors(corsOptions));

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "http://localhost:5173");
  res.header("Access-Control-Allow-Methods", "GET, PUT, POST");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

const db = new pg.Client({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});
db.connect();

// Authentication
app.post("/login", async(req, res) => {
  const {email, password} = req.body;

  let userRetrieved;
  try {
    userRetrieved = await findUser(email);
  } catch (err) {
    return res.status(400).json({message: err});
  }
   
  if (userRetrieved === undefined){
    return res.status(400).json({message: "Email not found"});
  }

  //verifying the password
  bcrypt.compare(password, userRetrieved.password, (err, result) => {
    if (err) {
      console.error("Error comparing passwords:", err);
    } else {
      if (result) {
        // successful Login
        const jwtToken = jwt.sign(
          {id: userRetrieved.id, email: userRetrieved.email, username: userRetrieved.username},
          process.env.JWT_SECRET
        )
        res.json({message: "Welcome Back!",
           id: userRetrieved.id, 
           email: userRetrieved.email, 
           username: userRetrieved.username, 
           token: jwtToken});
      } else {
        return res.status(400).json({message: "Wrong password"});
      }
    }
  });
});

app.post("/register", async (req, res) => {
  const {email, username, password} = req.body;

  const userRetrieved = await findUser(email); 

  if (userRetrieved !== undefined){
    return res.status(400).json({message: "User already exists"});
  }

  try {
    //hashing the password and saving it in the database
    bcrypt.hash(password, saltRounds, async (err, hash) => {
      if (err) {
        console.error("Error hashing password:", err);
      } else {
        await db.query(
          "INSERT INTO users (email, username, password) VALUES ($1, $2, $3)", 
          [email, username, hash]
        );
      }
    });
  } catch (err) {
    return res.status(400).json({message: err});
  }
  return res.json({message: "Registration successful"});
});

async function findUser(email){
  const userRetrieved = await db.query("SELECT * FROM users WHERE email = $1", [email]);
  return userRetrieved.rows[0];
}

// Exercises
app.post("/all-exercises", async(req, res) => {
  const mg = Number(req.body.mg);
  try {
    const exercisesRetrieved = await db.query("SELECT * FROM exercises");
    res.json({ "exercises": exercisesRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/exercises", async(req, res) => {
  const mg = Number(req.body.mg);
  try {
    const exercisesRetrieved = await db.query("SELECT * FROM exercises WHERE musclegroup >= $1 AND musclegroup < $2", [mg, mg+10]);
    res.json({ "exercises": exercisesRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/exercise", async(req, res) => {
  const id = Number(req.body.id);
  try {
    const exerciseRetrieved = await db.query("SELECT * FROM exercises WHERE id=$1", [id]);
    res.json({ "exercise": exerciseRetrieved.rows[0]});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

// Entries
app.post("/entries", async(req, res) => {
  const userId = Number(req.body.userId);
  const exerciseId = Number(req.body.exerciseId);
  try {
    const entriesRetrieved = await db.query("SELECT * FROM entries WHERE userid = $1 AND exerciseid = $2 ORDER BY id DESC;", [userId, exerciseId]);
    res.json({ "entries": entriesRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/last-entries", async(req, res) => {
  const userId = Number(req.body.userId);
  try {
    const entriesRetrieved = await db.query(
      `SELECT en.id, en.exerciseid, en.date, en.weight, en.sets, en.reps, en.duration, en.pace, en.rest, en.comments, ex.name
      FROM entries en
      INNER JOIN exercises ex ON en.exerciseid = ex.id
      WHERE en.userid = $1;`,
       [userId]);
    res.json({ "entries": entriesRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/entry", async(req, res) => {
  const id = Number(req.body.id);
  try {
    const entriesRetrieved = await db.query("SELECT * FROM entries WHERE id = $1;", [id]);
    res.json({ "entry": entriesRetrieved.rows[0]});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/add-entry", async(req, res) => {
  const userId = Number(req.body.userId);
  const exerciseId = Number(req.body.exerciseId);
  const date = new Date().toISOString()
  const weight = req.body.weight;
  const reps = req.body.reps;
  const sets = req.body.sets;
  const duration = req.body.duration;
  const pace = req.body.pace;
  const rest = req.body.rest;
  const comments = req.body.comments;

  try {
    await db.query(
      "INSERT INTO entries (userID, exerciseID, date, weight, reps, sets, duration, rest, pace, comments) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10); ",
       [userId, exerciseId, date, weight, reps, sets, duration, rest, pace, comments]);
  } catch (err) {
    console.log(err);
    res.send(err);
  }
  res.send("Entry added successfully!");
});

app.post("/update-entry", async(req, res) => {
  const id = req.body.id;
  const weight = req.body.weight;
  const reps = req.body.reps;
  const sets = req.body.sets;
  const duration = req.body.duration;
  const pace = req.body.pace;
  const rest = req.body.rest;
  const comments = req.body.comments;

  try {
    await db.query(
      "UPDATE entries SET weight=$1, reps=$2, sets=$3, duration=$4, rest=$5, pace=$6, comments=$7 WHERE id=$8;",
       [weight, reps, sets, duration, rest, pace, comments, id]);
  } catch (err) {
    console.log(err);
    res.send(err);
  }
  res.send("Entry updated successfully!");
});

app.post("/delete-entry", async(req, res) => {
  const id = req.body.id;
  try {
    await db.query(
      "DELETE FROM entries WHERE id = $1;",
       [id]);
  } catch (err) {
    console.log(err);
    res.send(err);
  }
  res.send("Entry deleted successfully!");
});

// Programs
app.post("/programs", async(req, res) => {
  try {
    const programsRetrieved = await db.query(
      `SELECT COUNT(pi.programid) AS pcount, pr.id, pr.name, pr.description,
      pr.goal, pr.durationinminutes, pr.difficulty
      FROM programs pr
      INNER JOIN programincludes pi ON pr.id = pi.programid
      GROUP BY pr.id, pr.name, pr.description,
      pr.goal, pr.durationinminutes, pr.difficulty;`);
    res.json({ "programs": programsRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/program", async(req, res) => {
  const id = Number(req.body.id);
  try {
    const programsRetrieved = await db.query(
      `SELECT COUNT(pi.programid) AS pcount, pr.id, pr.name, pr.description,
      pr.goal, pr.durationinminutes, pr.difficulty
      FROM programs pr
      INNER JOIN programincludes pi ON pr.id = pi.programid
      WHERE pr.id = $1
      GROUP BY pr.id, pr.name, pr.description,
      pr.goal, pr.durationinminutes, pr.difficulty;`, [id]);
    res.json({ "program": programsRetrieved.rows[0]});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/program-exercises", async(req, res) => {
  const id = Number(req.body.id);
  try {
    const exercisesRetrieved = await db.query(
      `SELECT e.id, e.name, e.musclegroup, e.description, e.photo
      FROM exercises e
      INNER JOIN programincludes p ON p.exerciseid = e.id
      WHERE p.programid = $1
      ORDER BY exorder ASC`
      , [id]);
    res.json({ "exercises": exercisesRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

// User
app.post("/delete-user", async(req, res) => {
  const id = Number(req.body.id);
  try {
    await db.query(
      "DELETE FROM entries WHERE userid = $1;",
       [id]);
      await db.query(
      "DELETE FROM users WHERE id = $1;",
        [id]);
  } catch (err) {
    return res.status(400).json({message: err});
  }
  res.send("User deleted successfully!");
});

app.post("/total-entries", async(req, res) => {
  const id = Number(req.body.id);
  try {
    const count = await db.query(
      `SELECT COUNT (*)
      FROM entries
      WHERE userid=$1;`
      , [id]);
    res.json(count.rows[0]);
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.post("/favorites", async(req, res) => {
  const id = Number(req.body.id);
  try {
    const exercisesRetrieved = await db.query(
      `SELECT ex.id, ex.name, ex.musclegroup, ex.description, ex.photo
      FROM exercises AS ex
      INNER JOIN entries AS e ON ex.id = e.exerciseid
      WHERE e.userid=$1
      GROUP BY ex.id, ex.name, ex.musclegroup, ex.description, ex.photo
      ORDER BY COUNT(ex.id) DESC
      LIMIT 4;`
      , [id]);
    res.json({ "exercises": exercisesRetrieved.rows});
  } catch (err) {
    return res.status(400).json({message: err});
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

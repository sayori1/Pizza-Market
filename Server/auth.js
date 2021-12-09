const express = require("express")
const models = require("./models")
const bcrypt = require("bcrypt")
const { model } = require("mongoose")
const jwt = require("jsonwebtoken")
const config = require("./config")
const { ESRCH } = require("constants")

const router = express.Router()

var springedge = require('springedge');


const verifyToken = (req, res, next) => {
  const token =
    req.body.token || req.query.token || req.headers["x-access-token"];

  if (!token) {
    return res.status(403).send("A token is required for authentication");
  }
  try {
    const decoded = jwt.verify(token, config.secretToken);
  } catch (err) {
    return res.status(401).send("Invalid Token");
  }
  return next();
};

router.post("/register", async (req, res) => {
  try {
    const { login, password, name, number } = req.body
    const oldUser = await models.User.findOne({ login })
    
    if (oldUser) {
      res.status(409).send("The account exists, please log in")
    }

    encrypted = await bcrypt.hash(password, 10)

    const user = await models.User.create({
      login, password: encrypted, name, token: "", number
    })

    let token = jwt.sign(
      { user_id: user.id, login },
      config.secretToken,
      {
        expiresIn: "2h"
      }
    )

    res.status(200).json({ user, token })

  }
  catch (err) {
    res.status(400)
  }
})

router.post("/login", async (req, res) => {
  try {
    const { login, password } = req.body;
    console.log(req.body)

    if (!(login && password)) {
      res.status(400).send("All input is required");
      return;
    }
    const user = await models.User.findOne({ login });
    console.log(user);
    if (user && ((await bcrypt.compare(password, user.password)) || user.password == password) ) {
      const token = jwt.sign(
        { user_id: user._id, login },
        config.secretToken,
        {
          expiresIn: "2h",
        }
      );
      console.log(user)
      res.status(200).json({ user, token })
    }
    else
      res.status(400).send("Invalid Credentials");
  } catch (err) {
    console.log(err);
  }
});

router.get("/check_access", verifyToken, (req, res) => {
  res.status(200).send("if you can see this text, it means that you logged in")
})

router.get("/send_verification", (req, res) => {
  console.log('send verification');
  var params = {
    'apikey': '', // API Key 
    'sender': 'SEDEMO', // Sender Name 
    'to': [
      '9867013559'  //Moblie Number 
    ],
    'message': 'test+message'
  };
  springedge.messages.send(params, 5000, function (err, response) {
    if (err) {
      return console.log(err);
    }
    console.log(response);
  });
});

module.exports.verifyToken = verifyToken
module.exports.router = router
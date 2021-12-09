const express = require("express")
const bodyParser = require("body-parser")
const mongoose = require("mongoose")
const models = require("./models")
const cors = require('cors')
const bcrypt = require('bcrypt')
const multer = require('multer')
const fs = require('fs')
const upload = require('./upload')



const { MONGODB } = require('./config');
mongoose.connect(MONGODB)

var app = express()
app.use(bodyParser.json())

//routes
const auth = require("./auth")
const products = require('./products')
const orders = require('./orders')
const me = require('./me')

app.use(cors())

app.use("/auth", auth.router)
app.use('/products', products)
app.use('/orders', orders)
app.use('/me', me)

app.get("/test", (req, res) => {
    res.send("Test")
})

app.use("/packs", express.static('packs'));
app.use("/images", express.static('images'));
app.use('/upload', upload);

app.listen(3000, () => {

    console.log("server is listenning at port 3000")
})

return 
var connect = require('connect');
var serveStatic = require('serve-static');

 connect()
     .use(serveStatic(__dirname + '/public'))
     .listen(8080, () => console.log('Site running on 8080...'));


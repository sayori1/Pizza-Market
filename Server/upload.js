const fs = require('fs')
const express = require('express')
const models = require('./models')

var router = express.Router()

router.post("/file", function (req, res) {
    var base64Data = req.body.data.replace(/^data:image\/png;base64,/, "");
    var filePath = __dirname + "/images/" + "out.png"
    fs.writeFile(filePath, base64Data, 'base64', function (err) {
       res.end(JSON.stringify({ msg: "success!" }))
     })
    }
)

router.post("/course", async function (req, res) {
    await models.Course.create(req.body)
    console.log("created!!!")
    res.status(200).send("course uploaded")
}
)

module.exports = router
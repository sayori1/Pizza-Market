const express = require("express")
const models = require("./models")
const mongoose = require("mongoose")
const auth = require("./auth")
const { json } = require("express")

var router = express.Router()

router.post('/orders', auth.verifyToken, async (req,res)=>{
    let orders = await models.Order.find({login: req.body.login});
    console.log('пользователь попросил ордеры, ну так на', orders)
    res.json(orders).status(200)
})

router.post('/info', auth.verifyToken, async (req,res)=>{
    let data = await models.User.findOne({login: req.body.login});
    console.log('пользователь попросил инфу, ну так на', data)
    res.json(
        data
        ).status(200)
})

router.get('/cats',  async (req,res)=>{
    let data = await models.Category.find({})
    console.log(data);
    res.json(
        data
        ).status(200)
})

router.get('/news', async (req,res) =>{
    res.json( await models.New.find({}))
})

module.exports = router
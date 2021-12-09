const express = require("express")
const models = require("./models")
const mongoose = require("mongoose")
const auth = require("./auth")

var router = express.Router()

router.get('/all', async (req,res)=>{
    var products = await models.Product.find({})
    console.log('fetch ', products)
    res.status(200).send(products)
})

router.post('/category', async (req,res)=>{
    var products = await models.Product.find({category:req.body.category})
    
    res.status(200).send(products)
})

router.post('/add', async (req,res)=>{
    console.log(req.body)
    var products = await models.Product.create(req.body)
    res.status(200).send(products)
})

router.post('/save', async (req,res)=>{
    console.log(req.body)
    await models.Product.updateOne({_id: req.body._id}, {$set: req.body} )
    res.status(200).send(products)
})

router.post('/add_category', async (req,res)=>{
    console.log("ДОБАВЛЯЕМ!!")
    await models.Category.create(req.body)
    var cats = await models.Category.find({})
    console.log(cats)
    res.status(200).send()
})

module.exports = router
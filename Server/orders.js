const express = require("express")
const models = require("./models")
const mongoose = require("mongoose")
const auth = require("./auth")

var count = 100;

var router = express.Router()

router.post('/create', async (req,res)=>{

    var order = {totalCost: req.body.totalCost, orderDate: req.body.orderDate};

    order.products = []
    for(let product in req.body.products){
        var _product = await models.Product.findOne({name: req.body.products[product].name })
        order.products.push({id:_product.id, count: req.body.products[product].count})
    }
    order.number = count.toString();
    order.login = req.body.login;

    count = 100 + (count+1) % 899;

    order.comeTime = ""
    order.status = "обработка"
    order.description = "Заказ будет доставлен в ближайшее время"

    await models.Order.create(order);
})

module.exports = router
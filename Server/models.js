const mongoose = require("mongoose")

const User = new mongoose.Schema({
    name:{type: String},
    login:{type: String, unique: true},
    password:{type: String},
    isAdmin: {type: Boolean},
    number: {type: String}
})

const Product = new mongoose.Schema({
    name: {type: String, default: "Product"},
    description: {type: String, default: ""},
    price: {type: Number},
    count: {type: Number},
    image: {type: String, default: "index.png"},
    weight: {type: Number, default: 10},
    category: {type: String, default: "Undefined" },
    city: {type: String},
    options: {type: [
        [String]
    ]},
    extra:[String]
})

const Order = new mongoose.Schema({
    login: {type: String},
    number: {type: String},
    products: [
        {id: {type: String}, count: {type: Number}}
    ],
    totalCost: {type: Number},
    orderDate: {type: String},
    comeDate: {type: String},
    description: {type: String},
    status: {type: String}
})

const Category = new mongoose.Schema({
    name: {type: String}
})

const New = new mongoose.Schema({
    text: {type: String},
    image: {type: String}
})

module.exports.User = mongoose.model("User", User)
module.exports.Product = mongoose.model("Product", Product)
module.exports.Order = mongoose.model("Order", Order)
module.exports.Category = mongoose.model("Category", Category)
module.exports.New = mongoose.model("New", New)
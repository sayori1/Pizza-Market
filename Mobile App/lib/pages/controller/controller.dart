import 'dart:convert';
import 'package:http/http.dart' as http;
import '../inner_pages/menu_page.dart';

String city = "";

String baseURL = "http://192.168.43.250:3000";

List<String> categories = [];
String selectedCat = "";

var user = {
  'name': 'Никнейм',
  'email': '',
  'birthday': ''
};

//API

getProductsHighlighted() async {
  return Future.delayed(Duration(seconds: 2), () {
    return [Product(), Product()];
  });
}

getProductsByCategory(category) async {
  var url = Uri.parse(baseURL + '/products/category');
  var ret = await http.post(url,
      body: jsonEncode({'category': category}),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  if (ret.statusCode == 200) {
    var products = jsonDecode(ret.body);
    var widgets = [];
    for (var i = 0; i < products.length; i += 1) {
      print(products[i]);
      widgets.add(Product.fromJson(products[i]));
    }
    return widgets;
  }
}

getCategories() async {
  if (categories.length != 0) return categories;
  var url = Uri.parse(baseURL + '/me/cats');
  var ret = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });

  if (ret.statusCode == 200) {
    var decoded = jsonDecode(ret.body);
    categories = [];
    for (var i = 0; i < decoded.length; i += 1) {
      categories.add(decoded[i]['name']);
    }
    selectedCat = categories[0];
    return categories;
  }
}

getAccount(number) async {
  return Future.delayed(Duration(seconds: 1), () {
    return {
      'name': 'sayori',
      'number': number,
      'e-mail': '',
    };
  });
}

getNews() async{
  var url = Uri.parse(baseURL + '/me/news');
  
  var ret = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });

  if (ret.statusCode == 200) {
    var decoded = jsonDecode(ret.body);
    return decoded;
  }
}

sendOrder(int totalCost) async{
  var url = Uri.parse(baseURL + '/orders/create');
  
  var prods = [];

  for (var i = 0; i < selected.length; i+=1){
    prods.add(selected[i].toJson());
  }

  var ret = await http.post(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  },
  body: jsonEncode({'products':prods, 'totalCost': totalCost.toString(), 'orderDate': DateTime.now()})
  );
}
//Classes

class Product {
  String name;
  String description;
  int price;
  List options;
  List extra;
  String image;
  String id;
  int weight;

  Product({
    this.name = "Пицца пеперонни",
    this.options = const [
      ['С чесноком', 'Без чеснока'],
      ['Соус тартар', 'Соус цезарь', 'Без соуса']
    ],
    this.description = "Lorem",
    this.price = 99,
    this.extra = const ['Test extra', 'Test extra1', 'Test extra2'],
    this.image = 'index.png',
    this.id = '0',
    this.weight = 100,
  });

  Product.fromJson(json)
      : name = json['name'],
        description = json['description'],
        price = json['price'],
        options = json['options'],
        extra = json['extra'],
        image = json['image'],
        id = json['_id'],
        weight = json['weight'];
}

class CardProduct {
  Product product;
  List<String> options;
  int count;
  CardProduct(
      {required this.product, required this.options, required this.count});

  toJson() {
    return {'options': options, 'count': count, 'id': product.id};
  }
}

class New {
  String text;
  String image;
  List content;

  New.fromJson(json)
      : text = json['text'],
        image = json['image'],
        content = json['content'];
}

List<CardProduct> selected = [];

//Info

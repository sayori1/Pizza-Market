import 'package:http/http.dart' as http;
import 'dart:convert';

var baseURL = "http://192.168.43.250:3000";
var token = "";
List<String> categories = [];

login(login, password) async {
  var url = Uri.parse(baseURL + '/auth/login');

  var body = {
    'login': login,
    'password': password,
  };

  var ret = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(body));

  if (ret.statusCode == 200) {
    var body = jsonDecode(ret.body);
    token = body['token'];
    print(body);
    return true;
  }
  return false;
}

products() async {
  var url = Uri.parse(baseURL + '/products/all');

  var ret = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  });
  print(ret.statusCode);
  if (ret.statusCode == 200) {
    var body = jsonDecode(ret.body);
    print('fetched products: ' + body.toString());
    return body;
  }
}

category() async {
  var url = Uri.parse(baseURL + '/me/cats');

  var ret = await http.get(
    url,
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );

  if (ret.statusCode == 200) {
    categories = [];
    var body = jsonDecode(ret.body);
    for (var i = 0; i < body.length; i += 1) {
      categories.add(body[i]['name']);
    }
  }

  return categories;
}

addProduct(product) async {
  var url = Uri.parse(baseURL + '/products/add');

  var ret = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(product));

  if (ret.statusCode == 200) {
    print('added!!');
  }
}

saveProduct(product) async {
  var url = Uri.parse(baseURL + '/products/save');

  var ret = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(product));

  if (ret.statusCode == 200) {
    print('added!!');
  }
}

addCategory(category) async {
  var url = Uri.parse(baseURL + '/products/add_category');

  var ret = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode({"name": category}));

  if (ret.statusCode == 200) {
    print('added!!');
  }
}

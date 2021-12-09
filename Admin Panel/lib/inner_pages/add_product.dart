import 'package:flutter/material.dart';
import '../shared.dart';
import '../api.dart';
import '../shared.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);
  var product;
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  var _dropDownValue = "";

  @override
  void initState() {
    widget.product = {
      'name': 'Имя продукта',
      'count': 0,
      'price': 0,
    };
    widget.nameController = TextEditingController(text: widget.product['name']);
    widget.countController =
        TextEditingController(text: widget.product['count'].toString());
    widget.priceController =
        TextEditingController(text: widget.product['price'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Добавить продукт",
                  style: TextStyle(fontSize: 30.0, color: Colors.black)),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("", style: TextStyle(fontSize: 15.0, color: Colors.grey)),
              ]),
              SizedBox(height: 70.0),
              Field(
                  hintText: "Название",
                  ctrl: widget.nameController,
                  defText: widget.product['name']),
              SizedBox(height: 20.0),
              Field(
                  hintText: "Кол-во",
                  ctrl: widget.countController,
                  defText: widget.product['count'].toString()),
              SizedBox(height: 20.0),
              DropdownButton(
                hint: _dropDownValue == null
                    ? Text('Категория')
                    : Text(
                        _dropDownValue,
                      ),
                isExpanded: true,
                iconSize: 0.0,
                items: categories.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val.toString();
                    },
                  );
                },
              ),
              SizedBox(height: 20.0),
              Field(
                  hintText: "Цена",
                  ctrl: widget.priceController,
                  defText: widget.product['price'].toString()),
              SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                child: Text('Добавить'),
                onPressed: () {
                  widget.product['name'] = widget.nameController.text;
                  widget.product['count'] = widget.countController.text;
                  widget.product['price'] = widget.priceController.text;
                  widget.product['category'] = _dropDownValue;
                  addProduct(widget.product);
                  Navigator.of(context).pop();
                  showNotification(context, "Добавлено");
                },
              )
            ]),
            padding: EdgeInsets.all(30.0)));
  }
}

class AddCategoryPopup extends StatefulWidget {
  AddCategoryPopup({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  _AddCategoryPopupState createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Center(
            child: ElevatedButton(
                child: Text('Добавить'),
                onPressed: () async {
                  showNotification(context, "Категория добавлена!");
                  await addCategory( widget.controller.text
                  );
                  
                  Navigator.of(context).pop();
                })),
        SizedBox(height: 40)
      ],
      content: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            Text("Добавить категорию",
                style: TextStyle(fontSize: 30.0, color: Colors.black)),
            SizedBox(height: 40),
            Field(
              ctrl: widget.controller,
              defText: "Category",
              hintText: "",
            ),
          ])),
    );
  }
}

import 'package:flutter/material.dart';
import '../shared.dart';
import '../api.dart';

class ChangeProduct extends StatefulWidget {
  ChangeProduct({Key? key, required this.product}) : super(key: key);
  Map product;
  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  _ChangeProductState createState() => _ChangeProductState();
}

class _ChangeProductState extends State<ChangeProduct> {

  @override
  void initState() {
    widget.nameController = TextEditingController(text:widget.product['name']);
    widget.countController = TextEditingController(text:widget.product['count'].toString());
    widget.priceController = TextEditingController(text:widget.product['price'].toString());
    super.initState();
  }

  var _dropDownValue = ""; 

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Изменить продукт",
                  style: TextStyle(fontSize: 30.0, color: Colors.black)),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("", style: TextStyle(fontSize: 15.0, color: Colors.grey)),
              ]),
              SizedBox(height: 70.0),
              Field(
                  hintText: "Название",
                  ctrl: widget.nameController,
                  defText: widget.product['name']
                  ),
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
              SizedBox(height: 50.0,),
              ElevatedButton(child: Text('Сохранить'), onPressed: (){
                widget.product['name'] = widget.nameController.text;
                widget.product['count'] = widget.countController.text;
                widget.product['price'] = widget.priceController.text;
                print(_dropDownValue);
                widget.product['category'] = _dropDownValue;
                saveProduct(widget.product);
                showNotification(context, "Изменено");
                Navigator.of(context).pop();

              },)
            ]),
            padding: EdgeInsets.all(30.0)));
  }
}

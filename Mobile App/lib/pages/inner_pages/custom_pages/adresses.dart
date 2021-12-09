import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class AdressesPage extends StatefulWidget {
  AdressesPage({Key? key}) : super(key: key);

  @override
  _AdressesPageState createState() => _AdressesPageState();
}

class _AdressesPageState extends State<AdressesPage> {
  Map<int, String> options = {};
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Row(children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(width:10),
        Text('Адреса доставок', style: TextStyle(fontSize: 20.0))
      ]),
      Spacer(),
      Icon(Icons.email, size: 100.0),
      SizedBox(height: 20),
      Text('Здесь нет пока адресов', style: TextStyle(fontSize: 20.0)),
      Spacer(),
    ])));
  }
}

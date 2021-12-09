import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        Text('История заказов', style: TextStyle(fontSize: 20.0))
      ]),
      Spacer(),
      Icon(Icons.history, size: 100.0),
      SizedBox(height: 20),
      Text('Здесь нет пока заказов', style: TextStyle(fontSize: 20.0)),
      Spacer(),
    ])));
  }
}

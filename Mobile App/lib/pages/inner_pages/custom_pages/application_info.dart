import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class ApplicationInfoPage extends StatefulWidget {
  ApplicationInfoPage({Key? key}) : super(key: key);

  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<ApplicationInfoPage> {
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
        Text('О приложении', style: TextStyle(fontSize: 20.0))
      ]),
      Spacer(),
      Image(image: AssetImage('icon/index.png')),
      SizedBox(height: 10),
      Text('Pizza market v1.0'),
      Spacer(),
    ])));
  }
}

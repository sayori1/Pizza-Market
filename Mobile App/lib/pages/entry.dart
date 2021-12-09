import "package:flutter/material.dart";
import './city_choice.dart';
import './controller/controller.dart';

class EntryPage extends StatefulWidget {
  EntryPage({Key? key}) : super(key: key);

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  void initState() {
    getCategories();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => CityChoicePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Icon(Icons.local_pizza, size: 100.0),
          Text('Pizza market', style: TextStyle(fontSize: 20.0))
        ])));
  }
}

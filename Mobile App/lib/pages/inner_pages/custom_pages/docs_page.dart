import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class DocsPage extends StatefulWidget {
  DocsPage({Key? key}) : super(key: key);

  @override
  _DocsPageState createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
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
        Text('Профиль', style: TextStyle(fontSize: 20.0))
      ]),
      Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
          child: Column(children: [
            SizedBox(height: 10),
            OptionButton(text: 'Бонусная программа', onTap: () {}),
            OptionButton(text: 'Калорийность и состав', onTap: () {}),
            OptionButton(text: 'Полные условия акций', onTap: () {}),
            OptionButton(text: 'Оферта', onTap: () {}),
            OptionButton(
                text: 'Условия обработки персональных данных', onTap: () {}),
            OptionButton(
                text: 'Анализ сетей пиццерий в России и Казахстане',
                onTap: () {}),
            OptionButton(text: 'Пользовательское соглашение', onTap: () {}),
          ]))
    ])));
  }
}

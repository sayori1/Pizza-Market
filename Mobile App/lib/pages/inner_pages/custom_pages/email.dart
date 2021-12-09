import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class EmailPage extends StatefulWidget {
  TextEditingController TextController = TextEditingController();
  EmailPage({Key? key}) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
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
        SizedBox(width: 10),
        Text('Написать e-mail', style: TextStyle(fontSize: 20.0)),
        Spacer(),
        TextButton(
          child: Text('Отправить'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
        )
      ]),
      Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(hintText: "Ваша электронная почта"),
            ),
            SizedBox(height: 40),
            TextFormField(
              minLines: 4,
              maxLines: 5, // allow user to enter 5 line in textfield
              keyboardType: TextInputType
                  .multiline, // user keyboard will have a button to move cursor to next line
              controller: widget.TextController,
              style: TextStyle(color: Colors.grey.shade600),
              decoration: InputDecoration(hintText: "Ваше сообщение"),
            ),
            SizedBox(height:20),
            Container(
              width: double.infinity,
              child: PizzaButton(text:'Отправить', onTap:(){}))
          ]))
    ])));
  }
}

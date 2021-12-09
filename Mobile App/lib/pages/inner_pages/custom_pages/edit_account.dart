import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class EditAccount extends StatefulWidget {
  TextEditingController EmailController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  EditAccount({Key? key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
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
        Text('Редактировать аккаунт', style: TextStyle(fontSize: 18.0)),
        Spacer(),
        TextButton(
          child: Text('Изменить'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
        )
      ]),
      Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(hintText: user['name'], border: OutlineInputBorder(borderSide: BorderSide()),
              helperText: 'Имя'
              ),
              controller: widget.NameController,

              
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: user['email'],border: OutlineInputBorder(borderSide: BorderSide()),
              helperText: 'Почта'
              ),
              controller: widget.EmailController,
            ),
                        SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(hintText: user['birthday'],border: OutlineInputBorder(borderSide: BorderSide()),
              helperText: 'День рождения'
              ),
              controller: widget.DateController,
            ),
            SizedBox(height: 20.0),
            Container(
                width: double.infinity,
                child: PizzaButton(text: 'Сохранить', onTap: () {}))
          ]))
    ])));
  }
}

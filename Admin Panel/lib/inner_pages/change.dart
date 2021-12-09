import 'package:flutter/material.dart';
import '../shared.dart';

class SetPage extends StatelessWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Expanded(child: 
      Padding(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Настройки",
                style: TextStyle(fontSize: 30.0, color: Colors.black)),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[Text("Поменять пароль",
                style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                ]),
            SizedBox(height:70.0),
            Field(hintText: "Старый пароль",ctrl: TextEditingController(), defText: ''),
            SizedBox(height:20.0),
            Field(hintText: "Новый пароль",ctrl: TextEditingController(), defText: '')
          ]),
          padding: EdgeInsets.all(30.0)));
  }
}

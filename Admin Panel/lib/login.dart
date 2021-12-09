
import 'package:flutter/material.dart';
import './api.dart' as api;
import './shared.dart';
import './index.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  var login = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: 500,
      height: 500,
      child:
      Column(children:[
            Spacer(),
            Text('Добро пожаловать в админ панель! 👤', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 30.0,),
            Field(hintText: 'Логин', ctrl:login, defText: '',),
            SizedBox(height:10),
            Field(hintText: 'Пароль', ctrl:password, defText: ''),
            SizedBox(height:20),
            Container(width: 200, child: ElevatedButton(child: Text('Войти'), onPressed: ()async{
              var result = await api.login(login.text, password.text);
              
              if(result)
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext builder) => DashPage() ));
            })),
            Spacer(),
      ])


    ));
  }
}



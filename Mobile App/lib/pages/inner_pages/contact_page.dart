import 'package:flutter/material.dart';
import '../../pages/inner_pages/shared.dart';
import '../controller/controller.dart';
import './custom_pages/docs_page.dart';
import './custom_pages/application_info.dart';
import 'package:url_launcher/url_launcher.dart';
import './custom_pages/email.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Профиль', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 100),
              Text('Связаться с поддержкой', style: TextStyle(fontSize: 20.0)),
              SizedBox(height: 10),
              Row(children: [
                Expanded(child: PizzaButton(text: 'Позвонить', onTap: () {
                  launch('tel:89867013559');
                })),
                SizedBox(width: 10),
                Expanded(
                    child:
                        PizzaButton(text: 'Написать на e-mail', onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => EmailPage())
                              );
                        })),
              ]),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(icon: Icon(Icons.facebook, size: 50.0, color: Colors.orangeAccent.shade200), onPressed: (){}),
                IconButton(icon: Icon(Icons.inventory, size: 50.0, color: Colors.orangeAccent.shade200), onPressed: (){}),
                IconButton(icon: Icon(Icons.insert_chart, size: 50.0, color: Colors.orangeAccent.shade200), onPressed: (){}),
                IconButton(icon: Icon(Icons.invert_colors, size: 50.0, color: Colors.orangeAccent.shade200), onPressed: (){})
              ]),
              SizedBox(height: 20),
              Divider(),
              OptionButton(text:'Правовые документы', icon: Icons.arrow_right, onTap:(){
                              Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => DocsPage())
                              );
              }),
              OptionButton(text:'О приложении', icon: Icons.arrow_right, onTap:(){
                                              Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => ApplicationInfoPage())
                              );
              }),
            ])));
  }
}
import 'package:flutter/material.dart';
import '../controller/controller.dart';
import './shared.dart';
import './custom_pages/adresses.dart';
import './custom_pages/history.dart';
import './custom_pages/edit_account.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: getAccount('null'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Профиль', style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data['name'],
                                    style: TextStyle(fontSize: 30.0)),
                                IconButton(
                                  icon: Icon(Icons.settings_outlined),
                                  onPressed: () {
                                    Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => EditAccount()));
                                  },
                                )
                              ]),
                          SizedBox(height: 10),
                          Row(children: [
                            Flexible(
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(children: [
                                        Text('Персональные акции',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0))
                                      ])),
                                  decoration: BoxDecoration(
                                      gradient: RadialGradient(
                                          center: Alignment(-0.5, -0.5),
                                          radius: 3.0,
                                          colors: [
                                            Colors.green.shade100,
                                            Colors.green.shade400,
                                          ]),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                flex: 1),
                            SizedBox(width: 10),
                            Flexible(
                                child: Container(
                                    child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Коины',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0)),
                                              Text(' 0',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0)),
                                            ])),
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                            center: Alignment(-0.5, -0.5),
                                            radius: 3.0,
                                            colors: [
                                              Colors.blue.shade100,
                                              Colors.blue.shade400,
                                            ]),
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                flex: 1)
                          ]),
                          Expanded(
                              child: ListView(children: [
                            OptionButton(
                                text: 'Адреса доставок',
                                icon: Icons.delivery_dining,
                                onTap: () {
                                  Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => AdressesPage())
                              );
                                }),
                            OptionButton(
                                text: 'История заказов',
                                icon: Icons.history,
                                onTap: () {
                                  
                                                                      Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => HistoryPage()));

                                }),
                          ]))
                        ]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}


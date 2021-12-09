import 'package:flutter/material.dart';

import './inner_pages/account_page.dart';
import 'inner_pages/cart_page.dart';
import './inner_pages/menu_page.dart';
import './inner_pages/contact_page.dart';
import './controller/controller.dart';

class MainPage extends StatefulWidget {
  MainPage({this.selected = 0});
  int selected;
  createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Widget> children = [];

  @override
  void initState() {
    children = [MenuPage(), CardPage(), AccountPage(), ContactPage()];
    _selectedIndex = widget.selected;
    super.initState();
  }

  List<String> titles = ["Меню", "Корзина", "Аккаунт", "Контакты"];

  int _selectedIndex = 0;

  void tap(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
          body: children[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey.shade400,
              selectedItemColor: Colors.orangeAccent,
              unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_pizza_rounded), label: "Меню"),
                BottomNavigationBarItem(
                    icon: Stack(children: [
                      Icon(Icons.shopping_cart_outlined),
                      Positioned(
                          top: -4.0,
                          right: 0.0,
                          child: Visibility(
                            visible: selected.length > 0,
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              child: Text('${selected.length}',
                                  style: TextStyle(color: Colors.white)),
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  shape: BoxShape.circle),
                            ),
                          ))
                    ]),
                    label: "Корзина"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: "Аккаунт"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.phone), label: "Контакты"),
              ],
              currentIndex: _selectedIndex,
              onTap: tap)),
    );
  }
}

import 'package:flutter/material.dart';
import './api.dart' as api;
import './shared.dart';
import 'package:group_button/group_button.dart';
import './inner_pages/stats.dart';
import './inner_pages/warehouse.dart';
import './inner_pages/change.dart';


class DashPage extends StatefulWidget {
  DashPage({Key? key, this.widget = null}) : super(key: key);

  Widget? widget;

  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  var buttons = ["Статистика", "Склад", "Настройки", "Выйти"];

  var selected = 1;

  @override
  void initState() {
    api.category();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(children: [
      Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            SizedBox(height: 100.0),
            GroupButton(
              //selectedColor: Colors.transparent,
              unselectedColor: Colors.transparent,
              crossGroupAlignment: CrossGroupAlignment.start,
              buttons: buttons,
              direction: Axis.vertical,
              onSelected: (index, isSelected) {
                setState((){
                  widget.widget = null;
                  selected = index;
                });
                
              },
              selectedButton: selected,
              spacing: 10.0,
              unselectedTextStyle:
                  TextStyle(fontSize: 20.0, color: Colors.black),
              selectedTextStyle: TextStyle(fontSize: 20.0),
              buttonHeight: 30.0,
              buttonWidth: 200.0,
            ),
            Spacer()
          ])),
      Builder(
        builder: (BuildContext context) {
          if(widget.widget != null){
            return widget.widget!;
          }
          else if (selected == 0)
            return StatsPage();
          else if (selected == 1)
            return WarehousePage();
          else if (selected == 2)
            return SetPage();
          else
            return WarehousePage();
        },
      )
    ]));
  }
}

class DashButton extends StatelessWidget {
  DashButton({Key? key, required this.text}) : super(key: key);
  var text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text), onPressed: () {});
  }
}

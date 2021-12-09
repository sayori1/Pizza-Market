import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:draw_graph/models/feature.dart';
import './change_product.dart';
import './../api.dart';
import '../index.dart';
import './add_product.dart';

class WarehousePage extends StatefulWidget {
  const WarehousePage({Key? key}) : super(key: key);

  @override
  State<WarehousePage> createState() => _WarehousePageState();
}

class _WarehousePageState extends State<WarehousePage> {
  @override
  Widget build(BuildContext context) {
    
    return Expanded(
        child: Padding(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Склад",
                  style: TextStyle(fontSize: 30.0, color: Colors.black)),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Склад всех товаров",
                    style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                Row(children: [
                  ElevatedButton(
                      onPressed: () async {
                        var result = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext builder) =>
                                    DashPage(widget: AddProduct())));
                        setState(() {});
                      },
                      child: Text('Добавить продукт')),
                      SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () async {
                        await showDialog(context: context, builder: (BuildContext builder) => AddCategoryPopup());
                        setState(() {
                        });
                        category();
                      },
                      child: Text('Добавить категорию')),
                ])
              ]),
              SizedBox(height: 70.0),
              GridX(),
            ]),
            padding: EdgeInsets.all(30.0)));
  }
}

class GridX extends StatefulWidget {
  GridX({Key? key}) : super(key: key);

  @override
  State<GridX> createState() => _GridXState();
}

class _GridXState extends State<GridX> {
  List<String> headings = [
    "Название",
    "Кол-во",
    "Категория",
    "Цена",
  ];

  List<String> keys = [
    'name',
    'count',
    'category',
    'price',
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: products(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<DataRow> rows = [];
            for (var i = 0; i < snapshot.data.length; i += 1) {
              var item = snapshot.data[i];
              rows.add(DataRow(
                  onSelectChanged: (bool) async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext builder) => DashPage(
                                widget: ChangeProduct(
                              product: item,
                            ))));
                    setState((){});
                  },
                  cells: [
                    DataCell(Text(item['name'])),
                    DataCell(Text(item['count'].toString())),
                    DataCell(Text(item['category'])),
                    DataCell(Text(item['price'].toString())),
                  ]));
            }

            return Container(
                width: double.infinity,
                child: DataTable(
                    columnSpacing: 100.0,
                    showCheckboxColumn: false,
                    columns: [
                      DataColumn(label: Text('Название')),
                      DataColumn(label: Text('Кол-во')),
                      DataColumn(label: Text('Категория')),
                      DataColumn(label: Text('Цена')),
                    ],
                    rows: rows));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

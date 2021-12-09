import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:draw_graph/models/feature.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      Padding(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Статистика",
                style: TextStyle(fontSize: 30.0, color: Colors.black)),
            SizedBox(height: 10.0),
            Text("Метрика, статистика использования",
                style: TextStyle(fontSize: 15.0, color: Colors.grey)),
          ]),
          padding: EdgeInsets.all(30.0)),
      Expanded(
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            LineGraph(
              features: [
                Feature(
                  title: "Кол-во покупок",
                  color: Colors.blue,
                  data: [0.3, 0.4, 0.5, 0.6, 0.7, 0.8],
                )
              ],
              size: Size(420, 450),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
              labelY: ['25', '45', '65', '75', '85', '100'],
              showDescription: true,
              graphColor: Colors.black87,
            ),
            SizedBox(width: 100.0),
            LineGraph(
              features: [
                Feature(
                  title: "Кол-во запуска приложения",
                  color: Colors.green,
                  data: [0.3, 0.4, 0.5, 0.6, 0.7, 0.8],
                )
              ],
              size: Size(420, 450),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
              labelY: ['25', '45', '65', '75', '85', '100'],
              showDescription: true,
              graphColor: Colors.black87,
            ),
          ]),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
            LineGraph(
              features: [
                Feature(
                  title: "Кол-во покупок",
                  color: Colors.blue,
                  data: [0.3, 0.4, 0.5, 0.6, 0.7, 0.8],
                )
              ],
              size: Size(420, 450),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
              labelY: ['25', '45', '65', '75', '85', '100'],
              showDescription: true,
              graphColor: Colors.black87,
            ),
            SizedBox(width: 100.0),
            LineGraph(
              features: [
                Feature(
                  title: "Кол-во запуска приложения",
                  color: Colors.orange,
                  data: [0.3, 0.4, 0.5, 0.6, 0.7, 0.8],
                )
              ],
              size: Size(420, 450),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
              labelY: ['25', '45', '65', '75', '85', '100'],
              showDescription: true,
              graphColor: Colors.black87,
            ),
          ]),
        ]),
      )
    ])));
  }
}

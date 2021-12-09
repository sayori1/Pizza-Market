import "package:flutter/material.dart";
import '../shared.dart' as shared;
import './controller/controller.dart' as controller;
import '../pages/inner_pages/menu_page.dart';
import '../pages/main_page.dart';

class CityChoicePage extends StatefulWidget {
  CityChoicePage({Key? key}) : super(key: key);

  @override
  _CityChoicePageState createState() => _CityChoicePageState();
}

class _CityChoicePageState extends State<CityChoicePage> {
  List<String> listToShow = shared.cities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      SearchBar(onChange: (value) {
        setState(
          () {
            listToShow = findCity(value);
          },
        );
      }, onFocusLose: () {
        setState(() {
          listToShow = shared.cities;
        });
      }),
      Divider(),
      Expanded(
          child: ListView.builder(
        itemCount: listToShow.length,
        itemBuilder: (BuildContext context, int id) {
          return CityList(value: listToShow[id]);
        },
      ))
    ])));
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({Key? key, required this.onChange, required this.onFocusLose})
      : super(key: key);

  Function(String) onChange;
  Function() onFocusLose;
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    if (!active) {
      return ListTile(
          title: Text('Поиск по названию', style: shared.body),
          trailing: IconButton(
              icon: Icon(Icons.search, size: 35.0),
              onPressed: () {
                setState(() {
                  active = true;
                });
              }));
    } else {
      return ListTile(
          title: TextField(
            onChanged: widget.onChange,
            style: shared.body,
            decoration: InputDecoration(
                hintText: 'Введите название города',
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
          trailing: IconButton(
              icon: Icon(Icons.close, size: 35.0),
              onPressed: () {
                setState(() {
                  active = false;
                  widget.onFocusLose();
                });
              }));
    }
  }
}

class CityList extends StatefulWidget {
  String value;
  bool active = false;
  CityList({Key? key, required this.value}) : super(key: key);

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ListTile(
            title: Text(widget.value, style: shared.body),
            trailing: widget.active ? CircularProgressIndicator() : null),
        onTap: () {
          setState(() {
            widget.active = true;
            controller.city = widget.value;
          });
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MainPage(selected: 0)));
        });
  }
}

findCity(String value) {
  value = "${value[0].toUpperCase()}${value.substring(1)}";
  List<String> matches = [];
  outer:
  for (var i = 0; i < shared.cities.length; i++) {
    for (var j = 0; j < value.length; j++) {
      if (shared.cities[i][j] != value[j]) continue outer;
    }
    matches.add(shared.cities[i]);
  }
  return matches;
}

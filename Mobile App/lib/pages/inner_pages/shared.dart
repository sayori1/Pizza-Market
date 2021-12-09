import 'dart:ffi';

import 'package:flutter/material.dart';
import '../controller/controller.dart';
import './custom_pages/add_to_cart.dart';

const TextStyle body = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 20,
);

const TextStyle body1 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 15,
);

class ButtonSwitch extends StatefulWidget {
  ButtonSwitch({Key? key, required this.values, required this.select})
      : super(key: key);

  List<String> values = [];
  Function(int) select;

  @override
  _ButtonSwitchState createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  @override
  int selected = 0;
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < widget.values.length; i++) {
      var child = Expanded(
          child: MaterialButton(
              child: Text(widget.values[i]),
              onPressed: () {
                setState(() {
                  selected = i;
                });
                widget.select(i);
              },
              color: selected == i ? Colors.white : Colors.grey.shade300));
      widgets.add(child);
    }

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    ));
  }
}

class ButtonTab extends StatefulWidget {
  Function onTap;
  Future? future;
  List<String> values;
  ButtonTab({required this.onTap, this.future = null, this.values = const []});

  createState() => ButtonTabState();
}

class ButtonTabState extends State<ButtonTab> {
  int selectedId = 0;
  Widget build(BuildContext context) {
    if (widget.future != null) {
      return FutureBuilder(
          future: widget.future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Widget> children = [];
              for (int i = 0; i < snapshot.data.length; i += 1) {
                children.add(PizzaButton(
                    text: snapshot.data[i],
                    onTap: () {
                      setState(() {
                        widget.onTap(i, snapshot.data[i]);
                        selectedId = i;
                      });
                    },
                    active: selectedId == i));
                children.add(SizedBox(width: 20));
              }
              return SizedBox(
                  child: ListView(
                      scrollDirection: Axis.horizontal, children: children),
                  height: 40);
            }
            return Center(child: CircularProgressIndicator());
          });
    } else {
      List<Widget> children = [];
      for (int i = 0; i < widget.values.length; i += 1) {
        children.add(PizzaButton(
            text: widget.values[i],
            onTap: () {
              setState(() {
                widget.onTap(i, widget.values[i]);
                selectedId = i;
              });
            },
            active: selectedId == i));
        children.add(SizedBox(width: 20));
      }
      return SizedBox(
          child: ListView(scrollDirection: Axis.horizontal, children: children),
          height: 40);
    }
  }
}

class PizzaButton extends StatefulWidget {
  PizzaButton(
      {Key? key,
      this.active = true,
      required this.text,
      required this.onTap,
      this.id = 0,
      this.selectedId = -1})
      : super(key: key);

  String text = "";
  bool active;
  VoidCallback onTap;
  int id;
  int selectedId;

  @override
  _PizzaButtonState createState() => _PizzaButtonState();
}

class _PizzaButtonState extends State<PizzaButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.selectedId != -1) widget.active = widget.selectedId == widget.id;
    return TextButton(
      child: Text(widget.text),
      onPressed: widget.onTap,
      style: ButtonStyle(
          backgroundColor: widget.active
              ? MaterialStateProperty.all<Color>(
                  Colors.orangeAccent.shade100.withOpacity(0.5))
              : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)))),
    );
  }
}

class ProductTile extends StatelessWidget {
  ProductTile({Key? key, required this.product, this.children = const []})
      : super(key: key);
  final Product product;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                        image: NetworkImage(baseURL + '/images/' + product.image),
                        width: 100,
                        height: 100),
                    SizedBox(width: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(product.name, style: TextStyle(fontSize: 20.0)),
                          SizedBox(height: 10),
                          Text(
                            product.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w300),
                          ),
                          PizzaButton(
                              text: product.price.toString() + ' ₽',
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddToCartPage(product: product)));
                              }),
                        ]),
                  ],
                ),
                Column(children: children)
              ])),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    AddToCartPage(product: product)));
          }),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key? key, required this.onChange}) : super(key: key);

  Function onChange;
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  Function? onChange;
  @override
  void initState() {
    this.onChange = widget.onChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.grey.shade100.withOpacity(0.5),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Text('-', style: TextStyle(color: Colors.black)),
            onPressed: () {
              setState(() {
                count -= 1;
                if (count < 1) {
                  count = 1;
                }
              });
              onChange!(count);
            },
          ),
          Text('${count}'),
          FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Text('+', style: TextStyle(color: Colors.black)),
            onPressed: () {
              setState(() {
                count += 1;
              });
              onChange!(count);
            },
          ),
        ]));
  }
}

class SimpleButton extends StatelessWidget {
  const SimpleButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: SizedBox(
            width: double.infinity,
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.7)))),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade100),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))));
  }
}

void showNotification(context, text, icon, color, {delay = 1}) {
  SnackBar bar = SnackBar(
    backgroundColor: color,
    content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Icon(icon), Text(text)]),
    duration: Duration(seconds: delay),
  );
  ScaffoldMessenger.of(context).showSnackBar(bar);
}

class OptionButton extends StatelessWidget {
  OptionButton(
      {Key? key, required this.text, this.icon = null, required this.onTap})
      : super(key: key);

  final String text;
  IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(children: [
          ListTile(
              title: Text(text),
              trailing: icon == null ? Icon(null) : Icon(icon)),
          Divider()
        ]),
        onTap: onTap);
  }
}

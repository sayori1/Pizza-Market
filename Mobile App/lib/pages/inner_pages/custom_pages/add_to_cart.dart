import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';
import '../cart_page.dart';
import '../../main_page.dart';

class AddToCartPage extends StatefulWidget {
  AddToCartPage({Key? key, required this.product}) : super(key: key);

  Product product;

  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  Map<int, String> options = {};
  int count = 1;
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.product.options.length; i += 1) {
      options[i] = widget.product.options[i][0];
    }
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                child: Stack(children: [
                  ListView(children: [
                    Image(image: NetworkImage(baseURL + '/images/' + widget.product.image)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.product.name,
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w600)),
                          Icon(Icons.info)
                        ]),
                    SizedBox(height: 10),
                    Text(widget.product.description),
                    SizedBox(height: 30),
                    Builder(builder: (BuildContext context) {
                      List<Widget> widgets = [];
                      for (int i = 0;
                          i < widget.product.options.length;
                          i += 1) {
                        widgets.add(ButtonTab(
                            values: widget.product.options[i],
                            onTap: (i, value) {
                              options[i] = value;
                            }));
                        widgets.add(SizedBox(
                          height: 10,
                        ));
                      }
                      return Column(children: widgets);
                    }),
                    SizedBox(height: 200)
                  ]),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Стоимость:', style: body),
                                Text(
                                    (widget.product.price * count).toString() +
                                        ' P',
                                    style: body)
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Counter(onChange: (i) {
                            setState(() {
                              count = i;
                            });
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              width:double.infinity,
                              child: PizzaButton(
                                  text: "Купить",
                                  onTap: () {
                                    setState(() {
                                      selected.add(CardProduct(
                                          product: widget.product,
                                          count: count,
                                          options: options.values.toList()));
                                    });
                                    showNotification(
                                        context,
                                        "Товар добавлен в корзину",
                                        Icons.shopping_cart,
                                        Colors.green);
                                  })),
                        ]))
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MainPage(selected: 1)));
                          },
                        )
                      ])
                ]))));
  }
}

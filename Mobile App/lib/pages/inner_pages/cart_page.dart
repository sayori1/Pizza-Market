import 'package:flutter/material.dart';
import '../controller/controller.dart';
import './shared.dart';
import './custom_pages/order.dart';

class CardPage extends StatefulWidget {
  CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int price = 0;
  @override
  Widget build(BuildContext context) {
    if (selected.length != 0) {
      int countP = 0;
      price = 0;
      List<Widget> prods = [];
      for (var i = 0; i < selected.length; i += 1) {
        countP += selected[i].count;
        price += selected[i].product.price * selected[i].count;
        prods.add(ProductCartWidget(
            product: selected[i],
            onDelete: () {
              setState(() {
                selected.remove(selected[i]);
              });
            },
            onChange: (i) {}));
      }
      prods.add(SizedBox(height: 50));

      var text = '  ${countP}';
      if (countP == 1)
        text += ' товар';
      else if (countP < 5)
        text += ' товара';
      else
        text += ' товаров';

      text += ' на ${price} ₽';

      return SafeArea(
          child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20),
          Text(text, style: body, textAlign: TextAlign.left),
          SizedBox(height: 10),
          Expanded(child: ListView(children: prods))
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(children: [
                    SizedBox(height: 10.0),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                          flex: 1,
                          child: PizzaButton(
                              text: "Завершить",
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OrderPage(totalPrice: price)));
                              }))
                    ])
                  ])))
        ])
      ]));
    } else {
      return SafeArea(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
        Icon(Icons.shopping_cart_rounded, size: 100.0),
        SizedBox(height: 10.0),
        Text('Вы пока не выбрали ничего',
            style: TextStyle(fontSize: 20.0, color: Colors.black))
      ])));
    }
  }
}

class ProductCartWidget extends StatefulWidget {
  ProductCartWidget(
      {required this.product, required this.onChange, required this.onDelete});

  CardProduct product;
  Function onChange;
  Function onDelete;

  @override
  _ProductCartWidgetState createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  CardProduct? product;
  Function? onChange;
  @override
  void initState() {
    product = widget.product;
    onChange = widget.onChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (dir) {
          widget.onDelete();
        },
        child: Container(
            child: Column(children: [
          ProductTile(
            product: product!.product,
            children: [
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text((product!.product.price * product!.count).toString() +
                    ' P'),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text('-',
                                style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              setState(() {
                                product!.count -= 1;
                                if (product!.count < 1) {
                                  product!.count = 1;
                                }
                              });
                              onChange!(product!.count);
                            },
                          ),
                          Text('${product!.count}'),
                          FlatButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text('+',
                                style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              setState(() {
                                product!.count += 1;
                              });
                              onChange!(product!.count);
                            },
                          ),
                        ])),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.onDelete();
                  },
                ),
              ])
            ],
          ),
        ])));
  }
}

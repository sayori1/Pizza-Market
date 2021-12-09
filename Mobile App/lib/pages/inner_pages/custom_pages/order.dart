import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../shared.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key, required this.totalPrice}) : super(key: key);
  int totalPrice;

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Map<int, String> options = {};
  int count = 1;

  bool delivery = false;
  bool pay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(width: 10),
                        Text('Оформить заказ', style: TextStyle(fontSize: 20.0))
                      ]),
                      SizedBox(height: 20),
                      Text('  Способ доставки',
                          style: TextStyle(fontSize: 20.0)),
                      SizedBox(height: 20),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                    child: Row(children: [
                                      SizedBox(width: 10),
                                      Icon(Icons.delivery_dining),
                                      Text('   С собой'),
                                      Spacer(),
                                      Icon(delivery ? Icons.check : null)
                                    ]),
                                    onPressed: () {
                                      setState(() {
                                        delivery = true;
                                      });
                                    }),
                                Divider(),
                                TextButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black)),
                                    child: Row(children: [
                                      SizedBox(width: 10),
                                      Icon(Icons.restaurant),
                                      Text('   В зале'),
                                      Spacer(),
                                      Icon(delivery ? null : Icons.check)
                                    ]),
                                    onPressed: () {
                                      setState(() {
                                        delivery = false;
                                      });
                                    }),
                              ])),
                      SizedBox(height: 20),
                      Text('  Способ оплаты', style: TextStyle(fontSize: 20.0)),
                      SizedBox(height: 20),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                    child: Row(children: [
                                      SizedBox(width: 10),
                                      Icon(Icons.run_circle),
                                      Text('   Google pay'),
                                      Spacer(),
                                      Icon(pay ? null : Icons.check)
                                    ]),
                                    onPressed: () {
                                      setState(() {
                                        pay = false;
                                      });
                                    }),
                                Divider(),
                                TextButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black)),
                                    child: Row(children: [
                                      SizedBox(width: 10),
                                      Icon(Icons.card_membership),
                                      Text('   По карте'),
                                      Spacer(),
                                      Icon(pay ? Icons.check : null)
                                    ]),
                                    onPressed: () {
                                      setState(() {
                                        pay = true;
                                      });
                                    }),
                              ])),
                      Spacer(),
                      SimpleButton(text: "Оплатить", onTap: (){
                        sendOrder(widget.totalPrice);
                      }),
                      SizedBox(height:10.0)

                    ]))));
  }
}

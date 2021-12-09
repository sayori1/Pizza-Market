import 'package:flutter/material.dart';
import 'dart:convert';
import './shared.dart';
import '../controller/controller.dart';
import './custom_pages/add_to_cart.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: ListView(
              shrinkWrap: true,
              children: [
              SizedBox(height: 20),
              TopPanel(),
              SizedBox(height: 30),
              AdBar(future: getNews()),
              SizedBox(height: 20),
              Align(
                  child: Text("Вам понравится", style: body),
                  alignment: Alignment.bottomLeft),
              SizedBox(height: 10),
              ProductBar(future: getProductsHighlighted()), 
              SizedBox(height: 10),
              ButtonTab(
                  onTap: (i, value) {
                    setState(() {
                      selectedCat = value;
                    });
                  },
                  future: getCategories()),
              SizedBox(height:20),
              ProductList(future: getProductsByCategory(selectedCat)) 
            ])));
  }
}

class TopPanel extends StatefulWidget {
  TopPanel({Key? key}) : super(key: key);

  @override
  _TopPanelState createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  int deliveryType = 0;

  Widget build(BuildContext context) {
    Widget bottomButton;

    if (deliveryType == 0) {
      bottomButton = MaterialButton(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Выбрать адрес доставки'),
            Icon(Icons.arrow_forward)
          ]),
          onPressed: () {});
    } else {
      bottomButton = MaterialButton(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Выбрать адрес пункта'),
            Icon(Icons.keyboard_arrow_up_rounded)
          ]),
          onPressed: () {});
    }

    return Center(
        child: Container(
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(children: [
            ButtonSwitch(
                values: ['На доставку', 'В зале'],
                select: (id) {
                  setState(() {
                    deliveryType = id;
                  });
                }),
            Divider(height: 1,),
            bottomButton,
          ])),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200),
    ));
  }
}

class AdBar extends StatelessWidget {
  AdBar({Key? key, required this.future}) : super(key: key);

  Future future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Widget> ads = [];

            for (int i = 0; i < snapshot.data.length; i++) {
              ads.add(AdCard(
                  image: snapshot.data[i]['image'],
                  text: snapshot.data[i]['text']));
              ads.add(SizedBox(width: 10));
            }

            return SizedBox(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ads,
              ),
              height: 100,
            );
          } else {
            List<Widget> ads = [];
            for (int i = 0; i < 10; i++) {
              ads.add(AdCard(image: '', text: ''));
              ads.add(SizedBox(width: 10));
            }

            return SizedBox(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ads,
              ),
              height: 100,
            );
          }
        });
  }
}

class AdCard extends StatelessWidget {
  AdCard({Key? key, required this.image, required this.text}) : super(key: key);

  String image;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
/*             image: DecorationImage(
                image: AssetImage('images/indexd.png'), fit: BoxFit.cover) */
            color: Colors.grey.shade300),
        child: Padding(
            padding: EdgeInsets.only(bottom: 4.0, left: 4.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(text, style: TextStyle(color: Colors.white)))));
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.product}) : super(key: key);

  Product product;
  @override
  Widget build(BuildContext context) {
    return Card(

        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image(image: NetworkImage(baseURL + '/images/' + product.image)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(product.name, style: body1),
                      PizzaButton(
                          text: product.price.toString() + 'P', onTap: () {
                            print('tap');
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:(BuildContext context) => AddToCartPage(product: product))
                              );
                          })
                    ])
              ],
            )));
  }
}

class ProductBar extends StatelessWidget {
  ProductBar({Key? key, required this.future}) : super(key: key);

  Future future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Widget> prods = [];

            for (int i = 0; i < snapshot.data.length; i++) {
              prods.add(ProductCard(product: snapshot.data[i]));
              prods.add(SizedBox(width: 10));
            }

            return SizedBox(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: prods,
              ),
              height: 100,
            );
          } else {
            List<Widget> prods = [];

            return SizedBox(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: prods,
              ),
              height: 100,
            );
          }
        });
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key, required this.future}) : super(key: key);

  Future future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          List<Widget> widgets = [];
          for(int i = 0; i < snapshot.data.length; i+=1){

            widgets.add(ProductTile(product: snapshot.data[i]));
          }
          return Column(children: widgets);
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      }
      );
  }
}
import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue;
  String descriptionValue;
  double priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Product title"),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ), TextField(
            decoration: InputDecoration(labelText: "Product decription"),
            maxLines: null,
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ), TextField(
            decoration: InputDecoration(labelText: "Product price"),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          RaisedButton(child: Text("Save"), onPressed: () {
            final Map<String, dynamic> product = <String, dynamic>{
              "title": titleValue,
              "description": descriptionValue,
              "price": priceValue,
              "image": "assets/food.jpg"
            };
            widget.addProduct(product);
          },),
        ],
      ),
    );
  }
}
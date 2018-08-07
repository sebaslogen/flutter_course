import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: buildProductItem,
            itemCount: products.length,
          )
        : Center(
            child: Text("No products found, please add some"),
          );
  }

  Card buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/food.jpg"),
          Text(products[index])
        ],
      ),
    );
  }
}

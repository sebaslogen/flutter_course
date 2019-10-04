import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  const ProductManager(this.products);

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: Products(products)),
      ],
    );
  }
}

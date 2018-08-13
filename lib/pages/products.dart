import 'package:flutter/material.dart';
import 'package:flutter_course/pages/Menu.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProductsMenu(),
        appBar: AppBar(
          title: Text("Products list"),
        ),
        body: ProductManager(products, addProduct, deleteProduct));
  }
}

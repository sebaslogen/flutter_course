import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products_admin_menu.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage(this.products);

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProductsAdminMenu(),
        appBar: AppBar(
          title: const Text('Products list'),
        ),
        body: ProductManager(products));
  }
}

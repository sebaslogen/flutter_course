import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products_menu.dart';
import 'package:flutter_course/pages/product_create.dart';
import 'package:flutter_course/pages/product_list.dart';

class ProductAdminPage extends StatelessWidget {
  const ProductAdminPage(this.addProduct, this.deleteProduct);

  final Function addProduct;
  final Function deleteProduct;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: ProductsMenu(),
        appBar: AppBar(
          title: const Text('Manage products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Products',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          ProductCreatePage(addProduct),
          ProductListPage(),
        ]),
      ),
    );
  }
}

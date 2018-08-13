import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/pages/products.dart';

class ProductsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Choose"),
          ),
          ListTile(
            title: Text("Manage products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/admin");
            },
          ),
          ListTile(
            title: Text("Products page"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}

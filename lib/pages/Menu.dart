import 'package:flutter/material.dart';

class ProductsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: const Text('Manage products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
          ListTile(
            leading: Icon(Icons.shop_two),
            title: const Text('All products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }
}

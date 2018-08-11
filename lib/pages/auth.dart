import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("LOGIN"),
          onPressed: () {
            Navigator.pushReplacement<bool, bool>(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductsPage()),
            );
          },
        ),
      ),
    );
  }
}

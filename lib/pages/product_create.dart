import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
            child: Text("Create a product"),
            onPressed: () {
              showModalBottomSheet<Widget>(
                  context: context, builder: (BuildContext context) {
                    return Center(child: Text("Modal"),);
              });
            }));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Widget required to pass information back also on back-button
      onWillPop: () {
        Navigator.pop(context, false); // Manually pop passing our own data
        return Future
            .value(false); // Required but value is false to avoid a 2nd pop
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(padding: EdgeInsets.all(10.0), child: Text(title)),
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text("Back"),
                  color: Theme.of(context).accentColor,
                  onPressed: () => Navigator.pop(context, true),
                ),
              )
            ],
          )),
    );
  }
}

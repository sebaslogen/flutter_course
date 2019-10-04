import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(this.title, this.description, this.price, this.imageUrl);

  final String title;
  final String description;
  final double price;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Widget required to pass information back also on back-button
      onWillPop: () {
        Navigator.pop(context, false); // Manually pop passing our own data
        return Future.value(
            false); // Required but value is false to avoid a 2nd pop
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oswald'))),
                Container(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 10.0),
                    child: Text(description,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center)),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$' + price.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )),
    );
  }
}

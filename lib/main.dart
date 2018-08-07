import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Required for debug paint

import './product_manager.dart';

void main() {
//  debugPaintSizeEnabled = true; // Show sizes, margins and paddings
//  debugPaintBaselinesEnabled = true; // Show text baselines
//  debugPaintPointersEnabled = true; // Show touch events
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, accentColor: Colors.deepPurple),
      home: Scaffold(
          appBar: AppBar(
            title: Text("first stage"),
          ),
          body: ProductManager()),
//          body: ProductManager(startingProduct: "Food tester")),
    );
  }
}

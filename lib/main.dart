import 'package:flutter/material.dart';
import 'package:flutter_course/pages/auth.dart';
import 'package:flutter_course/pages/product_admin.dart';
import 'package:flutter_course/pages/products.dart';
//import 'package:flutter/rendering.dart'; // Required for debug paint

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
//      home: AuthPage(), // This can not work while there is a route with root '/'
      routes: {
        "/" : (BuildContext context) => ProductsPage(),
        "/admin" : (BuildContext context) => ProductAdminPage(),
      },
    );
  }
}

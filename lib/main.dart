import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppSate();
  }
}

class _MyAppSate extends State<MyApp> {
  List<String> _products = ["Food tester"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("first stage"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text("Add product"),
                onPressed: () {
                  setState(() {
                    _products.add("new product");
                  });
                },
              ),
            ),
            Column(
              children: _products
                  .map(
                    (element) => Card(
                          child: Column(
                            children: <Widget>[
                              Image.asset("assets/food.jpg"),
                              Text(element)
                            ],
                          ),
                        ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

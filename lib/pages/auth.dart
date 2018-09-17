import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
//              setState(() {
//                descriptionValue = value;
//              });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String value) {
//              setState(() {
//                priceValue = double.parse(value);
//              });
              },
            ),
            RaisedButton(
              child: Text("LOGIN"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/products");
              },
            ),
          ]),
        ),
      ),
    );
  }
}

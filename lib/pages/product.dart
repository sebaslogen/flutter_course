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
                  child: Text("Delete"),
                  color: Theme.of(context).accentColor,
                  onPressed: () => _showDialogWarning(context),
                ),
              )
            ],
          )),
    );
  }

  void _showDialogWarning(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure?"),
            content: Text("This action can not be reverted"),
            actions: <Widget>[
              FlatButton(
                child: Text("DISCARD"),
                onPressed: () {
                  Navigator.pop(context); // Closes dialog
                },
              ),
              FlatButton(
                child: Text("CONTINUE"),
                onPressed: () {
                  Navigator.pop(context); // Closes dialog
                  Navigator.pop(context, true); // Closes screen with true
                },
              ),
            ],
          );
        });
  }
}

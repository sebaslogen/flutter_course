import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController),
            FlatButton(
              child: const Text('Add transation'),
              textColor: Colors.purple,
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

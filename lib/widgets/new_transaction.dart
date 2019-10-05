import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  NewTransaction(this.addNewTransaction);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addNewTransaction;

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
                addNewTransaction(titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}

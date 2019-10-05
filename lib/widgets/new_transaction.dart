import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.addNewTransaction);

  final Function addNewTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
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
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submitData(),
                controller: titleController),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
                controller: amountController),
            FlatButton(
                child: const Text('Add transation'),
                textColor: Theme.of(context).accentColor,
                onPressed: _submitData)
          ],
        ),
      ),
    );
  }

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }
    widget.addNewTransaction(enteredTitle, double.parse(enteredAmount));

    Navigator.of(context).pop();
  }
}

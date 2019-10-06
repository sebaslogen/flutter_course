import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.addNewTransaction);

  final Function addNewTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;
    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }
    widget.addNewTransaction(enteredTitle, double.parse(enteredAmount), _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then<DateTime>((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
                controller: _titleController),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
                controller: _amountController),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No date chosen'
                      : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                ),
                FlatButton(
                  child: const Text(
                    'Choose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: _presentDatePicker,
                )
              ],
            ),
            RaisedButton(
                child: const Text('Add transation'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData)
          ],
        ),
      ),
    );
  }
}

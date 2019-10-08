import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import 'adaptive_flat_button.dart';

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
    widget.addNewTransaction(
        enteredTitle, double.parse(enteredAmount), _selectedDate);

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
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => _submitData(),
                  controller: _titleController),
              TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
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
                  AdaptiveFlatButton('Choose date', _presentDatePicker)
                ],
              ),
              isIOS
                  ? CupertinoButton(
                      child: const Text('Add transation'),
                      color: Theme.of(context).primaryColor,
                      onPressed: _submitData)
                  : RaisedButton(
                      child: const Text('Add transation'),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed: _submitData)
            ],
          ),
        ),
      ),
    );
  }
}

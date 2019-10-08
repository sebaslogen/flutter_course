

import 'package:flutter/material.dart';
import 'package:flutter_course/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FittedBox(
                child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            )),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat.yMMMEd().format(transaction.date),
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColorLight)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          textColor: Theme.of(context).errorColor,
          onPressed: () => deleteTransaction(transaction.id),
        )
            : IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTransaction(transaction.id),
        ),
      ),
    );
  }
}
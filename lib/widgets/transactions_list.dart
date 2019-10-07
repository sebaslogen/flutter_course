import 'package:flutter/material.dart';
import 'package:flutter_course/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList(this.transactions, this.deleteTransaction);

  final List<Transaction> transactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (_, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(height: 10),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              final tx = transactions[index];
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
                            '\$${tx.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )),
                  title: Text(
                    tx.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(DateFormat.yMMMEd().format(tx.date),
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColorLight)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                          label: const Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTransaction(tx.id),
                        ),
                ),
              );
            },
            itemCount: transactions.length);
  }
}

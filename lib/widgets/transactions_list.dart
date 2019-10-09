import 'package:flutter/material.dart';
import 'package:flutter_course/models/transaction.dart';
import 'package:flutter_course/widgets/transaction_item.dart';

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
            itemBuilder: (_, index) {
              final transaction = transactions[index];
              return TransactionItem(
                  // This key is used to avoid incorrect list updates when any child is a stateful widget
                  key: ValueKey(transaction.id),
                  transaction: transaction,
                  deleteTransaction: deleteTransaction);
            },
            itemCount: transactions.length);
  }
}

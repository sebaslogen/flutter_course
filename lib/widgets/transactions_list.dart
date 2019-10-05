import 'package:flutter/material.dart';
import 'package:flutter_course/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemBuilder: (context, index) {
            final tx = transactions[index];
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$${tx.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark, width: 2)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 4, left: 10, right: 10),
                      child: Text(
                        tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 10, left: 10, right: 10),
                      child: Text(DateFormat.yMMMEd().format(tx.date),
                          style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColorLight)),
                    )
                  ],
                )
              ],
            ));
          },
          itemCount: transactions.length),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_course/models/transaction.dart';

import 'chart.dart';
import 'transactions_list.dart';

class MainBody extends StatefulWidget {
  const MainBody(this.userTransactions, this.deleteTransaction,
      this.availableContentHeight);

  final Function deleteTransaction;
  final List<Transaction> userTransactions;
  final double availableContentHeight;

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  bool _showChar = false;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (isLandscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Show Chart', style: Theme.of(context).textTheme.title),
              Switch.adaptive(
                value: _showChar,
                onChanged: (value) {
                  setState(() {
                    _showChar = value;
                  });
                },
              )
            ],
          ),
        if (isLandscape)
          _showChar
              ? Expanded(child: Chart(widget.userTransactions))
              : Expanded(
                  child: txContainerBuilder(widget.availableContentHeight, 1)),
        if (!isLandscape)
          Container(
            // We use a fix height so the chart columns can distribute their sizes with flexible
            height: widget.availableContentHeight * 0.3,
            child: Chart(widget.userTransactions),
          ),
        if (!isLandscape) txContainerBuilder(widget.availableContentHeight, 0.7)
      ],
    ));
  }

  Container txContainerBuilder(
      double availableContentHeight, double percentage) {
    return Container(
        height: availableContentHeight * percentage,
        child: TransactionsList(
            widget.userTransactions, widget.deleteTransaction));
  }
}

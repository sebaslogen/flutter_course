import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transactions_list.dart';
//import 'package:flutter/rendering.dart'; // Required for debug paint

void main() {
//  debugPaintSizeEnabled = true; // Show sizes, margins and paddings
//  debugPaintBaselinesEnabled = true; // Show text baselines
//  debugPaintPointersEnabled = true; // Show touch events
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses planner',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1',
        title: 'New shiny shoes',
        amount: 69.99,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 't2',
        title: 'Weekly groceries',
        amount: 16.53,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 't3', title: 'Loooong', amount: 123.99, date: DateTime.now()),
  ];

  bool _showChar = false;

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date == null ? DateTime.now() : date);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet<void>(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _deleteTransaction(String transactionId) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == transactionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('Expenses planner'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    final mediaQuery = MediaQuery.of(context);
    final availableContentHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        appBar.preferredSize.height;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final txListContainer = Container(
        height: availableContentHeight * 0.7,
        child: TransactionsList(_userTransactions, _deleteTransaction));
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Show Chart'),
                  Switch(
                    value: _showChar,
                    onChanged: (value) {
                      setState(() {
                        _showChar = value;
                      });
                    },
                  )
                ],
              ),
            if (!isLandscape)
              Container(
                // We use a fix height so the chart columns can distribute their sizes with flexible
                height: availableContentHeight * 0.3,
                child: Chart(_userTransactions),
              ),
            if (!isLandscape) txListContainer,
            if (isLandscape)
              _showChar
                  ? Container(
                      // We use a fix height so the chart columns can distribute their sizes with flexible
                      height: availableContentHeight * 0.7,
                      child: Chart(_userTransactions),
                    )
                  : txListContainer
          ],
        ),
      ),
    );
  }
}

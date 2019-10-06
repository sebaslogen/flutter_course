import 'package:flutter/material.dart';
import 'package:flutter_course/models/transaction.dart';
import 'package:flutter_course/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final totalSum = recentTransactions
          .where((item) =>
              item.date.day == weekDay.day &&
              item.date.month == weekDay.month &&
              item.date.year == weekDay.year)
          .fold<double>(0.0, (sum, value) => sum + value.amount);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionsValues.fold<double>(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: groupedTransactionsValues.map((item) {
            return ChartBar(item['day'], item['amount'],
                totalSpending == 0.0 ? 0.0 : (item['amount'] as double) / totalSpending);
          }).toList(),
        ));
  }
}

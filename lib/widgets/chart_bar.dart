import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, boxConstraints) {
      return Column(
        children: <Widget>[
          Container(
              height: boxConstraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
          // FittedBox makes the text shrink
          SizedBox(height: boxConstraints.maxHeight * 0.05),
          Container(
              height: boxConstraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentageOfTotal == 0.0
                        ? 0.0
                        : max(spendingPercentageOfTotal, 0.12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              )),
          SizedBox(height: boxConstraints.maxHeight * 0.05),
          Container(
              height: boxConstraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}

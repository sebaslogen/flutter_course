import 'package:flutter/material.dart';
import 'package:flutter_course/providers/orders_provider.dart' as orders;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(this.order);

  final orders.OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle:
                Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

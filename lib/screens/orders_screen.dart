import 'package:flutter/material.dart';
import 'package:flutter_course/providers/orders_provider.dart' show Orders;
import 'package:flutter_course/widgets/app_drawer.dart';
import 'package:flutter_course/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orderData'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) => OrderItem(orderData.orders[i])),
    );
  }
}

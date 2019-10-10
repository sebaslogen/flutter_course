import 'package:flutter/material.dart';
import 'package:flutter_course/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(this.productId, this.id, this.price, this.quantity, this.title);

  final String productId;
  final String id;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Dismissible(
        key: ValueKey(id),
        background: Container(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            color: Theme.of(context).errorColor,
            margin: const EdgeInsets.only(right: 15, top: 4, bottom: 4),
            padding: const EdgeInsets.only(left: 16)),
        direction: DismissDirection.startToEnd,
        onDismissed: (_) => Provider.of<Cart>(context, listen: false).removeItem(productId),
        child: Card(
          margin: const EdgeInsets.only(right: 15, top: 4, bottom: 4),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FittedBox(child: Text('\$$price')),
                ),
              ),
              title: Text(title),
              subtitle: Text('Total: \$${price * quantity}'),
              trailing: Text('$quantity x'),
            ),
          ),
        ),
      ),
    );
  }
}

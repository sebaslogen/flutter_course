import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/providers/cart_provider.dart' show Cart;
import 'package:flutter_course/providers/orders_provider.dart';
import 'package:flutter_course/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Consumer<Cart>(
                  builder: (ctx, cart, _) {
                    final items = cart.items;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Total',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Spacer(),
                        Chip(
                          label: Text(
                            '\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .primaryTextTheme
                                    .title
                                    .color),
                          ),
                          backgroundColor: Theme
                              .of(context)
                              .primaryColor,
                        ),
                        const SizedBox(width: 10),
                        FlatButton(
                          child: const Text('Order Now'),
                          textColor: Theme
                              .of(context)
                              .primaryColor,
                          onPressed: () {
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(
                                items.values.toList(), cart.totalAmount);
                            cart.clear();
                          },
                        )
                      ],
                    );
                  }),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<Cart>(
                builder: (ctx, cart, _) {
                  final items = cart.items;
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (ctx, i) {
                        final item = items.values.toList()[i];
                        return CartItem(items.keys.toList()[i], item.id,
                            item.price, item.quantity, item.title);
                      });
                }),
          )
        ],
      ),
    );
  }
}

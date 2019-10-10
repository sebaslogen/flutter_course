import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/providers/cart_provider.dart' show Cart;
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
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Consumer<Cart>(
                      builder: (ctx, cart, _) => Chip(
                            label: Text(
                              '\$${cart.totalAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .title
                                      .color),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          )),
                  FlatButton(
                    child: const Text('Order Now'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Consumer<Cart>(
                builder: (ctx, cart, _) => ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) {
                      final item = cart.items.values.toList()[i];
                      return CartItem(
                          item.id, item.price, item.quantity, item.title);
                    })),
          )
        ],
      ),
    );
  }
}

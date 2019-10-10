import 'package:flutter/cupertino.dart';

class CartItem {
  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});

  final String id;
  final String title;
  final int quantity;
  final double price;
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.isEmpty
        ? 0
        : _items.values
            .fold<int>(0, (total, cartItem) => total + cartItem.quantity);
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (oldCardItem) => CartItem(
              id: oldCardItem.id,
              title: oldCardItem.title,
              price: oldCardItem.price,
              quantity: oldCardItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }
}

// cart_provider.dart
import 'package:flutter/material.dart';

// class CartProvider with ChangeNotifier {
//   int _itemCount = 0;

//   int get itemCount => _itemCount;

//   void addItemToCart() {
//     _itemCount++;
//     notifyListeners();
//   }
// }
class CartItem {
  final String name;
  final double price;

  CartItem(this.name, this.price);
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  void addItemToCart(String name, double price) {
    _cartItems.add(CartItem(name, price));
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

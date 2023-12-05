// cart_provider.dart
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _itemCount = 0;

  int get itemCount => _itemCount;

  void addItemToCart() {
    _itemCount++;
    notifyListeners();
  }
}

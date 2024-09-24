import 'package:flutter/material.dart';

class Shoe {
  final String name;
  final double price;
  final String imageUrl;

  Shoe({required this.name, required this.price, required this.imageUrl});
}

class CartModel with ChangeNotifier {
  final List<Shoe> _cartItems = [];

  List<Shoe> get cartItems => _cartItems;

  void addToCart(Shoe shoe, String s) {
    _cartItems.add(shoe);
    notifyListeners(); 
  }

  void removeFromCart(Shoe shoe) {
    _cartItems.remove(shoe); 
    notifyListeners(); 
  }

  
  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item.price); // Calculate the total price
  }
}

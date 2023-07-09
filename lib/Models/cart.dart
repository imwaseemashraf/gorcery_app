import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItem = [
    ["Tomato", "8.00", 'assets/images/1.png', Colors.grey],
    ["Sugar", "2.00", 'assets/images/2.png', Colors.redAccent],
    ["Ghee", "9.00", 'assets/images/3.png', Colors.green],
    ["Milk", "4.00", 'assets/images/4.png', Colors.orange],
    ["Eggs", "6.00", 'assets/images/5.png', Colors.blueGrey],
    ["Bread", "5.00", 'assets/images/6.png', Colors.blue],
    ["National", "55.00", 'assets/images/7.png', Colors.greenAccent],
    ["Vital", "45.00", 'assets/images/8.png', Colors.yellowAccent],
    ["Tea", "14.00", 'assets/images/9.png', Colors.teal],
    ["Salt", "23.00", 'assets/images/10.png', Colors.blueGrey],
    ["Vitamin", "53.00", 'assets/images/11.png', Colors.orangeAccent],
    ["Biscuit", "135.00", 'assets/images/12.png', Colors.deepPurpleAccent],
    ["Cake", "125.00", 'assets/images/13.png', Colors.deepPurple],
    ["Pasta", "50.00", 'assets/images/14.png', Colors.brown],
    ["Burger", "15.00", 'assets/images/15.png', Colors.deepOrange],
  ];

  List _shopItems = [];
  get cartItems => _shopItems;

  get shopItems => _shopItem;
  void addItemToCart(int index) {
    cartItems.add(shopItems[index]);
    notifyListeners();
  }

  void removeItemsFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

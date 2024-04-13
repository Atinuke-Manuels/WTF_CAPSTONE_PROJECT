import 'package:flutter/material.dart';

import '../../../global/common/toast.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List<dynamic>> _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Laundry", "1000", "assets/home/serviceImages/serviceIg3.png", Colors.white],
    ["Iron", "500", "assets/home/serviceImages/serviceImg2.png", Colors.white],
    ["laundry & Iron", "1500", "assets/home/serviceImages/serviceImg1.png", Colors.white],
    ["Dry Clean", "700", "assets/home/serviceImages/serviceImg4.png",Colors.white],
    ["Stain Removal", "950", "assets/home/serviceImages/serviceImg5.png", Colors.white],
    ["Special Services", "1500", "assets/home/serviceImages/serviceImg1.png", Colors.white],
  ];

  // list of cart items
  List<List<dynamic>> _cartItems = [];

  int _itemCount = 1; // Default itemCount

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  int get itemCount => _itemCount;

  set itemCount(int value) {
    _itemCount = value;
    notifyListeners();
  }

  // add item to cart
  void addItemToCart(int index, double totalPrice) {
    if (index >= 0 && index < _shopItems.length) {
      // Check if the item is already in the cart
      if (!_cartItems.contains(_shopItems[index])) {
        // If not, add it to the cart with the correct total price
        _cartItems.add([_shopItems[index][0], totalPrice.toString(), _shopItems[index][2], _shopItems[index][3]]);
        notifyListeners();
      } else {
        showToast(message: 'Item already exists in cart.');
      }
    } else {
      print('Invalid index: $index');
    }
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

  // Increment item count
  void incrementItemCount() {
    _itemCount++;
    notifyListeners();
  }

  // Decrement item count
  void decrementItemCount() {
    if (_itemCount > 1) {
      _itemCount--;
      notifyListeners();
    }
  }

}

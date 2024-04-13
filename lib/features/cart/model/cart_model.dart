import 'package:flutter/material.dart';

import '../../../global/common/toast.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List<dynamic>> _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["Laundry", "1000", "assets/home/serviceImages/serviceIg3.png", Colors.white],
    ["Iron", "500", "assets/home/serviceImages/serviceImg2.png", Colors.white],
    ["laundry & Iron", "1500", "assets/home/serviceImages/serviceImg1.png", Colors.white],
    ["Dry Clean", "700", "assets/home/serviceImages/serviceImg4.png", Colors.white],
    ["Stain Removal", "950", "assets/home/serviceImages/serviceImg5.png", Colors.white],
    ["Special Services", "1500", "assets/home/serviceImages/serviceImg1.png", Colors.white],
  ];

  // Map to store item counts
  final Map<int, int> _itemCounts = {};

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
      String itemId = _shopItems[index][0];
      bool itemAlreadyInCart = _cartItems.any((item) => item[0] == itemId);

      if (!itemAlreadyInCart) {
        // If the item is not already in the cart, add it
        _cartItems.add([itemId, totalPrice.toString(), _shopItems[index][2], _shopItems[index][3]]);
        notifyListeners();
      } else {
        // If the item is already in the cart, show a message
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

  int getItemCountForIndex(int index) {
    // Return the item count for the given index
    return _itemCounts[index] ?? _itemCount;
  }

  void incrementItemCountForIndex(int index) {
    // Increment the item count for the given index
    int count = _itemCounts[index] ?? 0;
    _itemCounts[index] = count + 1;
    notifyListeners();
  }

  void decrementItemCountForIndex(int index) {
    // Decrement the item count for the given index
    int count = _itemCounts[index] ?? 0;
    if (count > 1) {
      _itemCounts[index] = count - 1;
      notifyListeners();
    }
  }
}

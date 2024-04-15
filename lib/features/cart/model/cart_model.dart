import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../global/common/toast.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List<dynamic>> _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["T-Shirt", "500", "assets/shopItems/tShirt.png", Colors.white],
    ["Jeans", "1300", "assets/shopItems/jeans.jpg", Colors.blue],
    ["Dress Shirt", "1800", "assets/shopItems/dressShirt.jpg", Colors.white],
    ["Skirt", "950", "assets/shopItems/skirt.jpg", Colors.pink],
    ["Blouse", "1100", "assets/shopItems/blouse.jpg", Colors.white],
    ["Sweater", "1400", "assets/shopItems/sweater.jpg", Colors.grey],
    ["Hoodie", "1700", "assets/shopItems/hoodie.jpg", Colors.black],
    ["Jacket", "2000", "assets/shopItems/jacket.jpg", Colors.black],
    ["Coat", "650", "assets/shopItems/coat.jpg", Colors.grey],
    ["Dress", "800", "assets/shopItems/dress.jpg", Colors.pink],
    ["Suit", "1100", "assets/shopItems/suit.jpg", Colors.black],
    ["Pants", "1400", "assets/shopItems/pants.jpg", Colors.grey],
    ["Shorts", "1700", "assets/shopItems/shorts.jpg", Colors.blue],
    ["Blazer", "2000", "assets/shopItems/blazer.jpg", Colors.black],
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
    } else {
      // Remove the item count from the map if it reaches 0
      _itemCounts.remove(index);
      notifyListeners();
    }
  }
}

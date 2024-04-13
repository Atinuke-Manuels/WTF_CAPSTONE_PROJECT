import 'package:flutter/material.dart';
import 'package:laundry_ease/global/common/toast.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Laundry", "1000", "assets/home/serviceImages/serviceIg3.png", Colors.white],
    ["Iron", "500", "assets/home/serviceImages/serviceImg2.png", Colors.white],
    ["laundry & Iron", "1500", "assets/home/serviceImages/serviceImg1.png", Colors.white],
    ["Dry Clean", "700", "assets/home/serviceImages/serviceImg4.png",Colors.white],
    ["Stain Removal", "950", "assets/home/serviceImages/serviceImg5.png", Colors.white],
    ["Special Services", "1500", "assets/home/serviceImages/serviceImg1.png", Colors.white],

  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    if (index >= 0 && index < _shopItems.length) {
      // Check if the item is already in the cart
      if (!_cartItems.contains(_shopItems[index])) {
        // If not, add it to the cart
        _cartItems.add(_shopItems[index]);
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
}
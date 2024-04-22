import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/features/home/pages/home_page.dart';

import '../../../gen/assets.gen.dart';
import '../../onboarding/widgets/button_item.dart';
import 'add_to_cart.dart';

class CartPage extends StatelessWidget {
  final int? totalItems;

  const CartPage({Key? key, this.totalItems = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (contex)=> HomePage()));
          },
          child: Icon(FontAwesomeIcons.arrowLeft, size: 20),
        ),
        title: Text(
          "Cart Page",
          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Image.asset(Assets.home.cart.shoppingCart.path),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  totalItems! > 0 && totalItems != null
                      ? Text(
                    "Your laundry cart has $totalItems item(s).",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  )
                      : Text(
                    "Your laundry cart is empty. Please add items for washing.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  ButtonItem(
                    title: "+ Add item",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddToCart()),
                      );
                    },
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

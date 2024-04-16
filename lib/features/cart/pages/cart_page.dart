import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/features/cart/pages/add_to_cart.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

import '../../../gen/assets.gen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.arrowLeft, size: 20,)),
        title: Text("Cart Page", style: TextStyle(color: Theme.of(context).primaryColor)),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04.h,),
                  Image.asset(Assets.home.cart.shoppingCart.path),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12.h,),
                  Text("Your laundry cart is empty. Please add items for washing. ", textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07.h,),
                  ButtonItem(title: "+ Add item", onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddToCart()), // Corrected the builder parameter
                    );
                  }, textColor: Theme.of(context).primaryColor,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

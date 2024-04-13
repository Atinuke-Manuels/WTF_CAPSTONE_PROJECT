import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/features/cart/pages/cart_details_page.dart';
import 'package:laundry_ease/features/cart/widgets/service_tiles.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(FontAwesomeIcons.arrowLeft, size: 20),
        ),
        title: Text("Add to cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Services",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12), // Add some spacing between text and grid view
              Consumer<CartModel>(
                builder: (context, value, child) {
                  return Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true, // Keep shrinkWrap true
                      padding: const EdgeInsets.all(12),
                      itemCount: value.shopItems.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1,
                      ),
                      itemBuilder: (context, index) {
                        return ServiceItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          // color: value.shopItems[index][3],
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .addItemToCart(index),
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 12), // Add some spacing between grid view and button
              ButtonItem(
                title: "Continue",
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CartDetailsPage();
                    },
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

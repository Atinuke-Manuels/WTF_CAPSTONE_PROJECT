import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../global/common/toast.dart';
import '../model/cart_model.dart';
import 'cart_summary_page.dart';

class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart Details", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          final totalItems = value.cartItems.length; // Get total items
          double totalPrice = 0.0;
          try {
            totalPrice = double.parse(value.calculateTotal());
          } catch (e) {
            // Handle parsing error
            // You can show an error message, use a default value, or skip the item
            // Example:
            showToast(message: "Error parsing total price: ${e.toString()}");
            // totalPrice = 0; // Or any default value
          } // Get total price

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: totalItems,
                    padding: EdgeInsets.all(6),
                    itemBuilder: (context, index) {
                      final itemCount = value.getItemCountForIndex(index);
                      double totalPrice = double.parse(value
                          .cartItems[index][1]) * 1;
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(value.cartItems[index][2]),
                              height: 36,
                            ),
                            title: Text(
                              '${value.cartItems[index][0]} x $itemCount',
                              style: const TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              '₦$totalPrice',
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.close, size: 24,),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // total amount + pay now

              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[200]),
                          ),

                          const SizedBox(height: 8),
                          // total price
                          Text(
                            '₦${value.calculateTotal()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),

                      // pay now
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartSummaryPage(totalItems: totalItems,
                                      totalPrice: totalPrice),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                'Pay Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
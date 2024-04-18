import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/cart/pages/payment_methods.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';
import 'package:intl/intl.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Map<String, dynamic> serviceProviderData;
  final DateTime pickupDate;
  final String pickupAddress;
  final String otherDetails;
  final int totalItems;
  final double totalPrice;

  BookingConfirmationPage({
    required this.serviceProviderData,
    required this.pickupDate,
    required this.pickupAddress,
    required this.otherDetails,
    required this.totalItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Confirmation',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Access other details from serviceProviderData
            SizedBox(height: 30.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        serviceProviderData['serviceImage'],
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Laundry',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight),
                      ),
                      Text(
                        serviceProviderData['titleText'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Flexible(
                              child: Text(
                                serviceProviderData['address'],
                                style: TextStyle(fontSize: 7),
                                overflow: TextOverflow
                                    .clip, // or TextOverflow.ellipsis
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey,
            ),
            // Display other information as before
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Date: '),
                Text(
                  "${DateFormat('yyyy-MM-dd | HH:mm').format(DateTime.now())}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pickup Date:'),
                Text(
                  pickupDate.toString().substring(0, 10),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pickup Address:'),
                Expanded(
                  child: Text(
                    pickupAddress,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip, // or TextOverflow.ellipsis
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Other Details:'),
                Expanded(
                  child: Text(
                    '$otherDetails',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip, // or TextOverflow.ellipsis
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Items:'),
                Text(
                  '$totalItems',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price:'),
                Text('\₦$totalPrice',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            SizedBox(
              height: 180.h,
            ),
            ButtonItem(
              title: "Proceed to payment",
              onPress: () {
                // Navigate to the next page with the total price as a parameter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentMethods(totalPrice: totalPrice),
                  ),
                );
              },
              backgroundColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

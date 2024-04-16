

import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  final String serviceProvider;
  final DateTime pickupDate;
  final String pickupAddress;
  final String otherDetails;
  final int totalItems;
  final double totalPrice;

  BookingConfirmationPage({
    required this.serviceProvider,
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
        title: Text('Booking Confirmation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Provider: $serviceProvider'),
            Text('Pickup Date: ${pickupDate.toString().substring(0, 10)}'),
            Text('Pickup Address: $pickupAddress'),
            Text('Other Details: $otherDetails'),
            Text('Total Items: $totalItems'),
            Text('Total Price: \₦$totalPrice'),
            ElevatedButton(
              onPressed: () {
                // Handle submission logic
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

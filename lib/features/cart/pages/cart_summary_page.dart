import 'package:flutter/material.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

import '../../home/widgets/laundry_service_provider/service_provider_section_item_data.dart';
import 'booking_confirmation_page.dart';

class CartSummaryPage extends StatefulWidget {
  final int totalItems;
  final double totalPrice;

  const CartSummaryPage({
    Key? key,
    required this.totalItems,
    required this.totalPrice,
  }) : super(key: key);

  @override
  _CartSummaryPageState createState() => _CartSummaryPageState();
}

class _CartSummaryPageState extends State<CartSummaryPage> {
  DateTime? selectedDate;
  String? selectedServiceProvider;
  TextEditingController _pickupAddressController = TextEditingController();
  TextEditingController _otherDetailsController = TextEditingController();

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Summary', style: TextStyle(color: Theme.of(context).primaryColor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Total Items: ${widget.totalItems}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Total Price: \₦${widget.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            // Dropdown to select service provider
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Service Provider',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    width: double.infinity, // Adjust the width as needed
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor), // Add a border
                      borderRadius: BorderRadius.circular(8.0), // Add border radius for rounded corners
                    ),
                    child: DropdownButton<String>(
                      value: selectedServiceProvider,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedServiceProvider = newValue;
                        });
                      },
                      isExpanded: true, // Set to true to expand the dropdown button
                      items: serviceProviderData.map((Map<String, dynamic> provider) {
                        return DropdownMenuItem<String>(
                          value: provider['titleText'],
                          child: Text(provider['titleText']),
                        );
                      }).toList(),
                      icon: Icon(Icons.arrow_drop_down), // Set a custom dropdown icon
                      iconSize: 24, // Adjust the icon size as needed
                      iconEnabledColor: Colors.black, // Adjust the icon color as needed
                    ),
                  ),
                ],
              ),
            ),
            // Section to select pickup date
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Pickup Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8),
                          Text(selectedDate != null
                              ? selectedDate!.toString().substring(0, 10)
                              : 'Select Date'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Section to set pickup address
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                controller: _pickupAddressController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Set Pickup Address',
                  labelStyle: TextStyle(fontSize: 14.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            // Section to add additional info (e.g., preferred detergent)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                controller: _otherDetailsController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Other Details (e.g., Preferred Detergent)',
                  labelStyle: TextStyle(fontSize: 14.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor), // Change the border color
                  ),
                ),
              ),
            ),

            // Button to proceed to payment options
            ButtonItem(
              title: "Continue",
              onPress: () {
                // Inside onPressed of the "Proceed to Payment Options" button
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingConfirmationPage(
                      serviceProviderData: serviceProviderData.firstWhere((provider) => provider['titleText'] == selectedServiceProvider),
                      pickupDate: selectedDate!,
                      pickupAddress: _pickupAddressController.text,
                      otherDetails: _otherDetailsController.text,
                      totalItems: widget.totalItems,
                      totalPrice: widget.totalPrice,
                    ),
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
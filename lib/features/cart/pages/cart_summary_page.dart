import 'package:flutter/material.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

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
        title: Text('Cart Summary'),
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
                        border: Border.all(color: Colors.grey),
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
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Set Pickup Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Section to add additional info (e.g., preferred detergent)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Other Details (e.g., Preferred Detergent)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Button to proceed to payment options
            ButtonItem(title: "Proceed to Payment Options", onPress: (){}, backgroundColor: Theme.of(context).primaryColor,)
          ],
        ),
      ),
    );
  }
}

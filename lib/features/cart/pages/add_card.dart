import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/cart/pages/payment_successful_page.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:laundry_ease/global/common/toast.dart';
import 'package:uuid/uuid.dart';

class AddCard extends StatefulWidget {
  final double totalPrice;

  AddCard({required this.totalPrice});

  @override
  _AddCardState createState() => _AddCardState();
}


class _AddCardState extends State<AddCard> {
  TextEditingController _cardHolderController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  bool _showCardNumber = false;
  bool _showCvv = false;
  bool _isAddCardAndProcessPayment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          reverse: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name of Card Holder",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _cardHolderController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "John Han",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Amount",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '\₦${widget.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Card Number",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        obscureText: !_showCardNumber,
                        decoration: InputDecoration(
                          hintText: "**** **** **** ****",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showCardNumber = !_showCardNumber;
                        });
                      },
                      child: Icon(
                        _showCardNumber ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expiry Date",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
                            controller: _dateController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CVV",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _cvvController,
                                  keyboardType: TextInputType.number,
                                  obscureText: !_showCvv,
                                  decoration: InputDecoration(
                                    hintText: "000",
                                    hintStyle: TextStyle(color: Colors.grey.shade400),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showCvv = !_showCvv;
                                  });
                                },
                                child: Icon(
                                  _showCvv ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/home/cart/mastercard.png",
                    width: 60.w,
                    height: 40.h,
                  ),
                  Image.asset(
                    "assets/home/cart/verveCard.jpg",
                    width: 60.w,
                    height: 40.h,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ButtonItem(
                title: _isAddCardAndProcessPayment ? "Processing..." : "Make Payment",
                onPress: () {
                  _addCardAndProcessPayment();
                },
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cardHolderController.dispose();
    _cardNumberController.dispose();
    _dateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _addCardAndProcessPayment() async {

    var uuid = Uuid();
    var idempotencyKey = uuid.v4();
    // Construct the request body
    var requestBody = {
      'idempotency_key': idempotencyKey,
      'amount_money': {'amount': (widget.totalPrice * 100).toInt(), 'currency': 'USD'}, // Amount in cents
      'source_id': 'cnon:card-nonce-ok', // Square's test card nonce
    };

    try {
      // Make HTTP request to Square's Payments API
      final response = await http.post(
        Uri.parse('https://connect.squareupsandbox.com/v2/payments'),
        headers: {
          'Authorization': 'Bearer EAAAl89T8nMUR_L0tFbXLXtV9yNmb_Nf7r9uGtHl9JU_R5uYfv1x-0TEwaP7aiTG', // Replace with your Square access token
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Payment successful
        showToast(message:'Payment successful');
        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccessfulPage(amount: widget.totalPrice,)));
        // Navigate to success page or perform other actions as needed
      } else {
        // Payment failed
        print('Payment failed: ${response.body}');
        // Show error message to the user
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Payment Failed'),
              content: Text('There was an error processing your payment. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print('Error: $error');
      // Show error message to the user
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while processing your payment. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

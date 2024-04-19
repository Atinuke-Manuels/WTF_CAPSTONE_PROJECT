import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/cart/pages/payment_successful_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:laundry_ease/global/common/toast.dart';
import 'package:uuid/uuid.dart';

import '../../onboarding/widgets/button_item.dart';

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

  String? _cardHolderError;
  String? _cardNumberError;
  String? _dateError;
  String? _cvvError;

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
              if (_cardHolderError != null)
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    _cardHolderError!,
                    style: TextStyle(color: Colors.red, fontSize: 8),
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
              if (_cardNumberError != null)
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    _cardNumberError!,
                    style: TextStyle(color: Colors.red, fontSize: 8),
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
                        if (_dateError != null)
                          Padding(
                            padding: EdgeInsets.only(left: 16.0, top: 4.0),
                            child: Text(
                              _dateError!,
                              style: TextStyle(color: Colors.red, fontSize: 8),
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
                        if (_cvvError != null)
                          Padding(
                            padding: EdgeInsets.only(left: 16.0, top: 4.0),
                            child: Text(
                              _cvvError!,
                              style: TextStyle(color: Colors.red, fontSize: 8),
                            ),
                          ),
                      ],
                    ),
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
    setState(() {
      _cardHolderError = null;
      _cardNumberError = null;
      _dateError = null;
      _cvvError = null;
    });

    String cardHolder = _cardHolderController.text.trim();
    String cardNumber = _cardNumberController.text.trim();
    String date = _dateController.text.trim();
    String cvv = _cvvController.text.trim();

    if (cardHolder.isEmpty) {
      setState(() {
        _cardHolderError = "Card holder name is required";
      });
      return;
    }

    if (cardNumber.isEmpty) {
      setState(() {
        _cardNumberError = "Card number is required";
      });
      return;
    } else if (cardNumber.length != 16 ) {
      setState(() {
        _cardNumberError = "Invalid card number. Expected 16 digits";
      });
      return;
    }
    if (date.isEmpty) {
      setState(() {
        _dateError = "Expiry date is required";
      });
      return;
    } else {
      // Check if the date contains exactly 4 characters
      if (date.length != 4) {
        setState(() {
          _dateError = "Invalid expiry date";
        });
        return;
      }

      // Extract month and year directly
      String monthString = date.substring(0, 2);
      String yearString = date.substring(2);

      int month = int.tryParse(monthString) ?? 0;
      int year = int.tryParse(yearString) ?? 0;

      // Get the current month and year
      DateTime now = DateTime.now();
      int currentYear = now.year % 100; // Extract last two digits of the current year
      int currentMonth = now.month;

      // Check if the month is between 1 and 12
      if (month < 1 || month > 12) {
        setState(() {
          _dateError = "Invalid month";
        });
        return;
      }

      // Check if the year is not earlier than the current year
      if (year < currentYear || (year == currentYear && month < currentMonth)) {
        setState(() {
          _dateError = "Expiry date must not be earlier than today";
        });
        return;
      }

      // Date format is valid
      setState(() {
        _dateError = null;
      });
    }


    if (cvv.isEmpty) {
      setState(() {
        _cvvError = "CVV is required";
      });
      return;
    } else if (cvv.length != 3) {
      setState(() {
        _cvvError = "Invalid CVV";
      });
      return;
    }

    // If all validations pass, proceed with payment
    // Your payment processing logic goes here

    var uuid = Uuid();
    var idempotencyKey = uuid.v4();
    // Construct the request body
    var requestBody = {
      'idempotency_key': idempotencyKey,
      'amount_money': {
        'amount': (widget.totalPrice * 100).toInt(),
        'currency': 'USD'
      }, // Amount in cents
      'source_id': 'cnon:card-nonce-ok', // Square's test card nonce
    };

    try {
      // Make HTTP request to Square's Payments API
      final response = await http.post(
        Uri.parse('https://connect.squareupsandbox.com/v2/payments'),
        headers: {
          'Authorization': 'Bearer EAAAl89T8nMUR_L0tFbXLXtV9yNmb_Nf7r9uGtHl9JU_R5uYfv1x-0TEwaP7aiTG',
          // Replace with your Square access token
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Payment successful
        showToast(message: 'Payment successful');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentSuccessfulPage(amount: widget.totalPrice,)),
        );
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

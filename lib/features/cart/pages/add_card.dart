import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

class AddCard extends StatefulWidget {
  final double totalPrice;

  AddCard({required this.totalPrice});

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _cardHolderController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Name of Card Holder",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
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
                    SizedBox(height: 10), // Add spacing between fields
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Amount",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _amountController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText:
                              '\₦${widget.totalPrice.toStringAsFixed(2)}',
                          // suffix: Text('\₦${widget.totalPrice.toStringAsFixed(2)}'),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Card Number",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _cardNumberController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "**** **** **** ****",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Expiry Date",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
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
                                    border: InputBorder.none,
                                    hintText: "00/00",
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "CVV",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextField(
                                  controller: _cvvController,
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "000",
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Image.asset("assets/home/cart/mastercard.png", width: 60.w, height: 40.h,),
                      Image.asset("assets/home/cart/verveCard.jpg", width: 60.w, height: 40.h,),
                    ],)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ButtonItem(
              title: "Add Card",
              onPress: () {},
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cardHolderController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}

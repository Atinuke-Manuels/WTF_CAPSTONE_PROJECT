import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

import '../../../global/common/toast.dart';
import 'add_card.dart';

class PaymentMethods extends StatefulWidget {
  final Map<String, dynamic> serviceProviderData;
  final double totalPrice;
  final DateTime pickupDate;
  final String pickupAddress;
  final String otherDetails;
  final int totalItems;

  PaymentMethods({
    required this.totalPrice,
    required this.serviceProviderData,
    required this.pickupDate,
    required this.pickupAddress,
    required this.otherDetails,
    required this.totalItems,
  });

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int? _selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Methods',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showToast(message: "payment method inactive");
                    },
                    child: Text(
                      "Cash",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Cash",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _selectedRadio = _selectedRadio == 0
                          //       ? null
                          //       : 0; // Toggle between selected and unselected
                          // });
                        },
                        child: Radio(
                          value: 0,
                          groupValue: 1,
                          onChanged: (int? value) {
                            // print("Radio button tapped: $value");
                            // setState(() {
                            //   if (_selectedRadio == value) {
                            //     _selectedRadio =
                            //         null; // Unselect if already selected
                            //   } else {
                            //     _selectedRadio = value; // Select otherwise
                            //   }
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showToast(message: "payment method inactive");
                    },
                    child: Text(
                      "Wallet",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Wallet",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _selectedRadio = _selectedRadio == 0
                          //       ? null
                          //       : 0; // Toggle between selected and unselected
                          // });
                        },
                        child: Radio(
                          value: 0,
                          groupValue: 1,
                          onChanged: (int? value) {
                            // print("Radio button tapped: $value");
                            // setState(() {
                            //   if (_selectedRadio == value) {
                            //     _selectedRadio =
                            //         null; // Unselect if already selected
                            //   } else {
                            //     _selectedRadio = value; // Select otherwise
                            //   }
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddCard(totalPrice: widget.totalPrice,
                                serviceProviderData: widget.serviceProviderData,
                                pickupDate: widget.pickupDate,
                                pickupAddress: widget.pickupAddress,
                                otherDetails: widget.otherDetails,
                                totalItems: widget.totalItems,
                              ),
                        ),
                      );
                    },
                    child: Text(
                      "Credit & Debit Cards",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddCard(totalPrice: widget.totalPrice,
                                        serviceProviderData: widget.serviceProviderData,
                                        pickupDate: widget.pickupDate,
                                        pickupAddress: widget.pickupAddress,
                                        otherDetails: widget.otherDetails,
                                        totalItems: widget.totalItems,
                                      ),
                                ),
                              );
                            },
                            child: Text(
                              "Add Card",
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRadio = _selectedRadio == 0
                                ? null
                                : 0; // Toggle between selected and unselected
                          });
                        },
                        child: Radio(
                          value: 0,
                          groupValue: _selectedRadio,
                          onChanged: (int? value) {
                            // print("Radio button tapped: $value");
                            setState(() {
                              if (_selectedRadio == value) {
                                _selectedRadio =
                                    null; // Unselect if already selected
                              } else {
                                _selectedRadio = value; // Select otherwise
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showToast(message: "payment method inactive");
                    },
                    child: Text(
                      "Bank Transfer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBillTransfer,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Transfer",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _selectedRadio = _selectedRadio == 0
                          //       ? null
                          //       : 0; // Toggle between selected and unselected
                          // });
                        },
                        child: Radio(
                          value: 0,
                          groupValue: 1,
                          onChanged: (int? value) {
                            // print("Radio button tapped: $value");
                            // setState(() {
                            //   if (_selectedRadio == value) {
                            //     _selectedRadio =
                            //         null; // Unselect if already selected
                            //   } else {
                            //     _selectedRadio = value; // Select otherwise
                            //   }
                            // });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 156.h),
              ButtonItem(
                title: 'Pay: \₦${widget.totalPrice}',
                onPress: () {
                  if (_selectedRadio == null) {
                    showToast(message: 'Please select a payment method');
                  } else {
                    // Navigate to the confirmation page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddCard(totalPrice: widget.totalPrice, serviceProviderData: widget.serviceProviderData, pickupDate: widget.pickupDate, pickupAddress: widget.pickupAddress, otherDetails: widget.otherDetails, totalItems: widget.totalItems)));
                  }
                },
                backgroundColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

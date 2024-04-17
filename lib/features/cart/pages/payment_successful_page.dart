import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/home/pages/home_page.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

import '../../profile/widgets/sign_out_dialog.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  final double amount;

  PaymentSuccessfulPage({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Payment Successful'),
          ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/home/cart/paymentsuccessful.png",
                width: MediaQuery.of(context).size.width * 0.6.w,
                height: MediaQuery.of(context).size.height * 0.4.w,
              ),
              Text(
                'Payment of \₦${amount.toStringAsFixed(2)} was successful!!',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'Track your booking from the homepage',
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 40.h,),
              ButtonItem(title: "Back To Homepage", onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }, backgroundColor: Theme.of(context).primaryColor,),
              SizedBox(height: 10.h,),
              ButtonItem(title: "Log Out", onPress: (){
                showSignOutDialog(context);
              }, textColor: Theme.of(context).primaryColor,),
            ],
          ),
        ),
      ),
    );
  }
}

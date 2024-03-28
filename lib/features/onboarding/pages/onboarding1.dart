import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/onboarding/pages/onboarding2.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/onboarding_button.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h,),
                Image.asset(
                  Assets.onboarding.onboarding1Png.path,
                  height: 371.h,
                  width: 339.w,
                ),
                SizedBox(height: 50.h,),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(children: [
                    Text("Welcome to LaundryEase", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
                    SizedBox(height: 18.h,),
                    Text(
                      "Make your laundry routine with LaundryEase. Convenient scheduling and easy payments for effortless laundry care",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade800),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingButton(
                        title: "Skip",
                        textColor: Theme.of(context).primaryColor,
                        padding:
                        EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                        onPress: () {
                          Navigator.pushNamed(context, '/Onboarding3');
                        }),
                    OnboardingButton(
                        title: "Next",
                        backgroundColor: Theme.of(context).primaryColor,
                        padding:
                        EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                        onPress: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const Onboarding2()),
                                (Route<dynamic> route) => false,
                          );
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

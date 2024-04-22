import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/onboarding_button.dart';
import 'onboarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                Image.asset(
                  Assets.onboarding.onboarding2Png.path,
                  height: 429.h,
                  width: MediaQuery.of(context).size.width * 1,
                ),
                SizedBox(height: 30.h,),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(children: [
                    Text("Discover the benefits", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
                    SizedBox(height: 18.h,),
                    Text(
                      "Explore LaundryEase in just a few steps- schedule your pickup, track your order and enjoy freshly cleaned laundry delivered right to your doorstep.",
                      style:
                      TextStyle(fontSize: 12, color: Colors.grey.shade800),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingButton(
                        title: "Previous",
                        textColor: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                        onPress: () {
                          Navigator.pushNamed(context, '/Onboarding1');
                        }),
                    OnboardingButton(
                        title: "Next",
                        backgroundColor: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                        onPress: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const Onboarding3()),
                                (Route<dynamic> route) => false,
                          );
                        }),
                  ],
                ),
                SizedBox(height: 8.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

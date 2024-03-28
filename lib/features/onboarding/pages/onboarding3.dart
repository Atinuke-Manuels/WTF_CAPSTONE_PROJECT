import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/registration/signup/pages/register_page.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/onboarding_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  Future<void> _onGetStartedPressed(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
          (Route<dynamic> route) => false,
    );
  }

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
                  Assets.onboarding.onboarding3Png.path,
                  height: 382.h,
                  width: 319.w,
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
                  height: MediaQuery.of(context).size.height * 0.16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingButton(
                        title: "Previous",
                        textColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                        onPress: () {Navigator.pushNamed(context, '/Onboarding2');}),
                    OnboardingButton(
                        title: "Get Started",
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                        onPress: () {
                          _onGetStartedPressed(context);
                        }),
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}